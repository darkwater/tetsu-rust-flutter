use crate::gql::{anime::GroupQuery, GqlContext};
use juniper::{graphql_object, GraphQLObject};

pub struct FileQuery {
    pub fid: i32,
    pub eid: i32,
    pub aid: i32,
    pub gid: i32,
    pub state: i32,
    pub size: i32,
    pub ed2k: String,
    pub colour_depth: String,
    pub quality: String,
    pub source: String,
    pub audio_codec_list: String,
    pub audio_bitrate_list: String,
    pub video_codec: String,
    pub video_bitrate: String,
    pub video_resolution: String,
    pub dub_language: String,
    pub sub_language: String,
    pub length_in_seconds: i32,
    pub description: String,
    pub aired_date: i64,
}

#[graphql_object(context = GqlContext)]
impl FileQuery {
    pub fn fid(&self) -> i32 {
        self.fid
    }

    pub fn eid(&self) -> i32 {
        self.eid
    }

    pub fn aid(&self) -> i32 {
        self.aid
    }

    pub fn gid(&self) -> i32 {
        self.gid
    }

    pub fn state(&self) -> i32 {
        self.state
    }

    /// File size in kilobytes
    pub fn size(&self) -> i32 {
        self.size
    }

    pub fn ed2k(&self) -> String {
        self.ed2k.clone()
    }

    pub fn quality(&self) -> String {
        self.quality.clone()
    }

    pub fn source(&self) -> String {
        self.source.clone()
    }

    pub fn sub_languages(&self) -> Vec<String> {
        if self.sub_language.is_empty() {
            vec![]
        } else {
            self.sub_language
                .split('\'')
                .map(|s| s.to_string())
                .collect()
        }
    }

    pub fn video_tracks(&self) -> Vec<VideoTrack> {
        let mut tracks = vec![];

        if self.video_codec.is_empty() {
            return tracks;
        }

        let video_codec = self.video_codec.split('\'');
        let video_bitrate = self.video_bitrate.split('\'');
        let mut colour_depth = self.colour_depth.split('\'');

        for (vc, vb) in video_codec.zip(video_bitrate) {
            let cd = colour_depth.next();

            tracks.push(VideoTrack {
                colour_depth: cd.map(|s| s.to_string()),
                codec: vc.to_string(),
                bitrate: vb.to_string(),
            });
        }

        tracks
    }

    pub fn audio_tracks(&self) -> Vec<AudioTrack> {
        let mut tracks = vec![];

        if self.audio_codec_list.is_empty() {
            return tracks;
        }

        let audio_codec_list = self.audio_codec_list.split('\'');
        let audio_bitrate_list = self.audio_bitrate_list.split('\'');
        let dub_language_list = self.dub_language.split('\'');

        for ((ac, ab), dl) in audio_codec_list
            .zip(audio_bitrate_list)
            .zip(dub_language_list)
        {
            tracks.push(AudioTrack {
                codec: ac.to_string(),
                bitrate: ab.to_string(),
                language: dl.to_string(),
            });
        }

        tracks
    }

    pub fn length_in_seconds(&self) -> i32 {
        self.length_in_seconds
    }

    pub fn description(&self) -> String {
        self.description.clone()
    }

    pub fn aired_date(&self) -> i32 {
        self.aired_date as i32 // solve y2k38
    }

    pub async fn group(&self, context: &GqlContext) -> Option<GroupQuery> {
        sqlx::query!("SELECT * FROM anidb_groups WHERE gid = ?", self.gid)
            .fetch_optional(&context.db)
            .await
            .unwrap()
            .map(|row| GroupQuery {
                gid: row.gid as i32,
                rating: row.rating.unwrap() as i32,
                votes: row.votes.unwrap() as i32,
                acount: row.acount.unwrap() as i32,
                fcount: row.fcount.unwrap() as i32,
                name: row.name.unwrap(),
                short: row.short.unwrap(),
                irc_channel: row.irc_channel.unwrap(),
                irc_server: row.irc_server.unwrap(),
                url: row.url.unwrap(),
                picname: row.picname.unwrap(),
                foundeddate: row.foundeddate.unwrap() as i32,
                disbandeddate: row.disbandeddate.unwrap() as i32,
                dateflags: row.dateflags.unwrap() as i32,
                lastreleasedate: row.lastreleasedate.unwrap() as i32,
                lastactivitydate: row.lastactivitydate.unwrap() as i32,
                grouprelations: row.grouprelations.unwrap(),
            })
    }

    pub async fn on_disk(&self, context: &GqlContext) -> Vec<String> {
        sqlx::query!(
            "SELECT path FROM anidb_indexed_files WHERE fid = ?",
            self.fid
        )
        .fetch_all(&context.db)
        .await
        .unwrap()
        .into_iter()
        .map(|row| row.path.unwrap())
        .collect()
    }
}

#[derive(GraphQLObject)]
pub struct VideoTrack {
    pub colour_depth: Option<String>,
    pub codec: String,
    pub bitrate: String,
}

#[derive(GraphQLObject)]
pub struct AudioTrack {
    pub codec: String,
    pub bitrate: String,
    pub language: String,
}
