import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tetsu/cubit/remote_cubit.dart';
import 'package:tetsu/pages/anime/details/anime_details.dart';

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
    );
  }
}

class AnimeGallery extends StatelessWidget {
  const AnimeGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const getShowsQuery = """
      query(\$limit: Int!, \$offset: Int!) {
        animes(limit: \$limit, offset: \$offset) {
          aid
          romajiName
          picname
          year
        }
      }
    """;

    final opts = QueryOptions(
      document: gql(getShowsQuery),
      variables: {
        "limit": 9999,
        "offset": 0,
      },
    );

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
          height: 300,
          child: Query(
            options: opts,
            builder: (result, {fetchMore, refetch}) {
              if (result.hasException) {
                // log(result.exception.toString());
                return Text(result.exception.toString());
              }

              if (result.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: result.data!["animes"].length,
                itemExtent: 200,
                itemBuilder: (context, index) {
                  final anime = result.data!["animes"][index];

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
  final dynamic anime;

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
                  tag: "anime-cover-${anime["aid"]}",
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://cdn.anidb.net/pics/anime/${anime["picname"]}",
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(milliseconds: 100),
                  ),
                ),
              ),
              SizedBox(
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    anime["romajiName"],
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
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
