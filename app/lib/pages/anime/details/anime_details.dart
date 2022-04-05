import 'dart:math' show max;
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ferry/ferry.dart' as ferry;
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tetsu/gql/get_anime_details.data.gql.dart';
import 'package:tetsu/gql/get_anime_details.req.gql.dart';
import 'package:tetsu/gql/get_anime_details.var.gql.dart';
import 'package:tetsu/gql/get_anime_shows.data.gql.dart';

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
              (episode) => episode.files.map(
                (file) {
                  return Row(
                    children: [
                      Text(episode.epno),
                      const SizedBox(width: 10),
                      Text(episode.romaji),
                      const SizedBox(width: 10),
                      for (final sub in file.subLanguages) Text("Sub $sub"),
                      const SizedBox(width: 10),
                      for (final dub in file.audioTracks)
                        Text("Dub ${dub.language}"),
                      const SizedBox(width: 10),
                      Text(file.group?.name ?? "(??)"),
                    ],
                  );
                },
              ),
            )
            .toList()
            .expand((v) => v);

        final mainColumn = Column(
          children: [
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
