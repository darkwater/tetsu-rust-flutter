use crate::gql::{anime::episode::EpisodeQuery, watch_progress::WatchProgressId, GqlContext};
use juniper::{graphql_object, GraphQLEnum, GraphQLObject};

pub struct AnimeQuery {
    pub aid: i64,
    pub dateflags: i64,
    pub year: String,
    pub atype: String,
    pub related_aid_list: String,
    pub related_aid_type: String,
    pub romaji_name: String,
    pub kanji_name: String,
    pub english_name: String,
    pub short_name_list: String,
    pub episodes: i64,
    pub special_ep_count: i64,
    pub air_date: i64,
    pub end_date: i64,
    pub picname: String,
    pub nsfw: bool,
    pub characterid_list: String,
    pub specials_count: i64,
    pub credits_count: i64,
    pub other_count: i64,
    pub trailer_count: i64,
    pub parody_count: i64,
}

#[graphql_object(context = GqlContext)]
impl AnimeQuery {
    pub fn aid(&self) -> i32 {
        self.aid as i32
    }

    pub fn dateflags(&self) -> i32 {
        self.dateflags as i32
    }

    pub fn year(&self) -> String {
        self.year.clone()
    }

    pub fn atype(&self) -> String {
        self.atype.clone()
    }

    pub fn related_anime(&self) -> RelatedAnimeQuery {
        RelatedAnimeQuery {
            aids: self.related_aid_list.clone(),
            types: self.related_aid_type.clone(),
        }
    }

    pub fn romaji_name(&self) -> String {
        self.romaji_name.clone()
    }

    pub fn kanji_name(&self) -> String {
        self.kanji_name.clone()
    }

    pub fn english_name(&self) -> String {
        self.english_name.clone()
    }

    pub fn short_name_list(&self) -> Vec<String> {
        if self.short_name_list.is_empty() {
            vec![]
        } else {
            self.short_name_list
                .split('\'')
                .map(|s| s.to_string())
                .collect()
        }
    }

    pub fn episode_count(&self) -> i32 {
        self.episodes as i32
    }

    pub fn special_ep_count(&self) -> i32 {
        self.special_ep_count as i32
    }

    pub fn air_date(&self) -> i32 {
        self.air_date as i32 // TODO: solve y2k38
    }

    pub fn end_date(&self) -> i32 {
        self.end_date as i32 // TODO: solve y2k38
    }

    pub fn picname(&self) -> String {
        self.picname.clone()
    }

    pub fn nsfw(&self) -> bool {
        self.nsfw
    }

    pub fn characterid_list(&self) -> Vec<i32> {
        if self.characterid_list.is_empty() {
            vec![]
        } else {
            self.characterid_list
                .split(',')
                .map(|s| s.parse::<i32>().unwrap())
                .collect()
        }
    }

    pub fn specials_count(&self) -> i32 {
        self.specials_count as i32
    }

    pub fn credits_count(&self) -> i32 {
        self.credits_count as i32
    }

    pub fn other_count(&self) -> i32 {
        self.other_count as i32
    }

    pub fn trailer_count(&self) -> i32 {
        self.trailer_count as i32
    }

    pub fn parody_count(&self) -> i32 {
        self.parody_count as i32
    }

    pub async fn episodes(
        &self,
        context: &GqlContext,
        limit: i32,
        offset: i32,
    ) -> Vec<EpisodeQuery> {
        sqlx::query_as!(
            EpisodeQuery,
            "SELECT * FROM anidb_episodes WHERE aid = ? LIMIT ? OFFSET ?",
            self.aid,
            limit,
            offset
        )
        .fetch_all(&context.db)
        .await
        .unwrap()
    }

    pub async fn watch_progress(&self, context: &GqlContext) -> Option<WatchProgressQuery> {
        let media_id = WatchProgressId::AnidbAnime(self.aid).to_string();

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

pub struct WatchProgressQuery {
    pub media_id: String,
    pub progress: f32,
    pub last_update: i64,
}

#[graphql_object(context = GqlContext)]
impl WatchProgressQuery {
    pub fn media_id(&self) -> String {
        self.media_id.clone()
    }

    pub fn progress(&self) -> f64 {
        self.progress as f64
    }

    pub fn last_update(&self) -> i32 {
        self.last_update as i32
    }
}

pub struct RelatedAnimeQuery {
    pub aids: String,
    pub types: String,
}

#[graphql_object(context = GqlContext)]
impl RelatedAnimeQuery {
    pub fn edges(&self) -> Vec<RelatedAnime> {
        if self.aids.is_empty() {
            return vec![];
        }

        let aids: Vec<&str> = self.aids.split('\'').collect();
        let types: Vec<&str> = self.types.split('\'').collect();

        let mut edges: Vec<RelatedAnime> = Vec::new();
        for (aid, r#type) in aids.iter().zip(types.iter()) {
            edges.push(RelatedAnime {
                r#type: match *r#type {
                    "1" => RelatedAnimeType::Sequel,
                    "2" => RelatedAnimeType::Prequel,
                    "11" => RelatedAnimeType::SameSetting,
                    "12" => RelatedAnimeType::AlternativeSetting,
                    "32" => RelatedAnimeType::AlternativeVersion,
                    "41" => RelatedAnimeType::MusicVideo,
                    "42" => RelatedAnimeType::Character,
                    "51" => RelatedAnimeType::SideStory,
                    "52" => RelatedAnimeType::ParentStory,
                    "61" => RelatedAnimeType::Summary,
                    "62" => RelatedAnimeType::FullStory,
                    "100" => RelatedAnimeType::Other,
                    _ => RelatedAnimeType::Unknown,
                },
                node: RelatedAnimeShim {
                    aid: aid.parse::<i32>().unwrap(),
                },
            });
        }

        edges
    }
}

#[derive(GraphQLEnum)]
pub enum RelatedAnimeType {
    Sequel,
    Prequel,
    SameSetting,
    AlternativeSetting,
    AlternativeVersion,
    MusicVideo,
    Character,
    SideStory,
    ParentStory,
    Summary,
    FullStory,
    Other,
    Unknown,
}

#[derive(GraphQLObject)]
pub struct RelatedAnime {
    pub r#type: RelatedAnimeType,
    pub node: RelatedAnimeShim,
}

#[derive(GraphQLObject)]
pub struct RelatedAnimeShim {
    pub aid: i32,
}
