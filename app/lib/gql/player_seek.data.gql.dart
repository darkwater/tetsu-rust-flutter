// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tetsu/gql/serializers.gql.dart' as _i1;

part 'player_seek.data.gql.g.dart';

abstract class GPlayerSeekData
    implements Built<GPlayerSeekData, GPlayerSeekDataBuilder> {
  GPlayerSeekData._();

  factory GPlayerSeekData([Function(GPlayerSeekDataBuilder b) updates]) =
      _$GPlayerSeekData;

  static void _initializeBuilder(GPlayerSeekDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GPlayerSeekData_player get player;
  static Serializer<GPlayerSeekData> get serializer =>
      _$gPlayerSeekDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPlayerSeekData.serializer, this)
          as Map<String, dynamic>);
  static GPlayerSeekData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPlayerSeekData.serializer, json);
}

abstract class GPlayerSeekData_player
    implements Built<GPlayerSeekData_player, GPlayerSeekData_playerBuilder> {
  GPlayerSeekData_player._();

  factory GPlayerSeekData_player(
          [Function(GPlayerSeekData_playerBuilder b) updates]) =
      _$GPlayerSeekData_player;

  static void _initializeBuilder(GPlayerSeekData_playerBuilder b) =>
      b..G__typename = 'PlayerMutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double? get seek;
  static Serializer<GPlayerSeekData_player> get serializer =>
      _$gPlayerSeekDataPlayerSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPlayerSeekData_player.serializer, this)
          as Map<String, dynamic>);
  static GPlayerSeekData_player? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPlayerSeekData_player.serializer, json);
}
