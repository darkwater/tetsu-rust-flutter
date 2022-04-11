import 'dart:async';

import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:ferry/ferry.dart' as ferry;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tetsu/gql/get_player_status.data.gql.dart';
import 'package:tetsu/gql/get_player_status.req.gql.dart';
import 'package:tetsu/gql/get_player_status.var.gql.dart';
import 'package:tetsu/gql/player_seek.req.gql.dart';

class PlayerDrawer extends StatefulWidget {
  const PlayerDrawer({Key? key}) : super(key: key);

  @override
  State<PlayerDrawer> createState() => _PlayerDrawerState();
}

class _PlayerDrawerState extends State<PlayerDrawer> {
  late final ferry.Client client;
  late final GGetPlayerStatusReq request;
  late final Timer updater;

  double? timePosOverride;

  @override
  void initState() {
    super.initState();

    client = context.read<ferry.Client>();
    request = GGetPlayerStatusReq(
      (b) => b..fetchPolicy = ferry.FetchPolicy.NoCache,
    );
    updater = Timer.periodic(const Duration(seconds: 1), (_) {
      client.requestController.add(request);
    });
  }

  @override
  void dispose() {
    updater.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final queryBuilder = Operation<GGetPlayerStatusData, GGetPlayerStatusVars>(
      client: client,
      operationRequest: request,
      builder: (builder, data, error) {
        if (error != null) {
          return Center(
            child: Text(error.toString()),
          );
        }

        if (data?.graphqlErrors?.isNotEmpty ?? false) {
          return Center(
            child: Text(data!.graphqlErrors.toString()),
          );
        }

        if (data == null || data.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final player = data.data!.player;

        return SafeArea(
          child: Column(
            children: [
              Text(player.mediaTitle ?? "Nothing playing"),
              if (player.timePos != null && player.timeRemaining != null)
                Slider(
                  value: (timePosOverride ?? player.timePos!),
                  max: player.timePos! + player.timeRemaining!,
                  onChanged: (val) => setState(() => timePosOverride = val),
                  onChangeEnd: (val) async {
                    await client
                        .request(
                          GPlayerSeekReq(
                            (b) => b
                              ..vars.to = val
                              ..fetchPolicy = ferry.FetchPolicy.NoCache,
                          ),
                        )
                        .first;

                    timePosOverride = null;
                  },
                )
              else
                const Slider(
                  value: 0,
                  onChanged: null,
                ),
            ],
          ),
        );
      },
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Material(
        color: Theme.of(context).dialogBackgroundColor,
        child: GestureDetector(
          // claim this gesture to prevent it from closing the drawer
          onHorizontalDragStart: (details) {},
          behavior: HitTestBehavior.opaque,
          child: SizedBox.expand(
            child: queryBuilder,
          ),
        ),
      ),
    );
  }
}
