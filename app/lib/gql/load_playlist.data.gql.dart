// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tetsu/gql/serializers.gql.dart' as _i1;

part 'load_playlist.data.gql.g.dart';

abstract class GLoadPlaylistData
    implements Built<GLoadPlaylistData, GLoadPlaylistDataBuilder> {
  GLoadPlaylistData._();

  factory GLoadPlaylistData([Function(GLoadPlaylistDataBuilder b) updates]) =
      _$GLoadPlaylistData;

  static void _initializeBuilder(GLoadPlaylistDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GLoadPlaylistData_player get player;
  static Serializer<GLoadPlaylistData> get serializer =>
      _$gLoadPlaylistDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GLoadPlaylistData.serializer, this)
          as Map<String, dynamic>);
  static GLoadPlaylistData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GLoadPlaylistData.serializer, json);
}

abstract class GLoadPlaylistData_player
    implements
        Built<GLoadPlaylistData_player, GLoadPlaylistData_playerBuilder> {
  GLoadPlaylistData_player._();

  factory GLoadPlaylistData_player(
          [Function(GLoadPlaylistData_playerBuilder b) updates]) =
      _$GLoadPlaylistData_player;

  static void _initializeBuilder(GLoadPlaylistData_playerBuilder b) =>
      b..G__typename = 'PlayerMutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get loadPlaylist;
  static Serializer<GLoadPlaylistData_player> get serializer =>
      _$gLoadPlaylistDataPlayerSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GLoadPlaylistData_player.serializer, this)
          as Map<String, dynamic>);
  static GLoadPlaylistData_player? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GLoadPlaylistData_player.serializer, json);
}
