use super::GqlContext;
use crate::mpv::{MpvCommand, MpvStream};
use juniper::{graphql_object, graphql_value, FieldError, FieldResult};

pub struct PlayerQuery {
    mpv: MpvStream,
}

type PropResult<T> = FieldResult<Option<T>>;

impl PlayerQuery {
    pub fn new(mpv: MpvStream) -> Self {
        Self { mpv }
    }

    async fn prop(&self, name: &str) -> PropResult<serde_json::Value> {
        let res = self
            .mpv
            .send_command(MpvCommand::new(vec!["get_property".into(), name.into()]))
            .await;

        if let Some(error) = res.error() {
            match error {
                "property unavailable" => Ok(None),
                _ => Err(FieldError::new(error, graphql_value!(None))),
            }
        } else if res.data.is_null() {
            Ok(None)
        } else {
            Ok(Some(res.data))
        }
    }

    async fn prop_bool(&self, name: &str) -> PropResult<bool> {
        self.prop(name)
            .await
            .map(|r| r.map(|o| o.as_bool().unwrap()))
    }

    async fn prop_i32(&self, name: &str) -> PropResult<i32> {
        self.prop(name)
            .await
            .map(|r| r.map(|o| o.as_i64().unwrap() as i32))
    }

    async fn prop_f64(&self, name: &str) -> PropResult<f64> {
        self.prop(name)
            .await
            .map(|r| r.map(|o| o.as_f64().unwrap()))
    }

    async fn prop_string(&self, name: &str) -> PropResult<String> {
        self.prop(name)
            .await
            .map(|r| r.map(|o| o.as_str().unwrap().to_string()))
    }
}

#[graphql_object(Context = GqlContext)]
impl PlayerQuery {
    async fn property(&self, name: String) -> PropResult<String> {
        self.prop(&name)
            .await
            .map(|res| res.map(|opt| opt.to_string()))
    }

    async fn paused(&self) -> PropResult<bool> {
        self.prop_bool("pause").await
    }

    async fn media_title(&self) -> PropResult<String> {
        self.prop_string("media-title").await
    }

    async fn playlist_pos(&self) -> PropResult<i32> {
        self.prop_i32("playlist-pos").await
    }

    async fn playlist_count(&self) -> PropResult<i32> {
        self.prop_i32("playlist-count").await
    }

    async fn chapter(&self) -> PropResult<i32> {
        self.prop_i32("chapter").await
    }

    async fn chapters(&self) -> PropResult<i32> {
        self.prop_i32("chapters").await
    }

    async fn time_pos(&self) -> PropResult<f64> {
        self.prop_f64("time-pos").await
    }

    async fn time_remaining(&self) -> PropResult<f64> {
        self.prop_f64("time-remaining").await
    }

    async fn seekable(&self) -> PropResult<bool> {
        self.prop_bool("seekable").await
    }

    async fn seeking(&self) -> PropResult<bool> {
        self.prop_bool("seeking").await
    }
}

pub struct PlayerMutation {
    mpv: MpvStream,
}

impl PlayerMutation {
    pub fn new(mpv: MpvStream) -> Self {
        Self { mpv }
    }
}

#[graphql_object(Context = GqlContext)]
impl PlayerMutation {
    async fn send_command(&self, command: Vec<String>) -> FieldResult<String> {
        let res = self
            .mpv
            .send_command(MpvCommand::new(
                command.into_iter().map(|s| s.into()).collect(),
            ))
            .await;

        if let Some(error) = res.error() {
            Err(FieldError::new(error, graphql_value!(None)))
        } else {
            Ok(res.data.to_string())
        }
    }
}
