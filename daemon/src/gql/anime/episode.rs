use crate::gql::{anime::file::FileQuery, GqlContext};
use juniper::{graphql_object, GraphQLEnum};

pub struct EpisodeQuery {
    pub eid: i32,
    pub aid: i32,
    pub length: i32,
    pub rating: i32,
    pub votes: i32,
    pub epno: String,
    pub eng: String,
    pub romaji: String,
    pub kanji: String,
    pub aired: i64,
    pub etype: i32,
}

#[graphql_object(context = GqlContext)]
impl EpisodeQuery {
    pub fn eid(&self) -> i32 {
        self.eid
    }

    pub fn aid(&self) -> i32 {
        self.aid
    }

    pub fn length(&self) -> i32 {
        self.length
    }

    pub fn rating(&self) -> i32 {
        self.rating
    }

    pub fn votes(&self) -> i32 {
        self.votes
    }

    pub fn epno(&self) -> String {
        self.epno.clone()
    }

    pub fn eng(&self) -> String {
        self.eng.clone()
    }

    pub fn romaji(&self) -> String {
        self.romaji.clone()
    }

    pub fn kanji(&self) -> String {
        self.kanji.clone()
    }

    pub fn aired(&self) -> i32 {
        self.aired as i32 // TODO: solve y2k38
    }

    pub fn episode_type(&self) -> EpisodeType {
        EpisodeType::from(self.etype)
    }

    pub async fn files(&self, context: &GqlContext, limit: i32, offset: i32) -> Vec<FileQuery> {
        sqlx::query!(
            "SELECT * FROM anidb_files WHERE eid = ? LIMIT ? OFFSET ?",
            self.eid,
            limit,
            offset
        )
        .fetch_all(&context.db)
        .await
        .unwrap()
        .into_iter()
        .map(|row| FileQuery {
            fid: row.fid as i32,
            aid: row.aid.unwrap() as i32,
            eid: row.eid.unwrap() as i32,
            gid: row.gid.unwrap() as i32,
            state: row.state.unwrap() as i32,
            size: (row.size.unwrap() / 1024) as i32,
            ed2k: row.ed2k.unwrap(),
            colour_depth: row.colour_depth.unwrap(),
            quality: row.quality.unwrap(),
            source: row.source.unwrap(),
            audio_codec_list: row.audio_codec_list.unwrap(),
            audio_bitrate_list: row.audio_bitrate_list.unwrap(),
            video_codec: row.video_codec.unwrap(),
            video_bitrate: row.video_bitrate.unwrap(),
            video_resolution: row.video_resolution.unwrap(),
            dub_language: row.dub_language.unwrap(),
            sub_language: row.sub_language.unwrap(),
            length_in_seconds: row.length_in_seconds.unwrap() as i32,
            description: row.description.unwrap(),
            aired_date: row.aired_date.unwrap(),
        })
        .collect()
    }
}

#[derive(GraphQLEnum)]
pub enum EpisodeType {
    Regular,
    Special,
    Credit,
    Trailer,
    Parody,
    Other,
    Unknown,
}

impl From<i32> for EpisodeType {
    fn from(value: i32) -> Self {
        match value {
            1 => EpisodeType::Regular,
            2 => EpisodeType::Special,
            3 => EpisodeType::Credit,
            4 => EpisodeType::Trailer,
            5 => EpisodeType::Parody,
            6 => EpisodeType::Other,
            _ => EpisodeType::Unknown,
        }
    }
}
