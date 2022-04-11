// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:tetsu/gql/get_player_status.ast.gql.dart' as _i5;
import 'package:tetsu/gql/get_player_status.data.gql.dart' as _i2;
import 'package:tetsu/gql/get_player_status.var.gql.dart' as _i3;
import 'package:tetsu/gql/serializers.gql.dart' as _i6;

part 'get_player_status.req.gql.g.dart';

abstract class GGetPlayerStatusReq
    implements
        Built<GGetPlayerStatusReq, GGetPlayerStatusReqBuilder>,
        _i1.OperationRequest<_i2.GGetPlayerStatusData,
            _i3.GGetPlayerStatusVars> {
  GGetPlayerStatusReq._();

  factory GGetPlayerStatusReq(
      [Function(GGetPlayerStatusReqBuilder b) updates]) = _$GGetPlayerStatusReq;

  static void _initializeBuilder(GGetPlayerStatusReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'GetPlayerStatus')
    ..executeOnListen = true;
  _i3.GGetPlayerStatusVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GGetPlayerStatusData? Function(
      _i2.GGetPlayerStatusData?, _i2.GGetPlayerStatusData?)? get updateResult;
  _i2.GGetPlayerStatusData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GGetPlayerStatusData? parseData(Map<String, dynamic> json) =>
      _i2.GGetPlayerStatusData.fromJson(json);
  static Serializer<GGetPlayerStatusReq> get serializer =>
      _$gGetPlayerStatusReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GGetPlayerStatusReq.serializer, this)
          as Map<String, dynamic>);
  static GGetPlayerStatusReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GGetPlayerStatusReq.serializer, json);
}
