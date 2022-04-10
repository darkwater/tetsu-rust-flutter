use super::GqlContext;
use juniper::graphql_object;
use std::fmt::Display;

pub enum WatchProgressId {
    AnidbAnime(i64),
    AnidbEpisode(i64),
}

impl Display for WatchProgressId {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            WatchProgressId::AnidbAnime(aid) => write!(f, "anidb:anime:{}", aid),
            WatchProgressId::AnidbEpisode(eid) => write!(f, "anidb:episode:{}", eid),
        }
    }
}

pub struct WatchProgressMutation;

impl WatchProgressMutation {
    async fn update(
        &self,
        context: &GqlContext,
        media_id: &str,
        progress: f64,
        increase_only: bool,
    ) -> sqlx::Result<()> {
        let timestamp = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap()
            .as_secs() as i64;

        if increase_only {
            let old_progress = sqlx::query_scalar!(
                "SELECT progress FROM watch_progress WHERE media_id = ?",
                media_id,
            )
            .fetch_optional(&context.db)
            .await?;

            if let Some(old_progress) = old_progress {
                if old_progress > progress as f32 {
                    return Ok(());
                }
            }
        }

        sqlx::query!(
            "INSERT OR REPLACE INTO watch_progress (media_id, progress, last_update) VALUES (?, ?, ?)",
            media_id,
            progress,
            timestamp,
        )
        .execute(&context.db)
        .await
        .map(|_| ())
    }
}

#[graphql_object(Context = GqlContext)]
impl WatchProgressMutation {
    #[graphql(arguments(increase_only(default = true)))]
    async fn anime(
        &self,
        context: &GqlContext,
        aid: i32,
        progress: f64,
        increase_only: bool,
    ) -> f64 {
        self.update(
            context,
            &WatchProgressId::AnidbAnime(aid as i64).to_string(),
            progress,
            increase_only,
        )
        .await
        .unwrap();

        progress
    }

    #[graphql(arguments(increase_only(default = true)))]
    async fn episode(
        &self,
        context: &GqlContext,
        eid: i32,
        progress: f64,
        increase_only: bool,
    ) -> f64 {
        self.update(
            context,
            &WatchProgressId::AnidbEpisode(eid as i64).to_string(),
            progress,
            increase_only,
        )
        .await
        .unwrap();

        progress
    }
}
