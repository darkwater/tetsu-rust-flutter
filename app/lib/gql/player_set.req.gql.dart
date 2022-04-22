// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:tetsu/gql/player_set.ast.gql.dart' as _i5;
import 'package:tetsu/gql/player_set.data.gql.dart' as _i2;
import 'package:tetsu/gql/player_set.var.gql.dart' as _i3;
import 'package:tetsu/gql/serializers.gql.dart' as _i6;

part 'player_set.req.gql.g.dart';

abstract class GPlayerSetReq
    implements
        Built<GPlayerSetReq, GPlayerSetReqBuilder>,
        _i1.OperationRequest<_i2.GPlayerSetData, _i3.GPlayerSetVars> {
  GPlayerSetReq._();

  factory GPlayerSetReq([Function(GPlayerSetReqBuilder b) updates]) =
      _$GPlayerSetReq;

  static void _initializeBuilder(GPlayerSetReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'PlayerSet')
    ..executeOnListen = true;
  _i3.GPlayerSetVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GPlayerSetData? Function(_i2.GPlayerSetData?, _i2.GPlayerSetData?)?
      get updateResult;
  _i2.GPlayerSetData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GPlayerSetData? parseData(Map<String, dynamic> json) =>
      _i2.GPlayerSetData.fromJson(json);
  static Serializer<GPlayerSetReq> get serializer => _$gPlayerSetReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GPlayerSetReq.serializer, this)
          as Map<String, dynamic>);
  static GPlayerSetReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GPlayerSetReq.serializer, json);
}
