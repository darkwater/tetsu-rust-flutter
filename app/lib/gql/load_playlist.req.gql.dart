// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:tetsu/gql/load_playlist.ast.gql.dart' as _i5;
import 'package:tetsu/gql/load_playlist.data.gql.dart' as _i2;
import 'package:tetsu/gql/load_playlist.var.gql.dart' as _i3;
import 'package:tetsu/gql/serializers.gql.dart' as _i6;

part 'load_playlist.req.gql.g.dart';

abstract class GLoadPlaylistReq
    implements
        Built<GLoadPlaylistReq, GLoadPlaylistReqBuilder>,
        _i1.OperationRequest<_i2.GLoadPlaylistData, _i3.GLoadPlaylistVars> {
  GLoadPlaylistReq._();

  factory GLoadPlaylistReq([Function(GLoadPlaylistReqBuilder b) updates]) =
      _$GLoadPlaylistReq;

  static void _initializeBuilder(GLoadPlaylistReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'LoadPlaylist')
    ..executeOnListen = true;
  _i3.GLoadPlaylistVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GLoadPlaylistData? Function(
      _i2.GLoadPlaylistData?, _i2.GLoadPlaylistData?)? get updateResult;
  _i2.GLoadPlaylistData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GLoadPlaylistData? parseData(Map<String, dynamic> json) =>
      _i2.GLoadPlaylistData.fromJson(json);
  static Serializer<GLoadPlaylistReq> get serializer =>
      _$gLoadPlaylistReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GLoadPlaylistReq.serializer, this)
          as Map<String, dynamic>);
  static GLoadPlaylistReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GLoadPlaylistReq.serializer, json);
}
