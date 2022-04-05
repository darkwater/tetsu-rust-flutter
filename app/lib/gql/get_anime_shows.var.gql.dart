// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tetsu/gql/serializers.gql.dart' as _i1;

part 'get_anime_shows.var.gql.g.dart';

abstract class GGetAnimeShowsVars
    implements Built<GGetAnimeShowsVars, GGetAnimeShowsVarsBuilder> {
  GGetAnimeShowsVars._();

  factory GGetAnimeShowsVars([Function(GGetAnimeShowsVarsBuilder b) updates]) =
      _$GGetAnimeShowsVars;

  int get limit;
  int get offset;
  static Serializer<GGetAnimeShowsVars> get serializer =>
      _$gGetAnimeShowsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GGetAnimeShowsVars.serializer, this)
          as Map<String, dynamic>);
  static GGetAnimeShowsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GGetAnimeShowsVars.serializer, json);
}
