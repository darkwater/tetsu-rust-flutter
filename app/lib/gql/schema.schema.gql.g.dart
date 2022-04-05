// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.schema.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GRelatedAnimeType _$gRelatedAnimeTypeSEQUEL =
    const GRelatedAnimeType._('SEQUEL');
const GRelatedAnimeType _$gRelatedAnimeTypePREQUEL =
    const GRelatedAnimeType._('PREQUEL');
const GRelatedAnimeType _$gRelatedAnimeTypeSAME_SETTING =
    const GRelatedAnimeType._('SAME_SETTING');
const GRelatedAnimeType _$gRelatedAnimeTypeALTERNATIVE_SETTING =
    const GRelatedAnimeType._('ALTERNATIVE_SETTING');
const GRelatedAnimeType _$gRelatedAnimeTypeALTERNATIVE_VERSION =
    const GRelatedAnimeType._('ALTERNATIVE_VERSION');
const GRelatedAnimeType _$gRelatedAnimeTypeMUSIC_VIDEO =
    const GRelatedAnimeType._('MUSIC_VIDEO');
const GRelatedAnimeType _$gRelatedAnimeTypeCHARACTER =
    const GRelatedAnimeType._('CHARACTER');
const GRelatedAnimeType _$gRelatedAnimeTypeSIDE_STORY =
    const GRelatedAnimeType._('SIDE_STORY');
const GRelatedAnimeType _$gRelatedAnimeTypePARENT_STORY =
    const GRelatedAnimeType._('PARENT_STORY');
const GRelatedAnimeType _$gRelatedAnimeTypeSUMMARY =
    const GRelatedAnimeType._('SUMMARY');
const GRelatedAnimeType _$gRelatedAnimeTypeFULL_STORY =
    const GRelatedAnimeType._('FULL_STORY');
const GRelatedAnimeType _$gRelatedAnimeTypeOTHER =
    const GRelatedAnimeType._('OTHER');
const GRelatedAnimeType _$gRelatedAnimeTypeUNKNOWN =
    const GRelatedAnimeType._('UNKNOWN');

GRelatedAnimeType _$gRelatedAnimeTypeValueOf(String name) {
  switch (name) {
    case 'SEQUEL':
      return _$gRelatedAnimeTypeSEQUEL;
    case 'PREQUEL':
      return _$gRelatedAnimeTypePREQUEL;
    case 'SAME_SETTING':
      return _$gRelatedAnimeTypeSAME_SETTING;
    case 'ALTERNATIVE_SETTING':
      return _$gRelatedAnimeTypeALTERNATIVE_SETTING;
    case 'ALTERNATIVE_VERSION':
      return _$gRelatedAnimeTypeALTERNATIVE_VERSION;
    case 'MUSIC_VIDEO':
      return _$gRelatedAnimeTypeMUSIC_VIDEO;
    case 'CHARACTER':
      return _$gRelatedAnimeTypeCHARACTER;
    case 'SIDE_STORY':
      return _$gRelatedAnimeTypeSIDE_STORY;
    case 'PARENT_STORY':
      return _$gRelatedAnimeTypePARENT_STORY;
    case 'SUMMARY':
      return _$gRelatedAnimeTypeSUMMARY;
    case 'FULL_STORY':
      return _$gRelatedAnimeTypeFULL_STORY;
    case 'OTHER':
      return _$gRelatedAnimeTypeOTHER;
    case 'UNKNOWN':
      return _$gRelatedAnimeTypeUNKNOWN;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GRelatedAnimeType> _$gRelatedAnimeTypeValues =
    new BuiltSet<GRelatedAnimeType>(const <GRelatedAnimeType>[
  _$gRelatedAnimeTypeSEQUEL,
  _$gRelatedAnimeTypePREQUEL,
  _$gRelatedAnimeTypeSAME_SETTING,
  _$gRelatedAnimeTypeALTERNATIVE_SETTING,
  _$gRelatedAnimeTypeALTERNATIVE_VERSION,
  _$gRelatedAnimeTypeMUSIC_VIDEO,
  _$gRelatedAnimeTypeCHARACTER,
  _$gRelatedAnimeTypeSIDE_STORY,
  _$gRelatedAnimeTypePARENT_STORY,
  _$gRelatedAnimeTypeSUMMARY,
  _$gRelatedAnimeTypeFULL_STORY,
  _$gRelatedAnimeTypeOTHER,
  _$gRelatedAnimeTypeUNKNOWN,
]);

Serializer<GRelatedAnimeType> _$gRelatedAnimeTypeSerializer =
    new _$GRelatedAnimeTypeSerializer();

class _$GRelatedAnimeTypeSerializer
    implements PrimitiveSerializer<GRelatedAnimeType> {
  @override
  final Iterable<Type> types = const <Type>[GRelatedAnimeType];
  @override
  final String wireName = 'GRelatedAnimeType';

  @override
  Object serialize(Serializers serializers, GRelatedAnimeType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GRelatedAnimeType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GRelatedAnimeType.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
