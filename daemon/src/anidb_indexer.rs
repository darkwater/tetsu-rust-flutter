use md4::{Digest, Md4};
use memmap::Mmap;
use ranidb::AniDb;
use rayon::{iter::ParallelIterator, slice::ParallelSlice};
use sqlx::{Executor, Sqlite, Pool, Row};
use std::{fs::File, path::Path};
use tokio::fs;

fn ed2k_hash(file: &File) -> std::io::Result<[u8; 16]> {
    let map = unsafe { Mmap::map(file) }?;

    let hashes: Vec<[u8; 16]> = map
        .par_chunks(9728000)
        .map(Md4::digest)
        .map(Into::into)
        .collect();

    let root_hash = Md4::digest(&hashes.concat());

    Ok(root_hash.into())
}

async fn init_database(conn: &Pool<Sqlite>) {
    conn.execute(
        "CREATE TABLE IF NOT EXISTS anidb_anime (
            aid                 INTEGER PRIMARY KEY,
            dateflags           INTEGER,
            year                TEXT,
            atype               TEXT,
            related_aid_list    TEXT,
            related_aid_type    TEXT,
            romaji_name         TEXT,
            kanji_name          TEXT,
            english_name        TEXT,
            short_name_list     TEXT,
            episodes            INTEGER,
            special_ep_count    INTEGER,
            air_date            INTEGER,
            end_date            INTEGER,
            picname             TEXT,
            nsfw                BOOLEAN,
            characterid_list    TEXT,
            specials_count      INTEGER,
            credits_count       INTEGER,
            other_count         INTEGER,
            trailer_count       INTEGER,
            parody_count        INTEGER
        )",
    )
    .await
    .unwrap();

    conn.execute(
        "CREATE TABLE IF NOT EXISTS anidb_episodes (
            eid                 INTEGER PRIMARY KEY,
            aid                 INTEGER,
            length              INTEGER,
            rating              INTEGER,
            votes               INTEGER,
            epno                TEXT,
            eng                 TEXT,
            romaji              TEXT,
            kanji               TEXT,
            aired               INTEGER,
            etype               INTEGER

            -- FOREIGN KEY (aid) REFERENCES anidb_anime (aid)
        )",
    )
    .await
    .unwrap();

    conn.execute(
        "CREATE TABLE IF NOT EXISTS anidb_files (
            fid                 INTEGER PRIMARY KEY,
            aid                 INTEGER,
            eid                 INTEGER,
            gid                 INTEGER,
            state               INTEGER,
            size                INTEGER,
            ed2k                TEXT,
            colour_depth        TEXT,
            quality             TEXT,
            source              TEXT,
            audio_codec_list    TEXT,
            audio_bitrate_list  TEXT,
            video_codec         TEXT,
            video_bitrate       TEXT,
            video_resolution    TEXT,
            dub_language        TEXT,
            sub_language        TEXT,
            length_in_seconds   INTEGER,
            description         TEXT,
            aired_date          INTEGER

            -- FOREIGN KEY (aid) REFERENCES anidb_anime (aid),
            -- FOREIGN KEY (eid) REFERENCES anidb_episodes (eid),
            -- FOREIGN KEY (gid) REFERENCES anidb_groups (gid)
        )",
    )
    .await
    .unwrap();

    conn.execute(
        "CREATE TABLE IF NOT EXISTS anidb_groups (
            gid                 INTEGER PRIMARY KEY,
            rating              INTEGER,
            votes               INTEGER,
            acount              INTEGER,
            fcount              INTEGER,
            name                TEXT,
            short               TEXT,
            irc_channel         TEXT,
            irc_server          TEXT,
            url                 TEXT,
            picname             TEXT,
            foundeddate         INTEGER,
            disbandeddate       INTEGER,
            dateflags           INTEGER,
            lastreleasedate     INTEGER,
            lastactivitydate    INTEGER,
            grouprelations      TEXT
        )",
    )
    .await
    .unwrap();

    conn.execute(
        "CREATE TABLE IF NOT EXISTS anidb_indexed_files (
            path                TEXT PRIMARY KEY,
            filename            TEXT,
            filesize            INTEGER,
            fid                 INTEGER,

            UNIQUE (filename, filesize) ON CONFLICT REPLACE
            -- FOREIGN KEY (fid) REFERENCES anidb_files (fid)
        )",
    )
    .await
    .unwrap();
}

struct CachedFacade<'a> {
    anidb: &'a mut AniDb,
    conn: &'a Pool<Sqlite>,
}

macro_rules! simple_cache {
    (
        $funname:ident -> $tablename:literal ($idx:literal) -> $ranidbfun:ident -> $funret:ident,
        $questionmarks:literal:
        $($field:ident,)*
    ) => {
        async fn $funname(&mut self, id: u32) -> ranidb::$funret {
            let cached =
                sqlx::query(
                    concat!("SELECT * FROM ", $tablename, " WHERE ", $idx, " = ?;"),
                )
                .bind(&id)
                .fetch_one(self.conn)
                .await
                .and_then(|row| {
                    Ok(ranidb::$funret {
                        $( $field: row.get(stringify!($field)), )*
                    })
                });

            if let Ok(hit) = cached {
                log::debug!("found in cache");

                hit
            } else {
                let live = self
                    .anidb
                    .$ranidbfun(id)
                    .await
                    .expect("failed to get info");

                sqlx::query(
                    concat!("INSERT OR REPLACE INTO ", $tablename, " VALUES ", $questionmarks),
                )
                $( .bind(&live.$field) )*
                .execute(self.conn)
                .await
                .expect("failed to store item");

                live
            }
        }
    };
}

impl<'a> CachedFacade<'a> {
    fn new(anidb: &'a mut AniDb, conn: &'a Pool<Sqlite>) -> Self {
        Self { anidb, conn }
    }

    simple_cache! {
        get_anime -> "anidb_anime"("aid") -> anime_by_id -> Anime,
        "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)":
            aid, dateflags, year, atype, related_aid_list, related_aid_type, romaji_name,
            kanji_name, english_name, short_name_list, episodes, special_ep_count, air_date,
            end_date, picname, nsfw, characterid_list, specials_count, credits_count, other_count,
            trailer_count, parody_count,
    }

    simple_cache! {
        get_episode -> "anidb_episodes"("eid") -> episode_by_id -> Episode,
        "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)":
            eid, aid, length, rating, votes, epno, eng, romaji, kanji, aired, etype,
    }

    simple_cache! {
        get_group -> "anidb_groups"("gid") -> group_by_id -> Group,
        "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)":
            gid, rating, votes, acount, fcount, name, short, irc_channel, irc_server, url, picname,
            foundeddate, disbandeddate, dateflags, lastreleasedate, lastactivitydate, grouprelations,
    }

    async fn get_file(&mut self, path: &Path) -> Option<ranidb::File> {
        let fid: Option<(u32, String)> =
            sqlx::query(
                "SELECT fid, path FROM anidb_indexed_files WHERE path = ? OR (filename = ? AND filesize = ?);",
            )
            .bind(&*path.to_string_lossy())
            .bind(&*path.file_name().unwrap_or_default().to_string_lossy())
            .bind(
                path.metadata().map(|f| {
                    #[cfg(unix)]
                    {
                        use std::os::unix::fs::MetadataExt;
                        f.size() as i64
                    }

                    #[cfg(windows)]
                    {
                        use std::os::windows::fs::MetadataExt;
                        f.file_size() as i64
                    }

                    #[cfg(not(any(unix, windows)))]
                    -1
                }).unwrap_or_default()
            )
            .fetch_one(self.conn)
            .await
            .map(|row| (row.get(0), row.get(1)))
            .ok();

        if let Some((fid, indexed_path)) = fid {
            log::info!(
                "found in cache: {}",
                path.file_name()
                    .expect("invalid filename")
                    .to_string_lossy()
            );

            if indexed_path != path.to_string_lossy() {
                sqlx::query("UPDATE anidb_indexed_files SET path = ? WHERE path = ?")
                    .bind(&*path.to_string_lossy())
                    .bind(indexed_path)
                    .execute(self.conn)
                    .await
                    .unwrap();
            }

            sqlx::query("SELECT * FROM anidb_files WHERE fid = ?")
                .bind(&fid)
                .fetch_one(self.conn)
                .await
                .map(|row| {
                    ranidb::File {
                        fid: row.get(0),
                        aid: row.get(1),
                        eid: row.get(2),
                        gid: row.get(3),
                        state: row.get(4),
                        size: row.get(5),
                        ed2k: row.get(6),
                        colour_depth: row.get(7),
                        quality: row.get(8),
                        source: row.get(9),
                        audio_codec_list: row.get(10),
                        audio_bitrate_list: row.get(11),
                        video_codec: row.get(12),
                        video_bitrate: row.get(13),
                        video_resolution: row.get(14),
                        dub_language: row.get(15),
                        sub_language: row.get(16),
                        length_in_seconds: row.get(17),
                        description: row.get(18),
                        aired_date: row.get(19),
                    }
                })
                .ok()
        } else {
            let file = File::open(path).expect("opening file");
            let size = file.metadata().expect("metadata").len();

            log::info!("hashing {}...", path.to_string_lossy());

            let ed2k = format!(
                "{:032x}",
                u128::from_be_bytes(ed2k_hash(&file).expect("failed to hash"))
            );

            let file = match self.anidb.file_by_ed2k(size, &ed2k).await {
                Ok(file) => file,
                Err(ranidb::Error::AniDb(ranidb::responses::Error::Other(320, _))) => return None,
                e => panic!("failed to get file info: {:?}", e),
            };

            sqlx::query(
                "INSERT OR REPLACE INTO anidb_files VALUES
                    (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
            )
            .bind(&file.fid)
            .bind(&file.aid)
            .bind(&file.eid)
            .bind(&file.gid)
            .bind(&file.state)
            .bind(&file.size)
            .bind(&file.ed2k)
            .bind(&file.colour_depth)
            .bind(&file.quality)
            .bind(&file.source)
            .bind(&file.audio_codec_list)
            .bind(&file.audio_bitrate_list)
            .bind(&file.video_codec)
            .bind(&file.video_bitrate)
            .bind(&file.video_resolution)
            .bind(&file.dub_language)
            .bind(&file.sub_language)
            .bind(&file.length_in_seconds)
            .bind(&file.description)
            .bind(&file.aired_date)
            .execute(self.conn)
            .await
            .unwrap();


            sqlx::query(
                "INSERT OR REPLACE INTO anidb_indexed_files VALUES (?, ?, ?, ?)",
            )
            .bind(&*path.to_string_lossy())
            .bind(&*path.file_name().unwrap_or_default().to_string_lossy())
            .bind(path.metadata().map(|f| {
                #[cfg(unix)]
                {
                    use std::os::unix::fs::MetadataExt;
                    f.size() as i64
                }

                #[cfg(windows)]
                {
                    use std::os::windows::fs::MetadataExt;
                    f.file_size() as i64
                }

                #[cfg(not(any(unix, windows)))]
                -1
            }).unwrap_or_default())
            .bind(&file.fid)
            .execute(self.conn)
            .await
            .expect("failed to store indexed file");

            Some(file)
        }
    }
}

pub async fn index(path: &Path, pool: Pool<Sqlite>) {
    init_database(&pool).await;

    let mut anidb = AniDb::new("tetsu", 1);

    anidb
        .auth("darkwater_", &std::env::var("PASS").unwrap())
        .await
        .expect("failed login");

    log::info!("session key: {}", anidb.session_key().unwrap());

    let mut facade = CachedFacade::new(&mut anidb, &pool);

    let mut dirs = vec![path.to_owned()];
    while let Some(dir) = dirs.pop() {
        let mut rd = fs::read_dir(dir).await.unwrap();
        while let Some(entry) = rd.next_entry().await.unwrap() {
            let path = entry.path();
            if path.is_dir() {
                dirs.push(path);
            }
            else {
                log::debug!("indexing {}...", path.display());

                if let Some(file) = facade.get_file(&path).await {
                    log::debug!("file: {:#?}", file);

                    let anime = facade.get_anime(file.aid).await;
                    log::debug!("anime: {:#?}", anime);

                    let episode = facade.get_episode(file.eid).await;
                    log::debug!("episode: {:#?}", episode);

                    let group = facade.get_group(file.gid).await;
                    log::debug!("group: {:#?}", group);
                }
            }
        }
    }

    {
        let indexed_files: Vec<String> =
            sqlx::query_scalar("SELECT path FROM anidb_indexed_files;")
                .fetch_all(&pool)
                .await
                .unwrap();

        for path in indexed_files {
            if !Path::new(path.as_str()).exists() {
                log::info!("deleting {} from index", path);

                sqlx::query("DELETE FROM anidb_indexed_files WHERE path = ?;")
                    .bind(path)
                    .execute(&pool)
                    .await
                    .unwrap();
            }
        }
    }

    anidb.logout().await.expect("failed logout");
}
