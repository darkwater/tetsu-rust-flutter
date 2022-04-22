// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tetsu/gql/serializers.gql.dart' as _i1;

part 'get_anime_shows.data.gql.g.dart';

abstract class GGetAnimeShowsData
    implements Built<GGetAnimeShowsData, GGetAnimeShowsDataBuilder> {
  GGetAnimeShowsData._();

  factory GGetAnimeShowsData([Function(GGetAnimeShowsDataBuilder b) updates]) =
      _$GGetAnimeShowsData;

  static void _initializeBuilder(GGetAnimeShowsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetAnimeShowsData_animes> get animes;
  static Serializer<GGetAnimeShowsData> get serializer =>
      _$gGetAnimeShowsDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GGetAnimeShowsData.serializer, this)
          as Map<String, dynamic>);
  static GGetAnimeShowsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GGetAnimeShowsData.serializer, json);
}

abstract class GGetAnimeShowsData_animes
    implements
        Built<GGetAnimeShowsData_animes, GGetAnimeShowsData_animesBuilder> {
  GGetAnimeShowsData_animes._();

  factory GGetAnimeShowsData_animes(
          [Function(GGetAnimeShowsData_animesBuilder b) updates]) =
      _$GGetAnimeShowsData_animes;

  static void _initializeBuilder(GGetAnimeShowsData_animesBuilder b) =>
      b..G__typename = 'AnimeQuery';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get aid;
  String get romajiName;
  String get picname;
  String get year;
  int get airDate;
  GGetAnimeShowsData_animes_watchProgress? get watchProgress;
  static Serializer<GGetAnimeShowsData_animes> get serializer =>
      _$gGetAnimeShowsDataAnimesSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GGetAnimeShowsData_animes.serializer, this)
          as Map<String, dynamic>);
  static GGetAnimeShowsData_animes? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GGetAnimeShowsData_animes.serializer, json);
}

abstract class GGetAnimeShowsData_animes_watchProgress
    implements
        Built<GGetAnimeShowsData_animes_watchProgress,
            GGetAnimeShowsData_animes_watchProgressBuilder> {
  GGetAnimeShowsData_animes_watchProgress._();

  factory GGetAnimeShowsData_animes_watchProgress(
      [Function(GGetAnimeShowsData_animes_watchProgressBuilder b)
          updates]) = _$GGetAnimeShowsData_animes_watchProgress;

  static void _initializeBuilder(
          GGetAnimeShowsData_animes_watchProgressBuilder b) =>
      b..G__typename = 'WatchProgressQuery';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double get progress;
  static Serializer<GGetAnimeShowsData_animes_watchProgress> get serializer =>
      _$gGetAnimeShowsDataAnimesWatchProgressSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GGetAnimeShowsData_animes_watchProgress.serializer, this)
      as Map<String, dynamic>);
  static GGetAnimeShowsData_animes_watchProgress? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GGetAnimeShowsData_animes_watchProgress.serializer, json);
}
