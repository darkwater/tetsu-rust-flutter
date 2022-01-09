import 'package:flutter/material.dart';

import '../gql_query_panel.dart';

class SystemDisksPanel extends GqlQueryPanel {
  const SystemDisksPanel({Key? key})
      : super(
          key: key,
          pollInterval: 30,
          query: r"""
            query {
              sysinfo {
                disks {
                  name
                  filesystem
                  mountPoint
                  totalSpace
                  availableSpace
                  isRemovable
                }
              }
            }
          """,
        );

  @override
  Widget build(BuildContext context, Map<String, dynamic> data) {
    final sysinfo = data["sysinfo"] as Map<String, dynamic>;

    return ListView(
      children: [
        for (final entry in sysinfo["disks"]) ...[
          Text(entry["mountPoint"]),
          LinearProgressIndicator(
            value: (num.parse(entry["totalSpace"]) -
                    num.parse(entry["availableSpace"])) /
                num.parse(entry["totalSpace"]),
          ),
        ],
      ],
    );
  }
}
