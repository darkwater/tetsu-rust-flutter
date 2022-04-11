// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tetsu/gql/serializers.gql.dart' as _i1;

part 'get_player_status.var.gql.g.dart';

abstract class GGetPlayerStatusVars
    implements Built<GGetPlayerStatusVars, GGetPlayerStatusVarsBuilder> {
  GGetPlayerStatusVars._();

  factory GGetPlayerStatusVars(
          [Function(GGetPlayerStatusVarsBuilder b) updates]) =
      _$GGetPlayerStatusVars;

  static Serializer<GGetPlayerStatusVars> get serializer =>
      _$gGetPlayerStatusVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GGetPlayerStatusVars.serializer, this)
          as Map<String, dynamic>);
  static GGetPlayerStatusVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GGetPlayerStatusVars.serializer, json);
}
