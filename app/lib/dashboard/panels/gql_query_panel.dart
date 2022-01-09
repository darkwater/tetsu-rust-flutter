import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:provider/provider.dart';

import '../../remote.dart';
import '../../remote_manager.dart';

abstract class GqlQueryPanel extends StatefulWidget {
  final String query;
  final int pollInterval;
  final EdgeInsets padding;

  const GqlQueryPanel({
    Key? key,
    required this.query,
    this.pollInterval = 60,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  }) : super(key: key);

  @override
  State<GqlQueryPanel> createState() => _GqlQueryPanelState();

  Widget build(BuildContext context, Map<String, dynamic> data);
}

class _GqlQueryPanelState extends State<GqlQueryPanel> {
  late Stream<QueryResult> _queryStream;
  late Remote remote;
  ObservableQuery? _obsQuery;

  @override
  void initState() {
    super.initState();

    const id = 3607528134;

    _queryStream = (() async* {
      remote = Provider.of<RemoteManager>(context, listen: false).remotes[id]!;

      final gqlClient = await remote.gqlClient;

      final query = gql(widget.query);

      final qopts = WatchQueryOptions(
        document: query,
        pollInterval: Duration(
          seconds: widget.pollInterval,
        ),
        errorPolicy: ErrorPolicy.all,
      );

      _obsQuery = gqlClient.watchQuery(qopts)..fetchResults();

      try {
        log("starting");
        yield* _obsQuery!.stream;
        log("ended");
      } catch (e) {
        log("caught $e");
      }
    })();
  }

  @override
  void dispose() {
    _obsQuery?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: widget.padding,
        child: StreamBuilder<QueryResult>(
          stream: _queryStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              log(snapshot.error.toString());
            }

            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data!.data == null && snapshot.data!.hasException) {
              return Text(
                snapshot.data!.exception!.toString(),
                style: const TextStyle(color: Colors.red),
              );
            }

            final data = snapshot.data!.data!;
            return widget.build(context, data);
          },
        ),
      ),
    );
  }
}
