import 'dart:async';

import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:ferry/ferry.dart' as ferry;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:tetsu/gql/get_player_status.data.gql.dart';
import 'package:tetsu/gql/get_player_status.req.gql.dart';
import 'package:tetsu/gql/get_player_status.var.gql.dart';
import 'package:tetsu/gql/player_seek.req.gql.dart';
import 'package:tetsu/gql/player_set.req.gql.dart';
import 'package:tetsu/preferences.dart';
import 'package:tetsu/utils.dart';

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
    updater = Timer.periodic(const Duration(seconds: 1), (_) => update());
  }

  void update() {
    client.requestController.add(request);
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
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  player.mediaTitle ?? "Nothing playing",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              const Spacer(),
              const Divider(height: 0),
              const SizedBox(height: 8),
              SizedBox(
                height: 108,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: (player.timePos != null &&
                              player.timeRemaining != null)
                          ? SliderTheme(
                              data: const SliderThemeData(
                                trackHeight: 10,
                              ),
                              child: Slider(
                                value: (timePosOverride ?? player.timePos!),
                                max: player.timePos! + player.timeRemaining!,
                                onChanged: (val) =>
                                    setState(() => timePosOverride = val),
                                onChangeEnd: (val) async {
                                  await client
                                      .request(
                                        GPlayerSeekReq(
                                          (b) => b
                                            ..vars.to = val
                                            ..fetchPolicy =
                                                ferry.FetchPolicy.NoCache,
                                        ),
                                      )
                                      .first;

                                  timePosOverride = null;
                                },
                              ),
                            )
                          : const Slider(
                              value: 0,
                              onChanged: null,
                            ),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 16),
                        _TimeProgress(
                          timePos: player.timePos,
                          timeRemaining: player.timeRemaining,
                        ),
                        const Spacer(),
                        _TimeRemaining(
                          timePos: player.timePos,
                          timeRemaining: player.timeRemaining,
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 96,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.skip_previous),
                        iconSize: 42,
                        onPressed: (player.playlistPos == null ||
                                player.playlistPos == 0)
                            ? null
                            : () async {
                                await client
                                    .request(
                                      GPlayerSetReq(
                                        (b) => b
                                          ..vars.playlistPlayIndex =
                                              player.playlistPos! - 1
                                          ..fetchPolicy =
                                              ferry.FetchPolicy.NoCache,
                                      ),
                                    )
                                    .first;

                                update();
                              }),
                    IconButton(
                      icon: const Icon(Icons.fast_rewind),
                      iconSize: 42,
                      onPressed:
                          (player.chapter == null || player.chapter! <= 0)
                              ? null
                              : () async {
                                  await client
                                      .request(
                                        GPlayerSetReq(
                                          (b) => b
                                            ..vars.chapter = player.chapter! - 1
                                            ..fetchPolicy =
                                                ferry.FetchPolicy.NoCache,
                                        ),
                                      )
                                      .first;

                                  update();
                                },
                    ),
                    IconButton(
                      icon: ImplicitlyAnimatedIcon(
                        icon: AnimatedIcons.play_pause,
                        progress: (player.paused ?? true) ? 0 : 1,
                      ),
                      iconSize: 64,
                      onPressed: () async {
                        await client
                            .request(
                              GPlayerSetReq(
                                (b) => b
                                  ..vars.paused = !(player.paused ?? true)
                                  ..fetchPolicy = ferry.FetchPolicy.NoCache,
                              ),
                            )
                            .first;

                        update();
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.fast_forward),
                      iconSize: 42,
                      onPressed: (player.chapter == null ||
                              player.chapters == null ||
                              player.chapter! >= player.chapters! - 1)
                          ? null
                          : () async {
                              await client
                                  .request(
                                    GPlayerSetReq(
                                      (b) => b
                                        ..vars.chapter = player.chapter! + 1
                                        ..fetchPolicy =
                                            ferry.FetchPolicy.NoCache,
                                    ),
                                  )
                                  .first;

                              update();
                            },
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next),
                      iconSize: 42,
                      onPressed: (player.playlistPos == null ||
                              player.playlistCount == null ||
                              player.playlistPos == player.playlistCount! - 1)
                          ? null
                          : () async {
                              await client
                                  .request(
                                    GPlayerSetReq(
                                      (b) => b
                                        ..vars.playlistPlayIndex =
                                            player.playlistPos! + 1
                                        ..fetchPolicy =
                                            ferry.FetchPolicy.NoCache,
                                    ),
                                  )
                                  .first;

                              update();
                            },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
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

class _TimeProgress extends StatelessWidget {
  const _TimeProgress({
    Key? key,
    required this.timePos,
    required this.timeRemaining,
  }) : super(key: key);

  final double? timePos;
  final double? timeRemaining;

  @override
  Widget build(BuildContext context) {
    return PreferenceBuilder<bool>(
      preference: Preferences.showPercentPos,
      builder: (context, showPercentPos) {
        final timePos = this.timePos ?? 0;

        return SizedBox(
          width: 80,
          child: TextButton(
            child: SizedBox(
              width: double.infinity,
              child: Text(
                (showPercentPos && timeRemaining != null)
                    ? (timePos / (timePos + timeRemaining!) * 100)
                            .toStringAsFixed(1) +
                        "%"
                    : formatSeconds(timePos),
                textAlign: TextAlign.start,
              ),
            ),
            onPressed: () {
              Preferences.showPercentPos.setValue(!showPercentPos);
            },
          ),
        );
      },
    );
  }
}

class _TimeRemaining extends StatelessWidget {
  const _TimeRemaining({
    Key? key,
    required this.timePos,
    required this.timeRemaining,
  }) : super(key: key);

  final double? timePos;
  final double? timeRemaining;

  @override
  Widget build(BuildContext context) {
    return PreferenceBuilder<bool>(
      preference: Preferences.showRemainingTime,
      builder: (context, showRemainingTime) {
        return SizedBox(
          width: 80,
          child: TextButton(
            child: SizedBox(
              width: double.infinity,
              child: Text(
                (timePos != null && timeRemaining != null)
                    ? (showRemainingTime
                        ? ("-" + formatSeconds(timeRemaining!))
                        : formatSeconds(timePos! + timeRemaining!))
                    : "",
                textAlign: TextAlign.end,
              ),
            ),
            onPressed: () {
              Preferences.showRemainingTime.setValue(!showRemainingTime);
            },
          ),
        );
      },
    );
  }
}

class ImplicitlyAnimatedIcon extends StatefulWidget {
  const ImplicitlyAnimatedIcon({
    required this.icon,
    required this.progress,
    Key? key,
  }) : super(key: key);

  final AnimatedIconData icon;
  final double progress;

  @override
  _ImplicitlyAnimatedIconState createState() => _ImplicitlyAnimatedIconState();
}

class _ImplicitlyAnimatedIconState extends State<ImplicitlyAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _anim;

  @override
  void initState() {
    super.initState();

    _anim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: widget.progress,
    );
  }

  @override
  Widget build(BuildContext context) {
    _anim.animateTo(widget.progress);

    return AnimatedIcon(
      icon: widget.icon,
      progress: _anim,
    );
  }
}
