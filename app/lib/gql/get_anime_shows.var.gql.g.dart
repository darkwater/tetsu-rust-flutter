// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_anime_shows.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetAnimeShowsVars> _$gGetAnimeShowsVarsSerializer =
    new _$GGetAnimeShowsVarsSerializer();

class _$GGetAnimeShowsVarsSerializer
    implements StructuredSerializer<GGetAnimeShowsVars> {
  @override
  final Iterable<Type> types = const [GGetAnimeShowsVars, _$GGetAnimeShowsVars];
  @override
  final String wireName = 'GGetAnimeShowsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAnimeShowsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'limit',
      serializers.serialize(object.limit, specifiedType: const FullType(int)),
      'offset',
      serializers.serialize(object.offset, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GGetAnimeShowsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAnimeShowsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'limit':
          result.limit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'offset':
          result.offset = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAnimeShowsVars extends GGetAnimeShowsVars {
  @override
  final int limit;
  @override
  final int offset;

  factory _$GGetAnimeShowsVars(
          [void Function(GGetAnimeShowsVarsBuilder)? updates]) =>
      (new GGetAnimeShowsVarsBuilder()..update(updates)).build();

  _$GGetAnimeShowsVars._({required this.limit, required this.offset})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(limit, 'GGetAnimeShowsVars', 'limit');
    BuiltValueNullFieldError.checkNotNull(
        offset, 'GGetAnimeShowsVars', 'offset');
  }

  @override
  GGetAnimeShowsVars rebuild(
          void Function(GGetAnimeShowsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAnimeShowsVarsBuilder toBuilder() =>
      new GGetAnimeShowsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAnimeShowsVars &&
        limit == other.limit &&
        offset == other.offset;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, limit.hashCode), offset.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GGetAnimeShowsVars')
          ..add('limit', limit)
          ..add('offset', offset))
        .toString();
  }
}

class GGetAnimeShowsVarsBuilder
    implements Builder<GGetAnimeShowsVars, GGetAnimeShowsVarsBuilder> {
  _$GGetAnimeShowsVars? _$v;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  GGetAnimeShowsVarsBuilder();

  GGetAnimeShowsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _limit = $v.limit;
      _offset = $v.offset;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAnimeShowsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAnimeShowsVars;
  }

  @override
  void update(void Function(GGetAnimeShowsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetAnimeShowsVars build() {
    final _$result = _$v ??
        new _$GGetAnimeShowsVars._(
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, 'GGetAnimeShowsVars', 'limit'),
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, 'GGetAnimeShowsVars', 'offset'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
