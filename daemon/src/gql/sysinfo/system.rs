use crate::gql::GqlContext;
use juniper::{graphql_object, GraphQLObject};
use sysinfo::SystemExt;

pub struct SystemQuery;
#[graphql_object(context = GqlContext)]
impl SystemQuery {
    /// Total amount of RAM in kilobytes.
    pub fn total_memory(context: &GqlContext) -> String {
        context.sysinfo().system.total_memory().to_string()
    }

    /// Used amount of RAM in kilobytes.
    pub fn used_memory(context: &GqlContext) -> String {
        context.sysinfo().system.used_memory().to_string()
    }

    /// Free amount of RAM in kilobytes.
    pub fn free_memory(context: &GqlContext) -> String {
        context.sysinfo().system.free_memory().to_string()
    }

    /// Available amount of RAM in kilobytes.
    pub fn available_memory(context: &GqlContext) -> String {
        context.sysinfo().system.available_memory().to_string()
    }

    /// Total amount of swap in kilobytes.
    pub fn total_swap(context: &GqlContext) -> String {
        context.sysinfo().system.total_swap().to_string()
    }

    /// Used amount of swap in kilobytes.
    pub fn used_swap(context: &GqlContext) -> String {
        context.sysinfo().system.used_swap().to_string()
    }

    /// Free amount of swap in kilobytes.
    pub fn free_swap(context: &GqlContext) -> String {
        context.sysinfo().system.free_swap().to_string()
    }

    /// The number of physical cores on the processor, if available.
    ///
    /// In case there are multiple CPUs, it will combine the physical cores of all the CPUs.
    pub fn physical_core_count(context: &GqlContext) -> Option<i32> {
        context.sysinfo().system.physical_core_count().map(|v| v as i32)
    }

    /// System uptime in seconds.
    pub fn uptime(context: &GqlContext) -> String {
        context.sysinfo().system.uptime().to_string()
    }

    /// Unix timestamp of when the system booted (in seconds).
    pub fn boot_time(context: &GqlContext) -> String {
        context.sysinfo().system.boot_time().to_string()
    }

    /// The average system load over the last one, five, and fifteen minutes.
    ///
    /// A system load of 1.0 means that the equivalent of one CPU core was being used. On a system
    /// with four cores, that could be interpreted as a load of 25%.
    pub fn load_average(context: &GqlContext) -> LoadAvgQuery {
        let l = context.sysinfo().system.load_average();

        LoadAvgQuery {
            one: l.one,
            five: l.five,
            fifteen: l.fifteen,
        }
    }
}

#[derive(GraphQLObject)]
pub struct LoadAvgQuery {
    pub one: f64,
    pub five: f64,
    pub fifteen: f64,
}
