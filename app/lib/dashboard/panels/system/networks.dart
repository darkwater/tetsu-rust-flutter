import 'package:flutter/material.dart';

import '../gql_query_panel.dart';

class SystemNetworksPanel extends GqlQueryPanel {
  const SystemNetworksPanel({Key? key})
      : super(
          key: key,
          pollInterval: 5,
          padding: EdgeInsets.zero,
          query: r"""
            query {
              sysinfo {
                networks {
                  name
                  received
                  transmitted
                  packetsReceived
                  packetsTransmitted
                  errorsOnReceived
                  errorsOnTransmitted
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
        for (final entry in sysinfo["networks"]) ...[
          ListTile(
            title: Text(entry["name"]),
            subtitle: Text(
              "Received: ${entry["received"]}\n"
              "Transmitted: ${entry["transmitted"]}\n"
              "Packets Received: ${entry["packetsReceived"]}\n"
              "Packets Transmitted: ${entry["packetsTransmitted"]}\n"
              "Errors on Received: ${entry["errorsOnReceived"]}\n"
              "Errors on Transmitted: ${entry["errorsOnTransmitted"]}\n",
            ),
          ),
        ],
      ],
    );
  }
}
