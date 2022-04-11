// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tetsu/gql/serializers.gql.dart' as _i1;

part 'player_seek.var.gql.g.dart';

abstract class GPlayerSeekVars
    implements Built<GPlayerSeekVars, GPlayerSeekVarsBuilder> {
  GPlayerSeekVars._();

  factory GPlayerSeekVars([Function(GPlayerSeekVarsBuilder b) updates]) =
      _$GPlayerSeekVars;

  double? get to;
  double? get by;
  static Serializer<GPlayerSeekVars> get serializer =>
      _$gPlayerSeekVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPlayerSeekVars.serializer, this)
          as Map<String, dynamic>);
  static GPlayerSeekVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPlayerSeekVars.serializer, json);
}
