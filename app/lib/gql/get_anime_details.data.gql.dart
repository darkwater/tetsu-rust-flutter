// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tetsu/gql/serializers.gql.dart' as _i1;

part 'get_anime_details.data.gql.g.dart';

abstract class GGetAnimeDetailsData
    implements Built<GGetAnimeDetailsData, GGetAnimeDetailsDataBuilder> {
  GGetAnimeDetailsData._();

  factory GGetAnimeDetailsData(
          [Function(GGetAnimeDetailsDataBuilder b) updates]) =
      _$GGetAnimeDetailsData;

  static void _initializeBuilder(GGetAnimeDetailsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetAnimeDetailsData_anime? get anime;
  static Serializer<GGetAnimeDetailsData> get serializer =>
      _$gGetAnimeDetailsDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GGetAnimeDetailsData.serializer, this)
          as Map<String, dynamic>);
  static GGetAnimeDetailsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GGetAnimeDetailsData.serializer, json);
}

abstract class GGetAnimeDetailsData_anime
    implements
        Built<GGetAnimeDetailsData_anime, GGetAnimeDetailsData_animeBuilder> {
  GGetAnimeDetailsData_anime._();

  factory GGetAnimeDetailsData_anime(
          [Function(GGetAnimeDetailsData_animeBuilder b) updates]) =
      _$GGetAnimeDetailsData_anime;

  static void _initializeBuilder(GGetAnimeDetailsData_animeBuilder b) =>
      b..G__typename = 'AnimeQuery';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get aid;
  String get year;
  String get atype;
  String get romajiName;
  String get kanjiName;
  String get englishName;
  BuiltList<String> get shortNameList;
  int get episodeCount;
  int get specialEpCount;
  int get airDate;
  int get endDate;
  String get picname;
  bool get nsfw;
  BuiltList<int> get characteridList;
  int get specialsCount;
  int get creditsCount;
  int get otherCount;
  int get trailerCount;
  int get parodyCount;
  BuiltList<GGetAnimeDetailsData_anime_episodes> get episodes;
  static Serializer<GGetAnimeDetailsData_anime> get serializer =>
      _$gGetAnimeDetailsDataAnimeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GGetAnimeDetailsData_anime.serializer, this) as Map<String, dynamic>);
  static GGetAnimeDetailsData_anime? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GGetAnimeDetailsData_anime.serializer, json);
}

abstract class GGetAnimeDetailsData_anime_episodes
    implements
        Built<GGetAnimeDetailsData_anime_episodes,
            GGetAnimeDetailsData_anime_episodesBuilder> {
  GGetAnimeDetailsData_anime_episodes._();

  factory GGetAnimeDetailsData_anime_episodes(
          [Function(GGetAnimeDetailsData_anime_episodesBuilder b) updates]) =
      _$GGetAnimeDetailsData_anime_episodes;

  static void _initializeBuilder(
          GGetAnimeDetailsData_anime_episodesBuilder b) =>
      b..G__typename = 'EpisodeQuery';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get eid;
  int get length;
  int get rating;
  int get votes;
  String get epno;
  String get eng;
  String get romaji;
  String get kanji;
  int get aired;
  int get etype;
  BuiltList<GGetAnimeDetailsData_anime_episodes_files> get files;
  static Serializer<GGetAnimeDetailsData_anime_episodes> get serializer =>
      _$gGetAnimeDetailsDataAnimeEpisodesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GGetAnimeDetailsData_anime_episodes.serializer, this)
      as Map<String, dynamic>);
  static GGetAnimeDetailsData_anime_episodes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GGetAnimeDetailsData_anime_episodes.serializer, json);
}

abstract class GGetAnimeDetailsData_anime_episodes_files
    implements
        Built<GGetAnimeDetailsData_anime_episodes_files,
            GGetAnimeDetailsData_anime_episodes_filesBuilder> {
  GGetAnimeDetailsData_anime_episodes_files._();

  factory GGetAnimeDetailsData_anime_episodes_files(
      [Function(GGetAnimeDetailsData_anime_episodes_filesBuilder b)
          updates]) = _$GGetAnimeDetailsData_anime_episodes_files;

  static void _initializeBuilder(
          GGetAnimeDetailsData_anime_episodes_filesBuilder b) =>
      b..G__typename = 'FileQuery';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get fid;
  int get state;
  int get size;
  String get quality;
  String get source;
  BuiltList<String> get subLanguages;
  BuiltList<GGetAnimeDetailsData_anime_episodes_files_videoTracks>
      get videoTracks;
  BuiltList<GGetAnimeDetailsData_anime_episodes_files_audioTracks>
      get audioTracks;
  int get lengthInSeconds;
  String get description;
  int get airedDate;
  BuiltList<String> get onDisk;
  GGetAnimeDetailsData_anime_episodes_files_group? get group;
  static Serializer<GGetAnimeDetailsData_anime_episodes_files> get serializer =>
      _$gGetAnimeDetailsDataAnimeEpisodesFilesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GGetAnimeDetailsData_anime_episodes_files.serializer, this)
      as Map<String, dynamic>);
  static GGetAnimeDetailsData_anime_episodes_files? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GGetAnimeDetailsData_anime_episodes_files.serializer, json);
}

abstract class GGetAnimeDetailsData_anime_episodes_files_videoTracks
    implements
        Built<GGetAnimeDetailsData_anime_episodes_files_videoTracks,
            GGetAnimeDetailsData_anime_episodes_files_videoTracksBuilder> {
  GGetAnimeDetailsData_anime_episodes_files_videoTracks._();

  factory GGetAnimeDetailsData_anime_episodes_files_videoTracks(
      [Function(GGetAnimeDetailsData_anime_episodes_files_videoTracksBuilder b)
          updates]) = _$GGetAnimeDetailsData_anime_episodes_files_videoTracks;

  static void _initializeBuilder(
          GGetAnimeDetailsData_anime_episodes_files_videoTracksBuilder b) =>
      b..G__typename = 'VideoTrack';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get colourDepth;
  String get codec;
  String get bitrate;
  static Serializer<GGetAnimeDetailsData_anime_episodes_files_videoTracks>
      get serializer =>
          _$gGetAnimeDetailsDataAnimeEpisodesFilesVideoTracksSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GGetAnimeDetailsData_anime_episodes_files_videoTracks.serializer,
      this) as Map<String, dynamic>);
  static GGetAnimeDetailsData_anime_episodes_files_videoTracks? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GGetAnimeDetailsData_anime_episodes_files_videoTracks.serializer,
          json);
}

abstract class GGetAnimeDetailsData_anime_episodes_files_audioTracks
    implements
        Built<GGetAnimeDetailsData_anime_episodes_files_audioTracks,
            GGetAnimeDetailsData_anime_episodes_files_audioTracksBuilder> {
  GGetAnimeDetailsData_anime_episodes_files_audioTracks._();

  factory GGetAnimeDetailsData_anime_episodes_files_audioTracks(
      [Function(GGetAnimeDetailsData_anime_episodes_files_audioTracksBuilder b)
          updates]) = _$GGetAnimeDetailsData_anime_episodes_files_audioTracks;

  static void _initializeBuilder(
          GGetAnimeDetailsData_anime_episodes_files_audioTracksBuilder b) =>
      b..G__typename = 'AudioTrack';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get codec;
  String get bitrate;
  String get language;
  static Serializer<GGetAnimeDetailsData_anime_episodes_files_audioTracks>
      get serializer =>
          _$gGetAnimeDetailsDataAnimeEpisodesFilesAudioTracksSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GGetAnimeDetailsData_anime_episodes_files_audioTracks.serializer,
      this) as Map<String, dynamic>);
  static GGetAnimeDetailsData_anime_episodes_files_audioTracks? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GGetAnimeDetailsData_anime_episodes_files_audioTracks.serializer,
          json);
}

abstract class GGetAnimeDetailsData_anime_episodes_files_group
    implements
        Built<GGetAnimeDetailsData_anime_episodes_files_group,
            GGetAnimeDetailsData_anime_episodes_files_groupBuilder> {
  GGetAnimeDetailsData_anime_episodes_files_group._();

  factory GGetAnimeDetailsData_anime_episodes_files_group(
      [Function(GGetAnimeDetailsData_anime_episodes_files_groupBuilder b)
          updates]) = _$GGetAnimeDetailsData_anime_episodes_files_group;

  static void _initializeBuilder(
          GGetAnimeDetailsData_anime_episodes_files_groupBuilder b) =>
      b..G__typename = 'GroupQuery';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get gid;
  int get rating;
  int get votes;
  int get acount;
  int get fcount;
  String get name;
  String get short;
  String get ircChannel;
  String get ircServer;
  String get url;
  String get picname;
  int get foundeddate;
  int get disbandeddate;
  int get dateflags;
  int get lastreleasedate;
  int get lastactivitydate;
  String get grouprelations;
  static Serializer<GGetAnimeDetailsData_anime_episodes_files_group>
      get serializer => _$gGetAnimeDetailsDataAnimeEpisodesFilesGroupSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GGetAnimeDetailsData_anime_episodes_files_group.serializer, this)
      as Map<String, dynamic>);
  static GGetAnimeDetailsData_anime_episodes_files_group? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GGetAnimeDetailsData_anime_episodes_files_group.serializer, json);
}
