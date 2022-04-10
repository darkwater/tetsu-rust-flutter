import 'package:cached_network_image/cached_network_image.dart';
import 'package:ferry/ferry.dart' as ferry;
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetsu/cubit/remote_cubit.dart';
import 'package:tetsu/gql/get_anime_shows.data.gql.dart';
import 'package:tetsu/gql/get_anime_shows.req.gql.dart';
import 'package:tetsu/gql/get_anime_shows.var.gql.dart';
import 'package:tetsu/pages/anime/details/anime_details.dart';
import 'package:tetsu/widgets/player_popup_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          BlocBuilder<RemoteCubit, RemoteState>(builder: (context, state) {
            return IconButton(
              icon: const Icon(Icons.cast_connected),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: "Connected to ${state.remote!.name}",
            );
          }),
        ],
      ),
      body: ListView(
        children: const [
          AnimeGallery(),
        ],
      ),
      floatingActionButton: const PlayerPopupButton(),
    );
  }
}

class AnimeGallery extends StatelessWidget {
  const AnimeGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => print("anime"),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 32,
              bottom: 16,
            ),
            child: Row(
              children: [
                Text(
                  "Anime",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    top: 6,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).textTheme.headlineLarge?.color,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 500,
          child: Operation<GGetAnimeShowsData, GGetAnimeShowsVars>(
            client: context.read<ferry.Client>(),
            operationRequest: GGetAnimeShowsReq(
              (b) => b
                ..vars.limit = 9999
                ..vars.offset = 0,
            ),
            builder: (context, res, error) {
              if (error != null) {
                return Text(error.toString());
              }

              if (res?.hasErrors ?? false) {
                return Text(res!.graphqlErrors.toString());
              }

              if (res == null || res.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final animes = res.data!.animes.toList();

              animes.sort((a, b) => b.aid.compareTo(a.aid));

              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: animes.length,
                itemBuilder: (context, index) {
                  final anime = animes[index];

                  return MediaCard(anime: anime);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class MediaCard extends StatelessWidget {
  final GGetAnimeShowsData_animes anime;

  const MediaCard({
    Key? key,
    required this.anime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Hero(
                  tag: "anime-cover-${anime.aid}",
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://cdn.anidb.net/pics/anime/${anime.picname}",
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(milliseconds: 100),
                  ),
                ),
              ),
              LinearProgressIndicator(
                value: anime.watchProgress?.progress ?? 0,
              ),
              SizedBox(
                height: 44,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    anime.romajiName,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    textScaleFactor: 0.9,
                  ),
                ),
              ),
            ],
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                AnimeDetailsPage.route(anime),
              ),
            ),
          )
        ],
      ),
    );
  }
}
