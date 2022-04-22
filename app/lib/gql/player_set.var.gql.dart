// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tetsu/gql/serializers.gql.dart' as _i1;

part 'player_set.var.gql.g.dart';

abstract class GPlayerSetVars
    implements Built<GPlayerSetVars, GPlayerSetVarsBuilder> {
  GPlayerSetVars._();

  factory GPlayerSetVars([Function(GPlayerSetVarsBuilder b) updates]) =
      _$GPlayerSetVars;

  int? get chapter;
  bool? get paused;
  int? get playlistPlayIndex;
  static Serializer<GPlayerSetVars> get serializer =>
      _$gPlayerSetVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPlayerSetVars.serializer, this)
          as Map<String, dynamic>);
  static GPlayerSetVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPlayerSetVars.serializer, json);
}
