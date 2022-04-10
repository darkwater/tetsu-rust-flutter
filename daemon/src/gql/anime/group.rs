use crate::gql::GqlContext;
use juniper::graphql_object;

pub struct GroupQuery {
    pub gid: i64,
    pub rating: i64,
    pub votes: i64,
    pub acount: i64,
    pub fcount: i64,
    pub name: String,
    pub short: String,
    pub irc_channel: String,
    pub irc_server: String,
    pub url: String,
    pub picname: String,
    pub foundeddate: i64,
    pub disbandeddate: i64,
    pub dateflags: i64,
    pub lastreleasedate: i64,
    pub lastactivitydate: i64,
    pub grouprelations: String,
}

#[graphql_object(context = GqlContext)]
impl GroupQuery {
    pub fn gid(&self) -> i32 {
        self.gid as i32
    }

    pub fn rating(&self) -> i32 {
        self.rating as i32
    }

    pub fn votes(&self) -> i32 {
        self.votes as i32
    }

    pub fn acount(&self) -> i32 {
        self.acount as i32
    }

    pub fn fcount(&self) -> i32 {
        self.fcount as i32
    }

    pub fn name(&self) -> String {
        self.name.clone()
    }

    pub fn short(&self) -> String {
        self.short.clone()
    }

    pub fn irc_channel(&self) -> String {
        self.irc_channel.clone()
    }

    pub fn irc_server(&self) -> String {
        self.irc_server.clone()
    }

    pub fn url(&self) -> String {
        self.url.clone()
    }

    pub fn picname(&self) -> String {
        self.picname.clone()
    }

    pub fn foundeddate(&self) -> i32 {
        self.foundeddate as i32
    }

    pub fn disbandeddate(&self) -> i32 {
        self.disbandeddate as i32
    }

    pub fn dateflags(&self) -> i32 {
        self.dateflags as i32
    }

    pub fn lastreleasedate(&self) -> i32 {
        self.lastreleasedate as i32
    }

    pub fn lastactivitydate(&self) -> i32 {
        self.lastactivitydate as i32
    }

    pub fn grouprelations(&self) -> String {
        self.grouprelations.clone()
    }
}
