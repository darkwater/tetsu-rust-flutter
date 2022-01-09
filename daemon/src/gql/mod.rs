use self::sysinfo::{SysinfoAccess, SysinfoQuery};
use actix_web::{web, Error, HttpRequest, HttpResponse};
use juniper::{graphql_object, EmptyMutation, EmptySubscription, RootNode};
use juniper_actix::graphql_handler;
use std::sync::{Arc, RwLockReadGuard, RwLockWriteGuard, RwLock};

// add new modules here
mod sysinfo;

pub struct GqlContext {
    pub data_access: Arc<DataAccess>,
}

pub struct DataAccess {
    // add their access types here
    sysinfo: RwLock<SysinfoAccess>,
}

impl DataAccess {
    pub fn new() -> Self {
        Self {
            // and initialize them here
            sysinfo: RwLock::new(SysinfoAccess::new()),
        }
    }
}

impl juniper::Context for GqlContext {}

impl GqlContext {
    // add shortcuts for their access types here
    pub fn sysinfo(&self) -> RwLockReadGuard<SysinfoAccess> {
        self.data_access.sysinfo.read().unwrap()
    }

    pub fn sysinfo_mut(&self) -> RwLockWriteGuard<SysinfoAccess> {
        self.data_access.sysinfo.write().unwrap()
    }
}

pub struct Query;

#[graphql_object(context = GqlContext)]
impl Query {
    // and add their queries here
    fn sysinfo() -> SysinfoQuery {
        SysinfoQuery
    }
}

pub type Schema = RootNode<'static, Query, EmptyMutation<GqlContext>, EmptySubscription<GqlContext>>;

pub async fn handle(schema: &Schema, data_access: Arc<DataAccess>, payload: web::Payload, req: HttpRequest) -> Result<HttpResponse, Error> {
    let context = GqlContext { data_access };

    graphql_handler(schema, &context, req, payload).await
}
