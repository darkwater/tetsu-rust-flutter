import 'package:flutter/material.dart';

import '../gql_query_panel.dart';

class SystemUsersPanel extends GqlQueryPanel {
  const SystemUsersPanel({Key? key})
      : super(
          key: key,
          pollInterval: 5,
          padding: EdgeInsets.zero,
          query: r"""
            query {
              sysinfo {
                users {
                  uid
                  gid
                  name
                  groups
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
        for (final entry in sysinfo["users"]) ...[
          ListTile(
            title: Text(entry["name"]),
            subtitle: Text(entry["groups"].join(", ")),
            dense: true,
          ),
        ],
      ],
    );
  }
}
