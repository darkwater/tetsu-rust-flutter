use std::ops::Deref;

use crate::{
    auth,
    gql::{self, Schema},
};
use actix_web::{get, http, web, HttpResponse, Responder};
use jsonwebtoken::DecodingKey;
use juniper_actix::playground_handler;
use sqlx::SqlitePool;

#[get("/info")]
pub async fn info(
    req: actix_web::HttpRequest,
    decoding_key: web::Data<DecodingKey<'static>>,
) -> impl Responder {
    let authed = req
        .headers()
        .get(http::header::AUTHORIZATION) // => Authorization: Bearer <token>
        .and_then(|header| header.to_str().ok()) // => "Bearer <token>"
        .and_then(|header| header.split(' ').nth(1)) // => "<token>"
        .map(|token| auth::verify(token, &**decoding_key)) //: bool
        .unwrap_or(false);

    if !authed {
        return HttpResponse::Unauthorized().finish();
    }

    HttpResponse::Ok().body("yeah you're authed")
}

#[get("/playground")]
pub async fn playground() -> impl Responder {
    playground_handler("/graphql", None).await
}

pub async fn graphql(
    req: actix_web::HttpRequest,
    payload: actix_web::web::Payload,
    decoding_key: web::Data<DecodingKey<'static>>,
    db: web::Data<SqlitePool>,
    schema: web::Data<Schema>,
) -> impl Responder {
    let authed = req
        .headers()
        .get(http::header::AUTHORIZATION) // => Authorization: Bearer <token>
        .and_then(|header| header.to_str().ok()) // => "Bearer <token>"
        .and_then(|header| header.split(' ').nth(1)) // => "<token>"
        .map(|token| auth::verify(token, &**decoding_key)) //: bool
        .unwrap_or(false);

    if !authed {
        return Ok(HttpResponse::Unauthorized().finish());
    }

    gql::handle(&schema, db.into_inner().deref().clone(), payload, req).await
}
