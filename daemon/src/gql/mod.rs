use crate::{
    gql::{
        anime::AnimeQuery,
        player::{PlayerMutation, PlayerQuery},
        watch_progress::WatchProgressMutation,
    },
    mpv::MpvAddress,
};
use actix_web::{web, Error, HttpRequest, HttpResponse};
use juniper::{
    graphql_object, graphql_value, EmptySubscription, FieldError, FieldResult, RootNode,
};
use juniper_actix::graphql_handler;
use sqlx::SqlitePool;
use std::time::Duration;

mod anime;
mod player;
mod watch_progress;

pub type Schema = RootNode<'static, Query, Mutation, EmptySubscription<GqlContext>>;

pub struct GqlContext {
    pub db: SqlitePool,
    pub mpv: MpvAddress,
}

impl juniper::Context for GqlContext {}

pub struct Query;

#[graphql_object(context = GqlContext)]
impl Query {
    async fn animes(context: &GqlContext, limit: i32, offset: i32) -> Vec<AnimeQuery> {
        sqlx::query_as!(
            AnimeQuery,
            "SELECT * FROM anidb_anime LIMIT ? OFFSET ?",
            limit,
            offset
        )
        .fetch_all(&context.db)
        .await
        .unwrap()
    }

    async fn anime(context: &GqlContext, aid: i32) -> Option<AnimeQuery> {
        sqlx::query_as!(AnimeQuery, "SELECT * FROM anidb_anime WHERE aid = ?", aid)
            .fetch_optional(&context.db)
            .await
            .unwrap()
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

    async fn watch_progress() -> WatchProgressMutation {
        WatchProgressMutation
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
    let delay = Duration::from_secs_f64(rand::random());
    actix_web::rt::time::sleep(delay).await;

    let context = GqlContext { db, mpv };
    graphql_handler(schema, &context, req, payload).await
}
