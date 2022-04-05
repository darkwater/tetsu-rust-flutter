// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:tetsu/gql/get_anime_shows.ast.gql.dart' as _i5;
import 'package:tetsu/gql/get_anime_shows.data.gql.dart' as _i2;
import 'package:tetsu/gql/get_anime_shows.var.gql.dart' as _i3;
import 'package:tetsu/gql/serializers.gql.dart' as _i6;

part 'get_anime_shows.req.gql.g.dart';

abstract class GGetAnimeShowsReq
    implements
        Built<GGetAnimeShowsReq, GGetAnimeShowsReqBuilder>,
        _i1.OperationRequest<_i2.GGetAnimeShowsData, _i3.GGetAnimeShowsVars> {
  GGetAnimeShowsReq._();

  factory GGetAnimeShowsReq([Function(GGetAnimeShowsReqBuilder b) updates]) =
      _$GGetAnimeShowsReq;

  static void _initializeBuilder(GGetAnimeShowsReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'GetAnimeShows')
    ..executeOnListen = true;
  _i3.GGetAnimeShowsVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GGetAnimeShowsData? Function(
      _i2.GGetAnimeShowsData?, _i2.GGetAnimeShowsData?)? get updateResult;
  _i2.GGetAnimeShowsData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GGetAnimeShowsData? parseData(Map<String, dynamic> json) =>
      _i2.GGetAnimeShowsData.fromJson(json);
  static Serializer<GGetAnimeShowsReq> get serializer =>
      _$gGetAnimeShowsReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GGetAnimeShowsReq.serializer, this)
          as Map<String, dynamic>);
  static GGetAnimeShowsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GGetAnimeShowsReq.serializer, json);
}
