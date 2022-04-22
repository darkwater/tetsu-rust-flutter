// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tetsu/gql/serializers.gql.dart' as _i1;

part 'player_set.data.gql.g.dart';

abstract class GPlayerSetData
    implements Built<GPlayerSetData, GPlayerSetDataBuilder> {
  GPlayerSetData._();

  factory GPlayerSetData([Function(GPlayerSetDataBuilder b) updates]) =
      _$GPlayerSetData;

  static void _initializeBuilder(GPlayerSetDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GPlayerSetData_player get player;
  static Serializer<GPlayerSetData> get serializer =>
      _$gPlayerSetDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPlayerSetData.serializer, this)
          as Map<String, dynamic>);
  static GPlayerSetData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPlayerSetData.serializer, json);
}

abstract class GPlayerSetData_player
    implements Built<GPlayerSetData_player, GPlayerSetData_playerBuilder> {
  GPlayerSetData_player._();

  factory GPlayerSetData_player(
          [Function(GPlayerSetData_playerBuilder b) updates]) =
      _$GPlayerSetData_player;

  static void _initializeBuilder(GPlayerSetData_playerBuilder b) =>
      b..G__typename = 'PlayerMutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get set;
  static Serializer<GPlayerSetData_player> get serializer =>
      _$gPlayerSetDataPlayerSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPlayerSetData_player.serializer, this)
          as Map<String, dynamic>);
  static GPlayerSetData_player? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPlayerSetData_player.serializer, json);
}
