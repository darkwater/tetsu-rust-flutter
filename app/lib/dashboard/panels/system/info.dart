import 'package:flutter/material.dart';

import '../gql_query_panel.dart';

class SystemInfoPanel extends GqlQueryPanel {
  const SystemInfoPanel({Key? key})
      : super(
          key: key,
          query: r"""
            query {
              sysinfo {
                # name
                # kernelVersion
                # osVersion
                longOsVersion
                # hostName

                system {
                  totalMemory
                  physicalCoreCount
                  # bootTime
                }

                processors {
                  frequency
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
      children: [
        const Text(
          "WINBOX", // TODO: remote.name,
          textScaleFactor: 1.6,
        ),
        // for (final entry in sysinfo.entries)
        //   Text(
        //     "${entry.key}: ${entry.value}",
        //     textScaleFactor: 1.2,
        //   ),
        Text(
          sysinfo["longOsVersion"],
        ),
        Text(
          sysinfo["processors"][0]["brand"],
        ),
        Text(
          "${sysinfo["processors"].length} threads @ ${(sysinfo["processors"][0]["frequency"] / 100).round() / 10} GHz",
        ),
        Text(
          "${(num.parse(sysinfo["system"]["totalMemory"]) * 1000 / 1024 / 1024 / 1024).round()} GiB RAM",
        ),
      ],
    );
  }
}
