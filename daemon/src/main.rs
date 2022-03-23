#![allow(clippy::new_without_default)]

mod auth;
mod gql;
mod routes;

use crate::{
    auth::render_auth_qr,
    gql::{DataAccess, GqlContext, Schema},
};
use actix_web::{
    middleware,
    web::{self, Data},
    App, HttpServer,
};
use astro_dnssd::DNSServiceBuilder;
use jsonwebtoken::{DecodingKey, EncodingKey};
use juniper::{EmptyMutation, EmptySubscription};
use rustls::{Certificate, PrivateKey};
use std::{fs::File, io::{BufReader, Read}};

fn ssl_config() -> std::io::Result<(rustls::ServerConfig, String)> {
    let mut certfile = BufReader::new(File::open("../cert.pem")?);
    let certs = rustls_pemfile::certs(&mut certfile)?
        .into_iter()
        .map(Certificate)
        .collect::<Vec<_>>();

    let cert = certs.first().unwrap();
    let fingerprint = sha256::digest_bytes(&cert.0);

    let mut keyfile = BufReader::new(File::open("../key.pem")?);
    let key = rustls_pemfile::pkcs8_private_keys(&mut keyfile)?
        .into_iter()
        .map(PrivateKey)
        .next()
        .expect("empty key file");

    let ssl = rustls::ServerConfig::builder()
        .with_safe_defaults()
        .with_no_client_auth()
        .with_single_cert(certs, key)
        .unwrap();

    Ok((ssl, fingerprint))
}

fn register_service(port: u16, fingerprint: &str) {
    let service = DNSServiceBuilder::new("_tetsu._tcp", port)
        .with_key_value("fingerprint".to_string(), fingerprint.to_string())
        .register();

    if let Err(e) = service {
        log::error!("failed to register service: {}", e);
    } else {
        std::mem::forget(service);
    }
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    pretty_env_logger::init();

    let mut secret_key = String::new();
    File::open("../key.hmac")?.read_to_string(&mut secret_key)?;
    let encoding_key = EncodingKey::from_base64_secret(&secret_key).expect("invalid hmac key");
    let decoding_key = DecodingKey::from_base64_secret(&secret_key)
        .expect("invalid hmac key")
        .into_static();

    // set up https server
    let (ssl, fingerprint) = ssl_config()?;
    let server = HttpServer::new(move || {
        App::new()
            .app_data(Data::new(decoding_key.clone()))
            .app_data(Data::new(DataAccess::new()))
            .app_data(Data::new(Schema::new(
                gql::Query,
                EmptyMutation::<GqlContext>::new(),
                EmptySubscription::<GqlContext>::new(),
            )))
            .wrap(middleware::Compress::default())
            .wrap(middleware::Logger::default())
            .service(routes::info)
            .service(routes::playground)
            .service(
                web::resource("/graphql")
                    .route(web::post().to(routes::graphql))
                    .route(web::get().to(routes::graphql)),
            )
    })
    .keep_alive(120)
    .bind_rustls("0.0.0.0:0", ssl)?;

    let listen_port = server.addrs().first().unwrap().port();
    log::info!("listening on port {}", listen_port);

    // register service with bonjour
    register_service(listen_port, &fingerprint);

    render_auth_qr(encoding_key, fingerprint);

    log::info!("running");

    server.run().await?;

    Ok(())
}
