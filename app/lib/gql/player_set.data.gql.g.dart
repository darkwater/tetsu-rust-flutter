// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_set.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPlayerSetData> _$gPlayerSetDataSerializer =
    new _$GPlayerSetDataSerializer();
Serializer<GPlayerSetData_player> _$gPlayerSetDataPlayerSerializer =
    new _$GPlayerSetData_playerSerializer();

class _$GPlayerSetDataSerializer
    implements StructuredSerializer<GPlayerSetData> {
  @override
  final Iterable<Type> types = const [GPlayerSetData, _$GPlayerSetData];
  @override
  final String wireName = 'GPlayerSetData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPlayerSetData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'player',
      serializers.serialize(object.player,
          specifiedType: const FullType(GPlayerSetData_player)),
    ];

    return result;
  }

  @override
  GPlayerSetData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPlayerSetDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'player':
          result.player.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GPlayerSetData_player))!
              as GPlayerSetData_player);
          break;
      }
    }

    return result.build();
  }
}

class _$GPlayerSetData_playerSerializer
    implements StructuredSerializer<GPlayerSetData_player> {
  @override
  final Iterable<Type> types = const [
    GPlayerSetData_player,
    _$GPlayerSetData_player
  ];
  @override
  final String wireName = 'GPlayerSetData_player';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPlayerSetData_player object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'set',
      serializers.serialize(object.set, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GPlayerSetData_player deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPlayerSetData_playerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'set':
          result.set = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GPlayerSetData extends GPlayerSetData {
  @override
  final String G__typename;
  @override
  final GPlayerSetData_player player;

  factory _$GPlayerSetData([void Function(GPlayerSetDataBuilder)? updates]) =>
      (new GPlayerSetDataBuilder()..update(updates)).build();

  _$GPlayerSetData._({required this.G__typename, required this.player})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GPlayerSetData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(player, 'GPlayerSetData', 'player');
  }

  @override
  GPlayerSetData rebuild(void Function(GPlayerSetDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPlayerSetDataBuilder toBuilder() =>
      new GPlayerSetDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPlayerSetData &&
        G__typename == other.G__typename &&
        player == other.player;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), player.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GPlayerSetData')
          ..add('G__typename', G__typename)
          ..add('player', player))
        .toString();
  }
}

class GPlayerSetDataBuilder
    implements Builder<GPlayerSetData, GPlayerSetDataBuilder> {
  _$GPlayerSetData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GPlayerSetData_playerBuilder? _player;
  GPlayerSetData_playerBuilder get player =>
      _$this._player ??= new GPlayerSetData_playerBuilder();
  set player(GPlayerSetData_playerBuilder? player) => _$this._player = player;

  GPlayerSetDataBuilder() {
    GPlayerSetData._initializeBuilder(this);
  }

  GPlayerSetDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _player = $v.player.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPlayerSetData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPlayerSetData;
  }

  @override
  void update(void Function(GPlayerSetDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPlayerSetData build() {
    _$GPlayerSetData _$result;
    try {
      _$result = _$v ??
          new _$GPlayerSetData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GPlayerSetData', 'G__typename'),
              player: player.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'player';
        player.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GPlayerSetData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPlayerSetData_player extends GPlayerSetData_player {
  @override
  final String G__typename;
  @override
  final bool set;

  factory _$GPlayerSetData_player(
          [void Function(GPlayerSetData_playerBuilder)? updates]) =>
      (new GPlayerSetData_playerBuilder()..update(updates)).build();

  _$GPlayerSetData_player._({required this.G__typename, required this.set})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GPlayerSetData_player', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(set, 'GPlayerSetData_player', 'set');
  }

  @override
  GPlayerSetData_player rebuild(
          void Function(GPlayerSetData_playerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPlayerSetData_playerBuilder toBuilder() =>
      new GPlayerSetData_playerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPlayerSetData_player &&
        G__typename == other.G__typename &&
        set == other.set;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), set.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GPlayerSetData_player')
          ..add('G__typename', G__typename)
          ..add('set', set))
        .toString();
  }
}

class GPlayerSetData_playerBuilder
    implements Builder<GPlayerSetData_player, GPlayerSetData_playerBuilder> {
  _$GPlayerSetData_player? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _set;
  bool? get set => _$this._set;
  set set(bool? set) => _$this._set = set;

  GPlayerSetData_playerBuilder() {
    GPlayerSetData_player._initializeBuilder(this);
  }

  GPlayerSetData_playerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _set = $v.set;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPlayerSetData_player other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPlayerSetData_player;
  }

  @override
  void update(void Function(GPlayerSetData_playerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPlayerSetData_player build() {
    final _$result = _$v ??
        new _$GPlayerSetData_player._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GPlayerSetData_player', 'G__typename'),
            set: BuiltValueNullFieldError.checkNotNull(
                set, 'GPlayerSetData_player', 'set'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
