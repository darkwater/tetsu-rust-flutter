// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_anime_details.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetAnimeDetailsVars> _$gGetAnimeDetailsVarsSerializer =
    new _$GGetAnimeDetailsVarsSerializer();

class _$GGetAnimeDetailsVarsSerializer
    implements StructuredSerializer<GGetAnimeDetailsVars> {
  @override
  final Iterable<Type> types = const [
    GGetAnimeDetailsVars,
    _$GGetAnimeDetailsVars
  ];
  @override
  final String wireName = 'GGetAnimeDetailsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAnimeDetailsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'aid',
      serializers.serialize(object.aid, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GGetAnimeDetailsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAnimeDetailsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'aid':
          result.aid = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAnimeDetailsVars extends GGetAnimeDetailsVars {
  @override
  final int aid;

  factory _$GGetAnimeDetailsVars(
          [void Function(GGetAnimeDetailsVarsBuilder)? updates]) =>
      (new GGetAnimeDetailsVarsBuilder()..update(updates)).build();

  _$GGetAnimeDetailsVars._({required this.aid}) : super._() {
    BuiltValueNullFieldError.checkNotNull(aid, 'GGetAnimeDetailsVars', 'aid');
  }

  @override
  GGetAnimeDetailsVars rebuild(
          void Function(GGetAnimeDetailsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAnimeDetailsVarsBuilder toBuilder() =>
      new GGetAnimeDetailsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAnimeDetailsVars && aid == other.aid;
  }

  @override
  int get hashCode {
    return $jf($jc(0, aid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GGetAnimeDetailsVars')
          ..add('aid', aid))
        .toString();
  }
}

class GGetAnimeDetailsVarsBuilder
    implements Builder<GGetAnimeDetailsVars, GGetAnimeDetailsVarsBuilder> {
  _$GGetAnimeDetailsVars? _$v;

  int? _aid;
  int? get aid => _$this._aid;
  set aid(int? aid) => _$this._aid = aid;

  GGetAnimeDetailsVarsBuilder();

  GGetAnimeDetailsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _aid = $v.aid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAnimeDetailsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAnimeDetailsVars;
  }

  @override
  void update(void Function(GGetAnimeDetailsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetAnimeDetailsVars build() {
    final _$result = _$v ??
        new _$GGetAnimeDetailsVars._(
            aid: BuiltValueNullFieldError.checkNotNull(
                aid, 'GGetAnimeDetailsVars', 'aid'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
