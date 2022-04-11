// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_seek.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPlayerSeekData> _$gPlayerSeekDataSerializer =
    new _$GPlayerSeekDataSerializer();
Serializer<GPlayerSeekData_player> _$gPlayerSeekDataPlayerSerializer =
    new _$GPlayerSeekData_playerSerializer();

class _$GPlayerSeekDataSerializer
    implements StructuredSerializer<GPlayerSeekData> {
  @override
  final Iterable<Type> types = const [GPlayerSeekData, _$GPlayerSeekData];
  @override
  final String wireName = 'GPlayerSeekData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPlayerSeekData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'player',
      serializers.serialize(object.player,
          specifiedType: const FullType(GPlayerSeekData_player)),
    ];

    return result;
  }

  @override
  GPlayerSeekData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPlayerSeekDataBuilder();

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
                  specifiedType: const FullType(GPlayerSeekData_player))!
              as GPlayerSeekData_player);
          break;
      }
    }

    return result.build();
  }
}

class _$GPlayerSeekData_playerSerializer
    implements StructuredSerializer<GPlayerSeekData_player> {
  @override
  final Iterable<Type> types = const [
    GPlayerSeekData_player,
    _$GPlayerSeekData_player
  ];
  @override
  final String wireName = 'GPlayerSeekData_player';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPlayerSeekData_player object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.seek;
    if (value != null) {
      result
        ..add('seek')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GPlayerSeekData_player deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPlayerSeekData_playerBuilder();

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
        case 'seek':
          result.seek = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GPlayerSeekData extends GPlayerSeekData {
  @override
  final String G__typename;
  @override
  final GPlayerSeekData_player player;

  factory _$GPlayerSeekData([void Function(GPlayerSeekDataBuilder)? updates]) =>
      (new GPlayerSeekDataBuilder()..update(updates)).build();

  _$GPlayerSeekData._({required this.G__typename, required this.player})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GPlayerSeekData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(player, 'GPlayerSeekData', 'player');
  }

  @override
  GPlayerSeekData rebuild(void Function(GPlayerSeekDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPlayerSeekDataBuilder toBuilder() =>
      new GPlayerSeekDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPlayerSeekData &&
        G__typename == other.G__typename &&
        player == other.player;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), player.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GPlayerSeekData')
          ..add('G__typename', G__typename)
          ..add('player', player))
        .toString();
  }
}

class GPlayerSeekDataBuilder
    implements Builder<GPlayerSeekData, GPlayerSeekDataBuilder> {
  _$GPlayerSeekData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GPlayerSeekData_playerBuilder? _player;
  GPlayerSeekData_playerBuilder get player =>
      _$this._player ??= new GPlayerSeekData_playerBuilder();
  set player(GPlayerSeekData_playerBuilder? player) => _$this._player = player;

  GPlayerSeekDataBuilder() {
    GPlayerSeekData._initializeBuilder(this);
  }

  GPlayerSeekDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _player = $v.player.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPlayerSeekData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPlayerSeekData;
  }

  @override
  void update(void Function(GPlayerSeekDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPlayerSeekData build() {
    _$GPlayerSeekData _$result;
    try {
      _$result = _$v ??
          new _$GPlayerSeekData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GPlayerSeekData', 'G__typename'),
              player: player.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'player';
        player.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GPlayerSeekData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPlayerSeekData_player extends GPlayerSeekData_player {
  @override
  final String G__typename;
  @override
  final double? seek;

  factory _$GPlayerSeekData_player(
          [void Function(GPlayerSeekData_playerBuilder)? updates]) =>
      (new GPlayerSeekData_playerBuilder()..update(updates)).build();

  _$GPlayerSeekData_player._({required this.G__typename, this.seek})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GPlayerSeekData_player', 'G__typename');
  }

  @override
  GPlayerSeekData_player rebuild(
          void Function(GPlayerSeekData_playerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPlayerSeekData_playerBuilder toBuilder() =>
      new GPlayerSeekData_playerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPlayerSeekData_player &&
        G__typename == other.G__typename &&
        seek == other.seek;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), seek.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GPlayerSeekData_player')
          ..add('G__typename', G__typename)
          ..add('seek', seek))
        .toString();
  }
}

class GPlayerSeekData_playerBuilder
    implements Builder<GPlayerSeekData_player, GPlayerSeekData_playerBuilder> {
  _$GPlayerSeekData_player? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  double? _seek;
  double? get seek => _$this._seek;
  set seek(double? seek) => _$this._seek = seek;

  GPlayerSeekData_playerBuilder() {
    GPlayerSeekData_player._initializeBuilder(this);
  }

  GPlayerSeekData_playerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _seek = $v.seek;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPlayerSeekData_player other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPlayerSeekData_player;
  }

  @override
  void update(void Function(GPlayerSeekData_playerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPlayerSeekData_player build() {
    final _$result = _$v ??
        new _$GPlayerSeekData_player._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GPlayerSeekData_player', 'G__typename'),
            seek: seek);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
