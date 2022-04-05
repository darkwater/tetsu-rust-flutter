// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tetsu/gql/serializers.gql.dart' as _i1;

part 'get_anime_details.var.gql.g.dart';

abstract class GGetAnimeDetailsVars
    implements Built<GGetAnimeDetailsVars, GGetAnimeDetailsVarsBuilder> {
  GGetAnimeDetailsVars._();

  factory GGetAnimeDetailsVars(
          [Function(GGetAnimeDetailsVarsBuilder b) updates]) =
      _$GGetAnimeDetailsVars;

  int get aid;
  static Serializer<GGetAnimeDetailsVars> get serializer =>
      _$gGetAnimeDetailsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GGetAnimeDetailsVars.serializer, this)
          as Map<String, dynamic>);
  static GGetAnimeDetailsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GGetAnimeDetailsVars.serializer, json);
}
