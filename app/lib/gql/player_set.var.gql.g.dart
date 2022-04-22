// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_set.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPlayerSetVars> _$gPlayerSetVarsSerializer =
    new _$GPlayerSetVarsSerializer();

class _$GPlayerSetVarsSerializer
    implements StructuredSerializer<GPlayerSetVars> {
  @override
  final Iterable<Type> types = const [GPlayerSetVars, _$GPlayerSetVars];
  @override
  final String wireName = 'GPlayerSetVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPlayerSetVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.chapter;
    if (value != null) {
      result
        ..add('chapter')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.paused;
    if (value != null) {
      result
        ..add('paused')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.playlistPlayIndex;
    if (value != null) {
      result
        ..add('playlistPlayIndex')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GPlayerSetVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPlayerSetVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'chapter':
          result.chapter = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'paused':
          result.paused = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'playlistPlayIndex':
          result.playlistPlayIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GPlayerSetVars extends GPlayerSetVars {
  @override
  final int? chapter;
  @override
  final bool? paused;
  @override
  final int? playlistPlayIndex;

  factory _$GPlayerSetVars([void Function(GPlayerSetVarsBuilder)? updates]) =>
      (new GPlayerSetVarsBuilder()..update(updates)).build();

  _$GPlayerSetVars._({this.chapter, this.paused, this.playlistPlayIndex})
      : super._();

  @override
  GPlayerSetVars rebuild(void Function(GPlayerSetVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPlayerSetVarsBuilder toBuilder() =>
      new GPlayerSetVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPlayerSetVars &&
        chapter == other.chapter &&
        paused == other.paused &&
        playlistPlayIndex == other.playlistPlayIndex;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, chapter.hashCode), paused.hashCode),
        playlistPlayIndex.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GPlayerSetVars')
          ..add('chapter', chapter)
          ..add('paused', paused)
          ..add('playlistPlayIndex', playlistPlayIndex))
        .toString();
  }
}

class GPlayerSetVarsBuilder
    implements Builder<GPlayerSetVars, GPlayerSetVarsBuilder> {
  _$GPlayerSetVars? _$v;

  int? _chapter;
  int? get chapter => _$this._chapter;
  set chapter(int? chapter) => _$this._chapter = chapter;

  bool? _paused;
  bool? get paused => _$this._paused;
  set paused(bool? paused) => _$this._paused = paused;

  int? _playlistPlayIndex;
  int? get playlistPlayIndex => _$this._playlistPlayIndex;
  set playlistPlayIndex(int? playlistPlayIndex) =>
      _$this._playlistPlayIndex = playlistPlayIndex;

  GPlayerSetVarsBuilder();

  GPlayerSetVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _chapter = $v.chapter;
      _paused = $v.paused;
      _playlistPlayIndex = $v.playlistPlayIndex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPlayerSetVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPlayerSetVars;
  }

  @override
  void update(void Function(GPlayerSetVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPlayerSetVars build() {
    final _$result = _$v ??
        new _$GPlayerSetVars._(
            chapter: chapter,
            paused: paused,
            playlistPlayIndex: playlistPlayIndex);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
