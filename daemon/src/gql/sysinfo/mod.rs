mod system;

use crate::gql::{sysinfo::system::SystemQuery, GqlContext};
use juniper::{graphql_object, GraphQLObject};
use sysinfo::{ProcessorExt, System, SystemExt, UserExt, DiskExt, NetworksExt, NetworkExt, ProcessExt};

// const REFRESH_INTERVAL: Duration = Duration::from_secs(5);

pub struct SysinfoAccess {
    system: System,
    // last_update: Instant,
}

impl SysinfoAccess {
    pub fn new() -> Self {
        Self {
            system: System::new_all(),
        }
    }
}

pub struct SysinfoQuery;

#[graphql_object(context = GqlContext)]
impl SysinfoQuery {
    pub fn system(context: &GqlContext) -> SystemQuery {
        // if context.sysinfo().last_update.elapsed() > REFRESH_INTERVAL {
        //     let mut sysinfo = context.sysinfo_mut();
        //     sysinfo.system.refresh_all();
        //     sysinfo.last_update = Instant::now();
        // }

        log::trace!("refreshing system");
        context.sysinfo_mut().system.refresh_system();

        SystemQuery
    }

    /// The operating system name
    pub fn name(context: &GqlContext) -> Option<String> {
        context.sysinfo().system.name()
    }

    /// The version of the kernel that the system is running
    pub fn kernel_version(context: &GqlContext) -> Option<String> {
        context.sysinfo().system.kernel_version()
    }

    /// The version of the operating system
    pub fn os_version(context: &GqlContext) -> Option<String> {
        context.sysinfo().system.os_version()
    }

    /// A longer description of the operating system version
    pub fn long_os_version(context: &GqlContext) -> Option<String> {
        context.sysinfo().system.long_os_version()
    }

    /// The hostname of the system, based off DNS
    pub fn host_name(context: &GqlContext) -> Option<String> {
        context.sysinfo().system.host_name()
    }

    pub fn processors(context: &GqlContext) -> Vec<ProcessorQuery> {
        let system = &mut context.sysinfo_mut().system;
        log::trace!("refreshing cpu");
        system.refresh_cpu();
        system.processors().iter().map(Into::into).collect()
    }

    pub fn users(context: &GqlContext) -> Vec<UserQuery> {
        let system = &mut context.sysinfo_mut().system;
        log::trace!("refreshing users");
        system.refresh_users_list();
        system.users().iter().map(Into::into).collect()
    }

    pub fn disks(context: &GqlContext) -> Vec<DiskQuery> {
        let system = &mut context.sysinfo_mut().system;
        log::trace!("refreshing disks");
        system.refresh_disks();
        system.disks().iter().map(Into::into).collect()
    }

    pub fn networks(context: &GqlContext) -> Vec<NetworkQuery> {
        let system = &mut context.sysinfo_mut().system;
        log::trace!("refreshing network interfaces");
        system.refresh_networks_list();
        system.networks().iter().map(Into::into).collect()
    }

    pub fn processes(context: &GqlContext) -> Vec<ProcessQuery> {
        let system = &mut context.sysinfo_mut().system;
        log::trace!("refreshing processes");
        system.refresh_processes();
        system.processes().values().map(Into::into).collect()
    }

    // TODO:
    // process
    // components (shagged on windows)
    // supported signals
    // also all of the extra processes stuff in general
}

#[derive(GraphQLObject)]
pub struct ProcessorQuery {
    frequency: i32,
    cpu_usage: f64,
    name: String,
    vendor_id: String,
    brand: String,
}

impl From<&sysinfo::Processor> for ProcessorQuery {
    fn from(processor: &sysinfo::Processor) -> Self {
        Self {
            frequency: processor.frequency() as i32,
            cpu_usage: processor.cpu_usage() as f64,
            name: processor.name().to_string(),
            vendor_id: processor.vendor_id().to_string(),
            brand: processor.brand().to_string(),
        }
    }
}

#[derive(GraphQLObject)]
pub struct UserQuery {
    uid: i32,
    gid: i32,
    name: String,
    groups: Vec<String>,
}

impl From<&sysinfo::User> for UserQuery {
    fn from(user: &sysinfo::User) -> Self {
        Self {
            uid: *user.uid() as i32,
            gid: *user.gid() as i32,
            name: user.name().to_string(),
            groups: user.groups().iter().map(|g| g.to_string()).collect(),
        }
    }
}

#[derive(GraphQLObject)]
pub struct DiskQuery {
    name: String,
    filesystem: String,
    mount_point: String,
    total_space: String,
    available_space: String,
    is_removable: bool,
}

impl From<&sysinfo::Disk> for DiskQuery {
    fn from(disk: &sysinfo::Disk) -> Self {
        Self {
            name: disk.name().to_string_lossy().into_owned(),
            filesystem: String::from_utf8_lossy(disk.file_system()).into_owned(),
            mount_point: disk.mount_point().to_string_lossy().into_owned(),
            total_space: disk.total_space().to_string(),
            available_space: disk.available_space().to_string(),
            is_removable: disk.is_removable(),
        }
    }
}

#[derive(GraphQLObject)]
pub struct NetworkQuery {
    name: String,
    received: String,
    transmitted: String,
    packets_received: String,
    packets_transmitted: String,
    errors_on_received: String,
    errors_on_transmitted: String,
}

impl From<(&String, &sysinfo::NetworkData)> for NetworkQuery {
    fn from((name, network): (&String, &sysinfo::NetworkData)) -> Self {
        Self {
            name: name.clone(),
            received: network.total_received().to_string(),
            transmitted: network.total_transmitted().to_string(),
            packets_received: network.total_packets_received().to_string(),
            packets_transmitted: network.total_packets_transmitted().to_string(),
            errors_on_received: network.errors_on_received().to_string(),
            errors_on_transmitted: network.errors_on_transmitted().to_string(),
        }
    }
}

#[derive(GraphQLObject)]
pub struct ProcessQuery {
    pid: i32,
    // uid: i32, unix only??
    // gid: i32,
    // tasks
    name: String,
    cmd: Vec<String>,
    exe: String,
    environ: Vec<String>,
    cwd: String,
    root: String,
    memory: String,
    virtual_memory: String,
    parent_pid: Option<i32>,
    status: String,
    start_time: String,
    run_time: String,
    cpu_usage: f64,
    // disk_usage
}

impl From<&sysinfo::Process> for ProcessQuery {
    fn from(process: &sysinfo::Process) -> Self {
        Self {
            pid: process.pid() as i32,
            name: process.name().to_string(),
            cmd: process.cmd().iter().map(|c| c.to_string()).collect(),
            exe: process.exe().to_string_lossy().into_owned(),
            environ: process.environ().iter().map(|e| e.to_string()).collect(),
            cwd: process.cwd().to_string_lossy().into_owned(),
            root: process.root().to_string_lossy().into_owned(),
            memory: process.memory().to_string(),
            virtual_memory: process.virtual_memory().to_string(),
            parent_pid: process.parent().map(|p| p as i32),
            status: process.status().to_string(),
            start_time: process.start_time().to_string(),
            run_time: process.run_time().to_string(),
            cpu_usage: process.cpu_usage() as f64,
        }
    }
}
