use crate::{
    gql::{
        anime::AnimeQuery,
        player::{PlayerMutation, PlayerQuery},
    },
    mpv::MpvAddress,
};
use actix_web::{web, Error, HttpRequest, HttpResponse};
use juniper::{
    graphql_object, graphql_value, EmptySubscription, FieldError, FieldResult, RootNode,
};
use juniper_actix::graphql_handler;
use sqlx::SqlitePool;

mod anime;
mod player;

pub type Schema = RootNode<'static, Query, Mutation, EmptySubscription<GqlContext>>;

pub struct GqlContext {
    pub db: SqlitePool,
    pub mpv: MpvAddress,
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

    async fn player(context: &mut GqlContext) -> FieldResult<PlayerQuery> {
        context
            .mpv
            .connect()
            .await
            .map(PlayerQuery::new)
            .map_err(|e| {
                FieldError::new(
                    "Could not connect to mpv",
                    graphql_value!({ "error": (e.to_string()) }),
                )
            })
    }
}

pub struct Mutation;

#[graphql_object(context = GqlContext)]
impl Mutation {
    async fn player(context: &mut GqlContext) -> FieldResult<PlayerMutation> {
        context
            .mpv
            .connect()
            .await
            .map(PlayerMutation::new)
            .map_err(|e| {
                FieldError::new(
                    "Could not connect to mpv",
                    graphql_value!({ "error": (e.to_string()) }),
                )
            })
    }
}

// pub struct Subscription;

// #[graphql_subscription(Context = GqlContext)]
// impl Subscription {
//     async fn player(
//         context: &mut GqlContext,
//         executor: &Executor,
//     ) -> FieldResult<PlayerSubscription> {
//         let children = executor.look_ahead().child_names();
//         let mpv = context.mpv.connect().await?;

//         dbg!(children);

//         todo!()
//     }
// }

// type PlayerSubscription = Pin<Box<dyn Stream<Item = String> + Send>>;

pub async fn handle(
    schema: &Schema,
    db: SqlitePool,
    mpv: MpvAddress,
    payload: web::Payload,
    req: HttpRequest,
) -> Result<HttpResponse, Error> {
    let context = GqlContext { db, mpv };
    graphql_handler(schema, &context, req, payload).await
}
