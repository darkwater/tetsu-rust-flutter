import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tetsu/cubit/remote_cubit.dart';

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
    String getShowsQuery = """
      query(\$limit: Int!, \$offset: Int!) {
        anime(limit: \$limit, offset: \$offset) {
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
        "limit": 200,
        "offset": 0,
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 32,
            bottom: 16,
          ),
          child: Text(
            "Anime",
            style: Theme.of(context).textTheme.headlineLarge,
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

              // return ListView(
              //   scrollDirection: Axis.horizontal,
              //   children: [
              //     for (final anime in result.data!["anime"])
              //       SizedBox(
              //         width: 200,
              //         child: Card(
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.stretch,
              //             children: [
              //               Expanded(
              //                 child: Image.network(
              //                   "https://cdn.anidb.net/pics/anime/${anime["picname"]}",
              //                   fit: BoxFit.cover,
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 48,
              //                 child: Center(
              //                   child: Text(
              //                     anime["romajiName"],
              //                     textAlign: TextAlign.center,
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //           clipBehavior: Clip.antiAlias,
              //         ),
              //       ),
              //   ],
              // );

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: result.data!["anime"].length,
                itemExtent: 200,
                itemBuilder: (context, index) {
                  final anime = result.data!["anime"][index];

                  return SizedBox(
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Image.network(
                              "https://cdn.anidb.net/pics/anime/${anime["picname"]}",
                              fit: BoxFit.cover,
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
                      clipBehavior: Clip.antiAlias,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
