import 'dart:math' show max;
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ferry/ferry.dart' as ferry;
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tetsu/gql/get_anime_details.data.gql.dart';
import 'package:tetsu/gql/get_anime_details.req.gql.dart';
import 'package:tetsu/gql/get_anime_details.var.gql.dart';
import 'package:tetsu/gql/get_anime_shows.data.gql.dart';
import 'package:tetsu/gql/load_playlist.req.gql.dart';
import 'package:tetsu/gql/schema.schema.gql.dart';
import 'package:tetsu/widgets/player_drawer.dart';
import 'package:tetsu/widgets/player_drawer_button.dart';

const _subColor = Color(0xAF3F51B5); // indigo
const _videoColor = Color(0xAF9C27B0); // purple
const _audioColor = Color(0xAFD32F2F); // red shade700

const _subIcon = Icons.subtitles_outlined;
const _videoIcon = Icons.movie_outlined;
const _audioIcon = Icons.volume_up_outlined;

const _tabletThreshold = 800;

class AnimeDetailsPage extends StatelessWidget {
  final GGetAnimeShowsData_animes initialData;

  const AnimeDetailsPage({
    Key? key,
    required this.initialData,
  }) : super(key: key);

  static Route route(dynamic initialData) {
    return MaterialPageRoute(
      builder: (context) => AnimeDetailsPage(initialData: initialData),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > _tabletThreshold) {
            return buildTabletLayout(context);
          } else {
            return buildPhoneLayout(context);
          }
        },
      ),
      floatingActionButton: const PlayerDrawerButton(),
      endDrawer: const PlayerDrawer(),
    );
  }

  Widget buildTabletLayout(BuildContext context) {
    const mainPadding = 40.0;
    const sidebarWidth = 350.0;
    final headerHeight = 380.0 + MediaQuery.of(context).viewPadding.top;
    final coverTop = 40.0 + MediaQuery.of(context).viewPadding.top;
    const coverAspect = 2 / 3;
    const coverBottomPadding = 30.0;

    const coverWidth = sidebarWidth - mainPadding * 2;
    const coverHeight = coverWidth / coverAspect;
    final coverOverextend =
        max((coverTop + coverHeight + coverBottomPadding) - headerHeight, 0.0);

    // anime cover image
    final coverImage = Positioned(
      top: coverTop,
      left: mainPadding,
      child: Container(
        width: sidebarWidth - mainPadding * 2,
        height: coverHeight,
        decoration: BoxDecoration(
          boxShadow: kElevationToShadow[12],
        ),
        child: buildHeroCoverImage(),
      ),
    );

    // blurred cover image
    final headerBackground = Positioned.fill(
      child: ClipRect(
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: 1000,
            sigmaY: 1000,
            tileMode: TileMode.mirror,
          ),
          child: CachedNetworkImage(
            imageUrl: "https://cdn.anidb.net/pics/anime/${initialData.picname}",
            fit: BoxFit.fill,
            fadeInDuration: const Duration(milliseconds: 100),
          ),
        ),
      ),
    );

    // anime title
    final headerContent = Padding(
      padding: const EdgeInsets.only(
        left: sidebarWidth,
        bottom: mainPadding * 0.5,
        right: mainPadding,
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          initialData.romajiName,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline1,
          textScaleFactor: 0.8,
        ),
      ),
    );

    final header = Container(
      height: headerHeight,
      color: Colors.black,
      child: Stack(
        children: [
          headerBackground,
          Container(color: Colors.black26),
          headerContent,
        ],
      ),
    );

    final contents = _DetailsBuilder(
      initialData: initialData,
      loadingBuilder: (context) => const LinearProgressIndicator(),
      builder: (result, anime, files) {
        final sidebar = Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: buildWatchButton(context, files),
            ),
            const SizedBox(height: coverBottomPadding),
            Column(
              children: [
                Text(anime.year),
                Text(anime.atype),
                Text("${anime.episodeCount} episodes"),
                Text("${anime.specialEpCount} specials"),
                Text("${anime.parodyCount} parodies"),
                Text("${anime.creditsCount} credits"),
                Text("${anime.otherCount} other"),
                Text("${anime.trailerCount} trailers"),
                Text(anime.nsfw ? "NSFW" : "SFW"),
              ],
            ),
          ],
        );

        final episodeWidgets = files.expand(
          (file) {
            if (file.episode == null) {
              return [];
            }

            if (file.episode!.episodeType == GEpisodeType.CREDIT) {
              return [];
            }

            return [_EpisodeRow(anime, file, file.episode!)];
          },
        ).toList();

        final mainColumn = Column(
          children: [
            const SizedBox(height: mainPadding),
            ...episodeWidgets,
          ],
        );

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: sidebarWidth,
              child: Padding(
                padding: EdgeInsets.only(
                  top: coverOverextend,
                  left: mainPadding,
                  right: mainPadding,
                ),
                child: sidebar,
              ),
            ),
            Expanded(
              child: mainColumn,
            ),
            const SizedBox(width: mainPadding),
          ],
        );
      },
    );

    return SizedBox.expand(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                header,
                contents,
                const SizedBox(height: 100),
              ],
            ),
            coverImage,
          ],
        ),
      ),
    );
  }

  Widget buildPhoneLayout(BuildContext context) {
    return _DetailsBuilder(
      initialData: initialData,
      loadingBuilder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: 1.0,
                child: buildHeroCoverImage(),
              ),
            ),
            const Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: LinearProgressIndicator(),
            ),
          ],
        );
      },
      builder: (context, anime, files) {
        return Stack(
          children: [
            Positioned.fill(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: 0.08,
                child: buildHeroCoverImage(),
              ),
            ),
            Positioned.fill(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      anime.romajiName,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  buildWatchButton(context, files),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Text(anime.year),
                      Text(anime.atype),
                      Text("${anime.episodeCount} episodes"),
                      Text("${anime.specialEpCount} specials"),
                      Text("${anime.parodyCount} parodies"),
                      Text("${anime.creditsCount} credits"),
                      Text("${anime.otherCount} other"),
                      Text("${anime.trailerCount} trailers"),
                      Text(anime.nsfw ? "NSFW" : "SFW"),
                    ],
                  ),
                  ...files.expand(
                    (file) {
                      if (file.episode == null) {
                        return <Widget>[];
                      }

                      if (file.episode!.episodeType == GEpisodeType.CREDIT) {
                        return <Widget>[];
                      }

                      return [
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: _EpisodeRow(anime, file, file.episode!),
                        ),
                      ];
                    },
                  ).toList(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  ElevatedButton buildWatchButton(
    BuildContext context,
    List<GGetAnimeDetailsData_anime_files> files,
  ) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.play_arrow),
      label: const Text("Watch"),
      onPressed: () async {
        Scaffold.of(context).openEndDrawer();

        final request = GLoadPlaylistReq(
          (b) => b
            ..vars.playlist.addAll(
              files.expand(
                (file) {
                  if (file.episode?.episodeType == GEpisodeType.CREDIT) {
                    return [];
                  }

                  return [file.onDisk.first];
                },
              ),
            ),
        );

        await context.read<ferry.Client>().request(request).first;
      },
    );
  }

  Hero buildHeroCoverImage() {
    return Hero(
      tag: "anime-cover-${initialData.aid}",
      child: CachedNetworkImage(
        imageUrl: "https://cdn.anidb.net/pics/anime/${initialData.picname}",
        fit: BoxFit.cover,
        fadeInDuration: const Duration(milliseconds: 100),
      ),
    );
  }
}

class _DetailsBuilder extends StatelessWidget {
  final GGetAnimeShowsData_animes initialData;

  final Widget Function(
    BuildContext context,
    GGetAnimeDetailsData_anime data,
    List<GGetAnimeDetailsData_anime_files> files,
  ) builder;

  final Widget Function(
    BuildContext context,
  ) loadingBuilder;

  const _DetailsBuilder({
    Key? key,
    required this.initialData,
    required this.builder,
    required this.loadingBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Operation<GGetAnimeDetailsData, GGetAnimeDetailsVars>(
      client: context.read<ferry.Client>(),
      operationRequest: GGetAnimeDetailsReq(
        (b) => b..vars.aid = initialData.aid,
      ),
      builder: (result, res, error) {
        if (error != null) {
          return Text(error.toString());
        }

        if (res?.linkException != null) {
          return Text(res!.linkException.toString());
        }

        if (res?.hasErrors ?? false) {
          return Text(res!.graphqlErrors.toString());
        }

        if (res == null || res.data == null) {
          return loadingBuilder(context);
        }

        final anime = res.data!.anime;
        final files = anime!.files.where((f) => f.onDisk.isNotEmpty).toList();

        files.sort((a, b) => a.onDisk.first.compareTo(b.onDisk.first));

        // episodes.sort((a, b) => a.epno.compareTo(b.epno));

        // episodes.sort((a, b) {
        //   final aEpno = int.parse(a.epno.replaceAll(RegExp("[^0-9]"), ""));
        //   final bEpno = int.parse(b.epno.replaceAll(RegExp("[^0-9]"), ""));

        //   return (a.aired + aEpno).compareTo(b.aired + bEpno);
        // });

        // episodes.sort((a, b) =>
        //     int.parse(a.epno.replaceAll(RegExp("[^0-9]"), ""))
        //         .compareTo(int.parse(b.epno.replaceAll(RegExp("[^0-9]"), ""))));

        return builder(context, anime, files);
      },
    );
  }
}

class _EpisodeRow extends StatelessWidget {
  final GGetAnimeDetailsData_anime anime;
  final GGetAnimeDetailsData_anime_files file;
  final GGetAnimeDetailsData_anime_files_episode episode;

  const _EpisodeRow(
    this.anime,
    this.file,
    this.episode, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tablet = MediaQuery.of(context).size.width > _tabletThreshold;

    final buttonHeight = Theme.of(context).buttonTheme.height;
    final height = tablet ? buttonHeight : buttonHeight * 2;

    final firstHalf = [
      const SizedBox(width: 16),
      Container(
        constraints: const BoxConstraints(
          minWidth: 20,
        ),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(episode.epno),
        ),
      ),
      const SizedBox(width: 16),
      Expanded(
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Row(
            children: [
              Text(
                episode.romaji.isNotEmpty
                    ? episode.romaji
                    : file.onDisk.first
                        .split("/")
                        .last
                        .replaceAll("_", " ")
                        .replaceAll(RegExp(r"\.\w{3,4}$"), ""),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    ];

    const limit = 2;
    final subs = file.subLanguages.toSet();
    final dubs = file.audioTracks.map((a) => a.language).toSet();
    final extraSubs = subs.length - limit;
    final extraDubs = dubs.length - limit;

    final secondHalf = [
      const SizedBox(width: 16),
      for (final sub in subs.take(limit))
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Container(
            child: Row(
              children: [
                const Icon(_subIcon, size: 16),
                const SizedBox(width: 4),
                Text(sub.substring(0, 2).toUpperCase()),
              ],
            ),
            color: _subColor,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          ),
        ),
      if (extraSubs > 0)
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Container(
            child: Row(
              children: [
                Text("+$extraSubs"),
              ],
            ),
            color: _subColor,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          ),
        ),
      for (final sub in dubs.take(limit))
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Container(
            child: Row(
              children: [
                const Icon(_audioIcon, size: 16),
                const SizedBox(width: 4),
                Text(sub.substring(0, 2).toUpperCase()),
              ],
            ),
            color: _audioColor,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          ),
        ),
      if (extraDubs > 0)
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Container(
            child: Row(
              children: [
                Text("+$extraDubs"),
              ],
            ),
            color: _audioColor,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          ),
        ),
      if (!tablet) const Spacer(),
      Opacity(
        opacity: 0.5,
        child: Text(file.group?.name ?? ""),
      ),
      const SizedBox(width: 16),
    ];

    return Material(
      color: Colors.black38,
      child: InkWell(
        onTap: () {},
        onLongPress: () => showFileDetails(context),
        child: SizedBox(
          height: height,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    ...firstHalf,
                    if (tablet) ...secondHalf,
                  ],
                ),
              ),
              if (!tablet)
                Expanded(
                  child: Row(
                    children: [
                      ...secondHalf,
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void showFileDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: buildFileDetails,
    );
  }

  Widget buildFileDetails(BuildContext context) {
    final details = [
      [
        "Length",
        formatSeconds(file.lengthInSeconds),
      ],
      [
        "Aired",
        DateFormat.yMMMd()
            .format(DateTime.fromMillisecondsSinceEpoch(episode.aired * 1000)),
      ],
      [
        "Source",
        file.source,
      ],
      [
        "Quality",
        file.quality,
      ],
      [
        "Released by",
        file.group?.name ?? "",
      ],
    ];

    final detailsColumn = Column(
      children: [
        for (final field in details)
          Row(
            children: [
              Text(
                field.first,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const Spacer(),
              Text(
                field.last,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
      ],
    );

    final subsColumn = Column(
      children: file.subLanguages
          .toSet()
          .expand(
            (sub) => [
              ListTile(
                tileColor: _subColor,
                leading: Icon(
                  sub == "none" ? Icons.subtitles_off : _subIcon,
                ),
                title:
                    Text(sub.substring(0, 1).toUpperCase() + sub.substring(1)),
              )
            ],
          )
          .toList(),
    );

    final videoColumn = Column(
      children: [
        for (final track in file.videoTracks)
          ListTile(
            tileColor: _videoColor,
            leading: const Icon(_videoIcon),
            title: Text(
              track.codec,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: (track.colourDepth?.isNotEmpty ?? false)
                ? Text(
                    "${track.colourDepth!} bit color",
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                : null,
            trailing: Text(
              "${track.bitrate} kbps",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
      ],
    );

    final audioColumn = Column(
      children: [
        for (final track in file.audioTracks)
          ListTile(
            tileColor: _audioColor,
            leading: const Icon(_audioIcon),
            title: Text(
              track.codec,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text(
              track.language.substring(0, 1).toUpperCase() +
                  track.language.substring(1),
              style: Theme.of(context).textTheme.bodyText2,
            ),
            trailing: Text(
              "${track.bitrate} kbps",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
      ],
    );

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${anime.romajiName} - ${episode.epno} ${episode.romaji}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            for (final path in file.onDisk)
              Text(
                path,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      detailsColumn,
                      const Divider(),
                      subsColumn,
                    ],
                  ),
                ),
                const VerticalDivider(),
                Expanded(
                  child: Column(
                    children: [
                      audioColumn,
                      const Divider(),
                      videoColumn,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String formatSeconds(int seconds) {
    if (seconds < 60) {
      return "${seconds}s";
    } else if (seconds < 3600) {
      return "${seconds ~/ 60}m ${seconds % 60}s";
    } else {
      return "${seconds ~/ 3600}h ${(seconds % 3600) ~/ 60}m ${seconds % 60}s";
    }
  }
}
