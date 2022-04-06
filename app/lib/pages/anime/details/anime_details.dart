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
import 'package:tetsu/gql/schema.schema.gql.dart';

const _subColor = Color(0xAF3F51B5); // indigo
const _videoColor = Color(0xAF9C27B0); // purple
const _audioColor = Color(0xAFD32F2F); // red shade700

const _subIcon = Icons.subtitles_outlined;
const _videoIcon = Icons.movie_outlined;
const _audioIcon = Icons.volume_up_outlined;

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
          if (constraints.maxWidth > 800) {
            return buildTabletLayout(context);
          } else {
            return buildPhoneLayout(context);
          }
        },
      ),
    );
  }

  Widget buildTabletLayout(BuildContext context) {
    const mainPadding = 40.0;
    const sidebarWidth = 350.0;
    const headerHeight = 400.0;
    const coverTop = 70.0;
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
      child: SizedBox(
        width: sidebarWidth - mainPadding * 2,
        height: coverHeight,
        child: Hero(
          tag: "anime-cover-${initialData.aid}",
          child: CachedNetworkImage(
            imageUrl: "https://cdn.anidb.net/pics/anime/${initialData.picname}",
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 100),
          ),
        ),
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

    final contents = Operation<GGetAnimeDetailsData, GGetAnimeDetailsVars>(
      client: context.read<ferry.Client>(),
      operationRequest: GGetAnimeDetailsReq(
        (b) => b..vars.aid = initialData.aid,
      ),
      builder: (result, res, error) {
        if (error != null) {
          return Text(error.toString());
        }

        if (res?.hasErrors ?? false) {
          return Text(res!.graphqlErrors.toString());
        }

        if (res == null || res.data == null) {
          return const LinearProgressIndicator();
        }

        final anime = res.data!.anime;
        final episodes = anime!.episodes.toList();

        episodes.sort((a, b) => a.epno.compareTo(b.epno));

        final sidebar = Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.play_arrow),
                label: const Text("Watch"),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: coverBottomPadding),
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
        );

        final episodeWidgets = episodes
            .map(
              (episode) {
                if (episode.episodeType == GEpisodeType.CREDIT) {
                  return [];
                }

                return episode.files.map(
                  (file) {
                    return _EpisodeRow(anime, episode, file);
                  },
                ).toList();
              },
            )
            .toList()
            .expand((v) => v);

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
    return Center(
      child: Text("Anime ${initialData.aid} Details Page"),
    );
  }
}

class _EpisodeRow extends StatelessWidget {
  final GGetAnimeDetailsData_anime anime;
  final GGetAnimeDetailsData_anime_episodes episode;
  final GGetAnimeDetailsData_anime_episodes_files file;

  const _EpisodeRow(
    this.anime,
    this.episode,
    this.file, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: InkWell(
        onTap: () {},
        onLongPress: () => showFileDetails(context),
        child: SizedBox(
          height: Theme.of(context).buttonTheme.height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
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
                  child: Text(
                    episode.romaji,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              for (final sub in file.subLanguages.toSet())
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  ),
                ),
              for (final sub in file.audioTracks.map((a) => a.language).toSet())
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  ),
                ),
              Opacity(
                opacity: 0.5,
                child: Text(file.group?.name ?? ""),
              ),
              const SizedBox(width: 16),
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

  // "eid": 230108,
  // "length": 30,
  // "rating": 630,
  // "votes": 16,
  // "epno": "01",
  // "eng": "Each One`s Promise",
  // "romaji": "Sorezore no Chikai",
  // "kanji": "それぞれの誓い",
  // "aired": 1594166400,
  // "episodeType": "REGULAR",
  // "files": [
  //   {
  //     "fid": 2771953,
  //     "state": 1,
  //     "size": 1706456,
  //     "quality": "high",
  //     "source": "www",
  //     "subLanguages": [
  //       "english"
  //     ],
  //     "videoTracks": [
  //       {
  //         "colourDepth": "",
  //         "codec": "H264/AVC",
  //         "bitrate": "7970"
  //       }
  //     ],
  //     "audioTracks": [
  //       {
  //         "codec": "(HE-)AAC",
  //         "bitrate": "128",
  //         "language": "japanese"
  //       }
  //     ],
  //     "lengthInSeconds": 1720,
  //     "description": "",
  //     "airedDate": 1594166400,
  //     "onDisk": [
  //       "/data/torrents/anime/[SubsPlease] Re Zero kara Hajimeru Isekai Seikatsu (26-50) (1080p) [Batch]/[SubsPlease] Re Zero kara Hajimeru Isekai Seikatsu - 26 (1080p) [801C6194].mkv"
  //     ]
  //   }

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
