import 'package:flutter/material.dart';

import '../gql_query_panel.dart';

// #[derive(GraphQLObject)]
// pub struct ProcessQuery {
//     pid: i32,
//     // uid: i32, unix only??
//     // gid: i32,
//     // tasks
//     name: String,
//     cmd: Vec<String>,
//     exe: String,
//     environ: Vec<String>,
//     cwd: String,
//     root: String,
//     memory: String,
//     virtual_memory: String,
//     parent_pid: Option<i32>,
//     status: String,
//     start_time: String,
//     run_time: String,
//     cpu_usage: f64,
//     // disk_usage
// }

class SystemProcessesPanel extends GqlQueryPanel {
  const SystemProcessesPanel({Key? key})
      : super(
          key: key,
          pollInterval: 30,
          padding: EdgeInsets.zero,
          query: r"""
            query {
              sysinfo {
                processes {
                  pid
                  name
                  cmd
                  exe
                  cwd
                  root
                  memory
                  virtualMemory
                  parentPid
                  status
                  startTime
                  runTime
                  cpuUsage
                }
              }
            }
          """,
        );

  @override
  Widget build(BuildContext context, Map<String, dynamic> data) {
    final sysinfo = data["sysinfo"] as Map<String, dynamic>;

    final controller = ScrollController();

    return Scrollbar(
      controller: controller,
      interactive: true,
      thickness: 8,
      child: ListView.builder(
        controller: controller,
        itemCount: sysinfo["processes"]?.length ?? 0,
        itemBuilder: (context, index) {
          final entry = sysinfo["processes"][index] as Map<String, dynamic>;

          return ListTile(
            title: Text(entry["name"]),
            subtitle: Text(entry["status"]),
          );
        },
      ),
    );
  }
}
