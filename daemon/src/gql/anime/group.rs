use crate::gql::GqlContext;
use juniper::graphql_object;

pub struct GroupQuery {
    pub gid: i32,
    pub rating: i32,
    pub votes: i32,
    pub acount: i32,
    pub fcount: i32,
    pub name: String,
    pub short: String,
    pub irc_channel: String,
    pub irc_server: String,
    pub url: String,
    pub picname: String,
    pub foundeddate: i32,
    pub disbandeddate: i32,
    pub dateflags: i32,
    pub lastreleasedate: i32,
    pub lastactivitydate: i32,
    pub grouprelations: String,
}

#[graphql_object(context = GqlContext)]
impl GroupQuery {
    pub fn gid(&self) -> i32 {
        self.gid
    }

    pub fn rating(&self) -> i32 {
        self.rating
    }

    pub fn votes(&self) -> i32 {
        self.votes
    }

    pub fn acount(&self) -> i32 {
        self.acount
    }

    pub fn fcount(&self) -> i32 {
        self.fcount
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
        self.foundeddate
    }

    pub fn disbandeddate(&self) -> i32 {
        self.disbandeddate
    }

    pub fn dateflags(&self) -> i32 {
        self.dateflags
    }

    pub fn lastreleasedate(&self) -> i32 {
        self.lastreleasedate
    }

    pub fn lastactivitydate(&self) -> i32 {
        self.lastactivitydate
    }

    pub fn grouprelations(&self) -> String {
        self.grouprelations.clone()
    }
}
