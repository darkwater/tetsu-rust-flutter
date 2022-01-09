import 'package:flutter/material.dart';

import '../gql_query_panel.dart';

class SystemCpuPanel extends GqlQueryPanel {
  const SystemCpuPanel({Key? key})
      : super(
          key: key,
          pollInterval: 5,
          query: r"""
            query {
              sysinfo {
                processors {
                  frequency
                  cpuUsage
                  name
                  vendorId
                  brand
                }
              }
            }
          """,
        );

  @override
  Widget build(BuildContext context, Map<String, dynamic> data) {
    final sysinfo = data["sysinfo"] as Map<String, dynamic>;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        for (final entry in sysinfo["processors"]) ...[
          LinearProgressIndicator(
            value: entry["cpuUsage"] / 100,
          ),
        ],
      ],
    );
  }
}
