import 'package:flutter/material.dart';

import '../gql_query_panel.dart';

class SystemMemoryPanel extends GqlQueryPanel {
  const SystemMemoryPanel({Key? key})
      : super(
          key: key,
          pollInterval: 5,
          query: r"""
            query {
              sysinfo {
                system {
                  totalMemory
                  usedMemory
                  freeMemory
                  availableMemory
                  totalSwap
                  usedSwap
                  freeSwap
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
      children: [
        Text(
          "${(num.parse(sysinfo["system"]["totalMemory"]) * 1000 / 1024 / 1024 / 1024).round()} GiB total RAM",
        ),
        LinearProgressIndicator(
          value: num.parse(sysinfo["system"]["usedMemory"]) /
              num.parse(sysinfo["system"]["totalMemory"]),
        ),
        Text(
          "${(num.parse(sysinfo["system"]["totalSwap"]) * 1000 / 1024 / 1024 / 1024 * 10).round() / 10} GiB total swap",
        ),
        LinearProgressIndicator(
          value: num.parse(sysinfo["system"]["usedSwap"]) /
              num.parse(sysinfo["system"]["totalSwap"]),
        ),
      ],
    );
  }
}
