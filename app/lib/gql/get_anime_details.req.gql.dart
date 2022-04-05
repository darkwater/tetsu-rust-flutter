// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:tetsu/gql/get_anime_details.ast.gql.dart' as _i5;
import 'package:tetsu/gql/get_anime_details.data.gql.dart' as _i2;
import 'package:tetsu/gql/get_anime_details.var.gql.dart' as _i3;
import 'package:tetsu/gql/serializers.gql.dart' as _i6;

part 'get_anime_details.req.gql.g.dart';

abstract class GGetAnimeDetailsReq
    implements
        Built<GGetAnimeDetailsReq, GGetAnimeDetailsReqBuilder>,
        _i1.OperationRequest<_i2.GGetAnimeDetailsData,
            _i3.GGetAnimeDetailsVars> {
  GGetAnimeDetailsReq._();

  factory GGetAnimeDetailsReq(
      [Function(GGetAnimeDetailsReqBuilder b) updates]) = _$GGetAnimeDetailsReq;

  static void _initializeBuilder(GGetAnimeDetailsReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'GetAnimeDetails')
    ..executeOnListen = true;
  _i3.GGetAnimeDetailsVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GGetAnimeDetailsData? Function(
      _i2.GGetAnimeDetailsData?, _i2.GGetAnimeDetailsData?)? get updateResult;
  _i2.GGetAnimeDetailsData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GGetAnimeDetailsData? parseData(Map<String, dynamic> json) =>
      _i2.GGetAnimeDetailsData.fromJson(json);
  static Serializer<GGetAnimeDetailsReq> get serializer =>
      _$gGetAnimeDetailsReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GGetAnimeDetailsReq.serializer, this)
          as Map<String, dynamic>);
  static GGetAnimeDetailsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GGetAnimeDetailsReq.serializer, json);
}
