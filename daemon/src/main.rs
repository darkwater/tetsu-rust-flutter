mod anidb_indexer;
mod auth;
mod gql;
mod mpv;
mod routes;

use crate::{
    auth::render_auth_qr,
    gql::{GqlContext, Schema},
    mpv::MpvAddress,
};
use actix_web::{
    middleware,
    web::{self, Data},
    App, HttpServer,
};
// use astro_dnssd::DNSServiceBuilder;
use jsonwebtoken::{DecodingKey, EncodingKey};
use juniper::EmptySubscription;
use rustls::{Certificate, PrivateKey};
use std::{
    fs::File,
    io::{BufReader, Read},
    path::Path,
    process::{Child, Command},
    time::Duration,
};

fn ssl_config() -> std::io::Result<(rustls::ServerConfig, String)> {
    let mut certfile = BufReader::new(File::open("cert.pem")?);
    let certs = rustls_pemfile::certs(&mut certfile)?
        .into_iter()
        .map(Certificate)
        .collect::<Vec<_>>();

    let cert = certs.first().unwrap();
    let fingerprint = sha256::digest_bytes(&cert.0);

    let mut keyfile = BufReader::new(File::open("key.pem")?);
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

fn register_service(port: u16, fingerprint: &str) -> Child {
    // // scuffed on linux/avahi
    // let service = DNSServiceBuilder::new("_tetsu._tcp", port)
    //     .with_key_value("fingerprint".to_string(), fingerprint.to_string())
    //     .register();

    let service = Command::new("avahi-publish")
        .arg("-s")
        .arg(
            std::fs::read_to_string("/etc/hostname")
                .unwrap()
                .trim_end_matches('\n'),
        )
        .arg("_tetsu._tcp")
        .arg(port.to_string())
        .arg(format!("fingerprint={}", fingerprint))
        .spawn();

    match service {
        Err(e) => panic!("failed to register service: {}", e),
        Ok(service) => service,
    }
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    pretty_env_logger::init();

    let mut secret_key = String::new();
    File::open("key.hmac")?.read_to_string(&mut secret_key)?;
    let encoding_key = EncodingKey::from_base64_secret(&secret_key).expect("invalid hmac key");
    let decoding_key = DecodingKey::from_base64_secret(&secret_key)
        .expect("invalid hmac key")
        .into_static();

    let db = sqlx::SqlitePool::connect("tetsu.db").await.unwrap();

    let mut mpv = Command::new("mpv")
        .arg("--input-ipc-server=/tmp/mpv.sock")
        .arg("--idle")
        .arg("--fullscreen")
        .spawn()
        .unwrap();

    tokio::spawn(anidb_indexer::index(
        Path::new("/data/torrents/anime"),
        db.clone(),
    ));

    // set up https server
    let (ssl, fingerprint) = ssl_config()?;
    let server = HttpServer::new(move || {
        App::new()
            .app_data(Data::new(decoding_key.clone()))
            .app_data(Data::new(db.clone()))
            .app_data(Data::new(MpvAddress("/tmp/mpv.sock".to_string())))
            .app_data(Data::new(Schema::new(
                gql::Query,
                gql::Mutation,
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
    .keep_alive(Duration::from_secs(120))
    .bind_rustls("0.0.0.0:39547", ssl)?;

    let listen_port = server.addrs().first().unwrap().port();
    log::info!("listening on port {}", listen_port);

    // register service with bonjour
    let mut service = register_service(listen_port, &fingerprint);

    render_auth_qr(encoding_key, fingerprint);

    log::info!("running");

    server.run().await?;

    service.kill()?;
    mpv.kill()?;

    Ok(())
}
