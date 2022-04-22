use super::GqlContext;
use crate::{
    mpv::{MpvCommand, MpvStream},
    mpv_command,
};
use juniper::{graphql_object, graphql_value, FieldError, FieldResult};

pub struct PlayerQuery {
    mpv: MpvStream,
}

type PropResult<T> = FieldResult<Option<T>>;

impl PlayerQuery {
    pub fn new(mpv: MpvStream) -> Self {
        Self { mpv }
    }
}

macro_rules! prop {
    ($self:ident, $name:expr, i32)    => { prop!(@call $self, get_property_i32($name)) };
    ($self:ident, $name:expr, f64)    => { prop!(@call $self, get_property_f64($name)) };
    ($self:ident, $name:expr, bool)   => { prop!(@call $self, get_property_bool($name)) };
    ($self:ident, $name:expr, String) => { prop!(@call $self, get_property_string($name)) };

    (@call $self:ident, $fun:ident($name:expr)) => {
        $self
            .mpv
            .$fun($name)
            .await
            .map_err(|e| FieldError::new(&e, graphql_value!(None)))
    };
}

#[graphql_object(Context = GqlContext)]
impl PlayerQuery {
    async fn property(&self, name: String) -> PropResult<String> {
        self.mpv
            .get_property(&name)
            .await
            .map(|res| res.map(|opt| opt.to_string()))
            .map_err(|e| FieldError::new(&e, graphql_value!(None)))
    }

    async fn paused(&self) -> PropResult<bool> {
        prop!(self, "pause", bool)
    }

    async fn media_title(&self) -> PropResult<String> {
        prop!(self, "media-title", String)
    }

    async fn playlist_pos(&self) -> PropResult<i32> {
        prop!(self, "playlist-pos", i32)
    }

    async fn playlist_count(&self) -> PropResult<i32> {
        prop!(self, "playlist-count", i32)
    }

    async fn chapter(&self) -> PropResult<i32> {
        prop!(self, "chapter", i32)
    }

    async fn chapters(&self) -> PropResult<i32> {
        prop!(self, "chapters", i32)
    }

    async fn time_pos(&self) -> PropResult<f64> {
        prop!(self, "time-pos", f64)
    }

    async fn time_remaining(&self) -> PropResult<f64> {
        prop!(self, "time-remaining", f64)
    }

    async fn seekable(&self) -> PropResult<bool> {
        prop!(self, "seekable", bool)
    }

    async fn seeking(&self) -> PropResult<bool> {
        prop!(self, "seeking", bool)
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
        let res = self.mpv.send_command(MpvCommand::new(command)).await;

        if let Some(error) = res.error() {
            Err(FieldError::new(error, graphql_value!(None)))
        } else {
            Ok(res.data.to_string())
        }
    }

    #[graphql(arguments(start_at(default = 0)))]
    async fn load_playlist(
        &self,
        playlist: Vec<String>,
        start_at: i32,
    ) -> FieldResult<&'static str> {
        if playlist.is_empty() {
            return Err(FieldError::new("playlist is empty", graphql_value!(None)));
        }

        if start_at < 0 || start_at >= playlist.len() as i32 {
            return Err(FieldError::new(
                "start_at is out of bounds",
                graphql_value!(None),
            ));
        }

        let mut playlist = playlist.into_iter();
        let first_item = playlist.next().unwrap();

        self.mpv
            .send_command(MpvCommand::new(["playlist-clear"]))
            .await;

        self.mpv
            .send_command(MpvCommand::new(["loadfile", &first_item, "replace"]))
            .await;

        for item in playlist {
            self.mpv
                .send_command(MpvCommand::new(["loadfile", &item, "append"]))
                .await;
        }

        self.mpv
            .send_command(mpv_command!("playlist-play-index", start_at))
            .await;

        Ok("ok")
    }

    async fn seek(&self, to: Option<f64>, by: Option<f64>) -> PropResult<f64> {
        if let Some(to) = to {
            self.mpv
                .send_command(mpv_command!("seek", to, "absolute"))
                .await;
        }

        if let Some(by) = by {
            self.mpv
                .send_command(mpv_command!("seek", by, "relative"))
                .await;
        }

        prop!(self, "time-pos", f64)
    }

    async fn set(
        &self,
        paused: Option<bool>,
        chapter: Option<i32>,
        playlist_play_index: Option<i32>,
    ) -> FieldResult<bool> {
        if let Some(paused) = paused {
            self.mpv
                .send_command(mpv_command!("set", "pause", paused.to_string()))
                .await;
        }

        if let Some(chapter) = chapter {
            self.mpv
                .send_command(mpv_command!("set", "chapter", chapter.to_string()))
                .await;
        }

        if let Some(playlist_play_index) = playlist_play_index {
            self.mpv
                .send_command(mpv_command!("playlist-play-index", playlist_play_index))
                .await;
        }

        Ok(true)
    }
}
