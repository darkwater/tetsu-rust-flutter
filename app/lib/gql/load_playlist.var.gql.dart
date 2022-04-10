// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tetsu/gql/serializers.gql.dart' as _i1;

part 'load_playlist.var.gql.g.dart';

abstract class GLoadPlaylistVars
    implements Built<GLoadPlaylistVars, GLoadPlaylistVarsBuilder> {
  GLoadPlaylistVars._();

  factory GLoadPlaylistVars([Function(GLoadPlaylistVarsBuilder b) updates]) =
      _$GLoadPlaylistVars;

  BuiltList<String> get playlist;
  static Serializer<GLoadPlaylistVars> get serializer =>
      _$gLoadPlaylistVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GLoadPlaylistVars.serializer, this)
          as Map<String, dynamic>);
  static GLoadPlaylistVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GLoadPlaylistVars.serializer, json);
}
