// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tetsu/gql/serializers.gql.dart' as _i1;

part 'get_player_status.data.gql.g.dart';

abstract class GGetPlayerStatusData
    implements Built<GGetPlayerStatusData, GGetPlayerStatusDataBuilder> {
  GGetPlayerStatusData._();

  factory GGetPlayerStatusData(
          [Function(GGetPlayerStatusDataBuilder b) updates]) =
      _$GGetPlayerStatusData;

  static void _initializeBuilder(GGetPlayerStatusDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetPlayerStatusData_player get player;
  static Serializer<GGetPlayerStatusData> get serializer =>
      _$gGetPlayerStatusDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GGetPlayerStatusData.serializer, this)
          as Map<String, dynamic>);
  static GGetPlayerStatusData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GGetPlayerStatusData.serializer, json);
}

abstract class GGetPlayerStatusData_player
    implements
        Built<GGetPlayerStatusData_player, GGetPlayerStatusData_playerBuilder> {
  GGetPlayerStatusData_player._();

  factory GGetPlayerStatusData_player(
          [Function(GGetPlayerStatusData_playerBuilder b) updates]) =
      _$GGetPlayerStatusData_player;

  static void _initializeBuilder(GGetPlayerStatusData_playerBuilder b) =>
      b..G__typename = 'PlayerQuery';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool? get paused;
  String? get mediaTitle;
  int? get playlistPos;
  int? get playlistCount;
  int? get chapter;
  int? get chapters;
  double? get timePos;
  double? get timeRemaining;
  bool? get seekable;
  static Serializer<GGetPlayerStatusData_player> get serializer =>
      _$gGetPlayerStatusDataPlayerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GGetPlayerStatusData_player.serializer, this) as Map<String, dynamic>);
  static GGetPlayerStatusData_player? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GGetPlayerStatusData_player.serializer, json);
}
