use crate::gql::{anime::episode::EpisodeQuery, GqlContext};
use juniper::{graphql_object, GraphQLEnum, GraphQLObject};

pub struct AnimeQuery {
    pub aid: i32,
    pub dateflags: i32,
    pub year: String,
    pub atype: String,
    pub related_aid_list: String,
    pub related_aid_type: String,
    pub romaji_name: String,
    pub kanji_name: String,
    pub english_name: String,
    pub short_name_list: String,
    pub episodes: i32,
    pub special_ep_count: i32,
    pub air_date: i64,
    pub end_date: i64,
    pub picname: String,
    pub nsfw: bool,
    pub characterid_list: String,
    pub specials_count: i32,
    pub credits_count: i32,
    pub other_count: i32,
    pub trailer_count: i32,
    pub parody_count: i32,
}

#[graphql_object(context = GqlContext)]
impl AnimeQuery {
    pub fn aid(&self) -> i32 {
        self.aid
    }

    pub fn dateflags(&self) -> i32 {
        self.dateflags
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
        self.episodes
    }

    pub fn special_ep_count(&self) -> i32 {
        self.special_ep_count
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
        self.specials_count
    }

    pub fn credits_count(&self) -> i32 {
        self.credits_count
    }

    pub fn other_count(&self) -> i32 {
        self.other_count
    }

    pub fn trailer_count(&self) -> i32 {
        self.trailer_count
    }

    pub fn parody_count(&self) -> i32 {
        self.parody_count
    }

    pub async fn episodes(
        &self,
        context: &GqlContext,
        limit: i32,
        offset: i32,
    ) -> Vec<EpisodeQuery> {
        sqlx::query!(
            "SELECT * FROM anidb_episodes WHERE aid = ? LIMIT ? OFFSET ?",
            self.aid,
            limit,
            offset
        )
        .fetch_all(&context.db)
        .await
        .unwrap()
        .into_iter()
        .map(|row| EpisodeQuery {
            eid: row.eid as i32,
            aid: row.aid.unwrap() as i32,
            length: row.length.unwrap() as i32,
            rating: row.rating.unwrap() as i32,
            votes: row.votes.unwrap() as i32,
            epno: row.epno.unwrap(),
            eng: row.eng.unwrap(),
            romaji: row.romaji.unwrap(),
            kanji: row.kanji.unwrap(),
            aired: row.aired.unwrap(),
            etype: row.etype.unwrap() as i32,
        })
        .collect()
    }
}

pub struct RelatedAnimeQuery {
    pub aids: String,
    pub types: String,
}

// Related aid type (Byte 1, Bit 2):

// value      meaning

//     1      sequel
//     2      prequel
//    11      same setting
//    12      alternative setting
//    32      alternative version
//    41      music video
//    42      character
//    51      side story
//    52      parent story
//    61      summary
//    62      full story
//   100      other

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
