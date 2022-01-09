use chrono::Utc;
use image::Luma;
use jsonwebtoken::{encode, Algorithm, DecodingKey, EncodingKey, Header};
use qrcode::QrCode;
use serde::{Deserialize, Serialize};

const JWT_ALGORITHM: Algorithm = Algorithm::HS512;

#[derive(Serialize)]
struct QrCodeInfo<'a> {
    jwt: &'a str,
    fingerprint: &'a str,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct JwtClaims {
    exp: i64,
}

pub fn verify(token: &str, decoding_key: &DecodingKey) -> bool {
    jsonwebtoken::decode::<JwtClaims>(
        token,
        decoding_key,
        &jsonwebtoken::Validation::new(JWT_ALGORITHM),
    ).is_ok()
}

pub fn render_auth_qr(encoding_key: EncodingKey, fingerprint: String) {
    let claims = JwtClaims {
        exp: (Utc::now() + chrono::Duration::days(365)).timestamp(),
    };
    let jwt = encode(&Header::new(JWT_ALGORITHM), &claims, &encoding_key).unwrap();

    #[cfg(debug_assertions)] log::info!("fingerprint: {}", fingerprint);
    #[cfg(debug_assertions)] log::info!("token: {}", jwt);

    // render qr code for app auth
    render_qrcode(QrCodeInfo {
        jwt: &jwt,
        fingerprint: &fingerprint,
    });
}

fn render_qrcode(info: QrCodeInfo) {
    let code = QrCode::new(serde_json::to_vec(&info).unwrap()).unwrap();
    let image = code.render::<Luma<u8>>().build();
    image.save("qrcode.png").unwrap();
}
