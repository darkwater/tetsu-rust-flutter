use crate::gql::{
    anime::{file::FileQuery, WatchProgressQuery},
    watch_progress::WatchProgressId,
    GqlContext,
};
use juniper::{graphql_object, GraphQLEnum};

pub struct EpisodeQuery {
    pub eid: i64,
    pub aid: i64,
    pub length: i64,
    pub rating: i64,
    pub votes: i64,
    pub epno: String,
    pub eng: String,
    pub romaji: String,
    pub kanji: String,
    pub aired: i64,
    pub etype: i64,
}

#[graphql_object(context = GqlContext)]
impl EpisodeQuery {
    pub fn eid(&self) -> i32 {
        self.eid as i32
    }

    pub fn aid(&self) -> i32 {
        self.aid as i32
    }

    pub fn length(&self) -> i32 {
        self.length as i32
    }

    pub fn rating(&self) -> i32 {
        self.rating as i32
    }

    pub fn votes(&self) -> i32 {
        self.votes as i32
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
        sqlx::query_as!(
            FileQuery,
            "SELECT * FROM anidb_files WHERE eid = ? LIMIT ? OFFSET ?",
            self.eid,
            limit,
            offset
        )
        .fetch_all(&context.db)
        .await
        .unwrap()
    }

    pub async fn watch_progress(&self, context: &GqlContext) -> Option<WatchProgressQuery> {
        let media_id = WatchProgressId::AnidbEpisode(self.eid).to_string();

        sqlx::query_as!(
            WatchProgressQuery,
            "SELECT * FROM watch_progress WHERE media_id = ?",
            media_id,
        )
        .fetch_optional(&context.db)
        .await
        .unwrap()
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

impl From<i64> for EpisodeType {
    fn from(value: i64) -> Self {
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
