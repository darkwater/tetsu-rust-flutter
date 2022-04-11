// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:tetsu/gql/player_seek.ast.gql.dart' as _i5;
import 'package:tetsu/gql/player_seek.data.gql.dart' as _i2;
import 'package:tetsu/gql/player_seek.var.gql.dart' as _i3;
import 'package:tetsu/gql/serializers.gql.dart' as _i6;

part 'player_seek.req.gql.g.dart';

abstract class GPlayerSeekReq
    implements
        Built<GPlayerSeekReq, GPlayerSeekReqBuilder>,
        _i1.OperationRequest<_i2.GPlayerSeekData, _i3.GPlayerSeekVars> {
  GPlayerSeekReq._();

  factory GPlayerSeekReq([Function(GPlayerSeekReqBuilder b) updates]) =
      _$GPlayerSeekReq;

  static void _initializeBuilder(GPlayerSeekReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'PlayerSeek')
    ..executeOnListen = true;
  _i3.GPlayerSeekVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GPlayerSeekData? Function(_i2.GPlayerSeekData?, _i2.GPlayerSeekData?)?
      get updateResult;
  _i2.GPlayerSeekData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GPlayerSeekData? parseData(Map<String, dynamic> json) =>
      _i2.GPlayerSeekData.fromJson(json);
  static Serializer<GPlayerSeekReq> get serializer =>
      _$gPlayerSeekReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GPlayerSeekReq.serializer, this)
          as Map<String, dynamic>);
  static GPlayerSeekReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GPlayerSeekReq.serializer, json);
}
