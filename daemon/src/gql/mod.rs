use actix_web::{web, Error, HttpRequest, HttpResponse};
use juniper::{graphql_object, EmptyMutation, EmptySubscription, RootNode};
use juniper_actix::graphql_handler;
use sqlx::SqlitePool;
use crate::gql::anime::AnimeQuery;

mod anime;

pub struct GqlContext {
    pub db: SqlitePool,
}

impl juniper::Context for GqlContext {}

pub struct Query;

#[graphql_object(context = GqlContext)]
impl Query {
    async fn anime(context: &GqlContext, limit: i32, offset: i32) -> Vec<AnimeQuery> {
        sqlx::query!("SELECT * FROM anidb_anime LIMIT ? OFFSET ?", limit, offset)
            .fetch_all(&context.db)
            .await
            .unwrap()
            .into_iter()
            .map(|row| AnimeQuery {
                aid: row.aid as i32,
                dateflags: row.dateflags.unwrap() as i32,
                year: row.year.unwrap(),
                atype: row.atype.unwrap(),
                related_aid_list: row.related_aid_list.unwrap(),
                related_aid_type: row.related_aid_type.unwrap(),
                romaji_name: row.romaji_name.unwrap(),
                kanji_name: row.kanji_name.unwrap(),
                english_name: row.english_name.unwrap(),
                short_name_list: row.short_name_list.unwrap(),
                episodes: row.episodes.unwrap() as i32,
                special_ep_count: row.special_ep_count.unwrap() as i32,
                air_date: row.air_date.unwrap(),
                end_date: row.end_date.unwrap(),
                picname: row.picname.unwrap(),
                nsfw: row.nsfw.unwrap(),
                characterid_list: row.characterid_list.unwrap(),
                specials_count: row.specials_count.unwrap() as i32,
                credits_count: row.credits_count.unwrap() as i32,
                other_count: row.other_count.unwrap() as i32,
                trailer_count: row.trailer_count.unwrap() as i32,
                parody_count: row.parody_count.unwrap() as i32,
            })
            .collect()
    }
}

pub type Schema = RootNode<'static, Query, EmptyMutation<GqlContext>, EmptySubscription<GqlContext>>;

pub async fn handle(
    schema: &Schema,
    db: SqlitePool,
    payload: web::Payload,
    req: HttpRequest,
) -> Result<HttpResponse, Error> {
    let context = GqlContext { db };

    graphql_handler(schema, &context, req, payload).await
}
