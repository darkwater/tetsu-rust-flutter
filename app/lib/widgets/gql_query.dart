import 'package:ferry/ferry.dart' as ferry;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GqlQuery<T extends ferry.OperationRequest<TData, TVars>, TData, TVars>
    extends StatefulWidget {
  final T Function() request;

  final Widget Function(
    BuildContext,
    AsyncSnapshot<ferry.OperationResponse<TData, TVars>>,
  ) builder;

  const GqlQuery({
    Key? key,
    required this.request,
    required this.builder,
  }) : super(key: key);

  @override
  State<GqlQuery<T, TData, TVars>> createState() =>
      _GqlQueryState<T, TData, TVars>();
}

class _GqlQueryState<T extends ferry.OperationRequest<TData, TVars>, TData,
    TVars> extends State<GqlQuery<T, TData, TVars>> {
  late T _request;

  @override
  void initState() {
    super.initState();

    _request = widget.request();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ferry.Client>(builder: (context, gqlClient, _) {
      return StreamBuilder<ferry.OperationResponse<TData, TVars>>(
        stream: gqlClient.request(_request),
        builder: widget.builder,
      );
    });
  }
}
