// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'schema.schema.gql.g.dart';

class GEpisodeType extends EnumClass {
  const GEpisodeType._(String name) : super(name);

  static const GEpisodeType REGULAR = _$gEpisodeTypeREGULAR;

  static const GEpisodeType SPECIAL = _$gEpisodeTypeSPECIAL;

  static const GEpisodeType CREDIT = _$gEpisodeTypeCREDIT;

  static const GEpisodeType TRAILER = _$gEpisodeTypeTRAILER;

  static const GEpisodeType PARODY = _$gEpisodeTypePARODY;

  static const GEpisodeType OTHER = _$gEpisodeTypeOTHER;

  static const GEpisodeType UNKNOWN = _$gEpisodeTypeUNKNOWN;

  static Serializer<GEpisodeType> get serializer => _$gEpisodeTypeSerializer;
  static BuiltSet<GEpisodeType> get values => _$gEpisodeTypeValues;
  static GEpisodeType valueOf(String name) => _$gEpisodeTypeValueOf(name);
}

class GRelatedAnimeType extends EnumClass {
  const GRelatedAnimeType._(String name) : super(name);

  static const GRelatedAnimeType SEQUEL = _$gRelatedAnimeTypeSEQUEL;

  static const GRelatedAnimeType PREQUEL = _$gRelatedAnimeTypePREQUEL;

  static const GRelatedAnimeType SAME_SETTING = _$gRelatedAnimeTypeSAME_SETTING;

  static const GRelatedAnimeType ALTERNATIVE_SETTING =
      _$gRelatedAnimeTypeALTERNATIVE_SETTING;

  static const GRelatedAnimeType ALTERNATIVE_VERSION =
      _$gRelatedAnimeTypeALTERNATIVE_VERSION;

  static const GRelatedAnimeType MUSIC_VIDEO = _$gRelatedAnimeTypeMUSIC_VIDEO;

  static const GRelatedAnimeType CHARACTER = _$gRelatedAnimeTypeCHARACTER;

  static const GRelatedAnimeType SIDE_STORY = _$gRelatedAnimeTypeSIDE_STORY;

  static const GRelatedAnimeType PARENT_STORY = _$gRelatedAnimeTypePARENT_STORY;

  static const GRelatedAnimeType SUMMARY = _$gRelatedAnimeTypeSUMMARY;

  static const GRelatedAnimeType FULL_STORY = _$gRelatedAnimeTypeFULL_STORY;

  static const GRelatedAnimeType OTHER = _$gRelatedAnimeTypeOTHER;

  static const GRelatedAnimeType UNKNOWN = _$gRelatedAnimeTypeUNKNOWN;

  static Serializer<GRelatedAnimeType> get serializer =>
      _$gRelatedAnimeTypeSerializer;
  static BuiltSet<GRelatedAnimeType> get values => _$gRelatedAnimeTypeValues;
  static GRelatedAnimeType valueOf(String name) =>
      _$gRelatedAnimeTypeValueOf(name);
}
