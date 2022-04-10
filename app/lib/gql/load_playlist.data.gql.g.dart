// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_playlist.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GLoadPlaylistData> _$gLoadPlaylistDataSerializer =
    new _$GLoadPlaylistDataSerializer();
Serializer<GLoadPlaylistData_player> _$gLoadPlaylistDataPlayerSerializer =
    new _$GLoadPlaylistData_playerSerializer();

class _$GLoadPlaylistDataSerializer
    implements StructuredSerializer<GLoadPlaylistData> {
  @override
  final Iterable<Type> types = const [GLoadPlaylistData, _$GLoadPlaylistData];
  @override
  final String wireName = 'GLoadPlaylistData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GLoadPlaylistData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'player',
      serializers.serialize(object.player,
          specifiedType: const FullType(GLoadPlaylistData_player)),
    ];

    return result;
  }

  @override
  GLoadPlaylistData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLoadPlaylistDataBuilder();

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
                  specifiedType: const FullType(GLoadPlaylistData_player))!
              as GLoadPlaylistData_player);
          break;
      }
    }

    return result.build();
  }
}

class _$GLoadPlaylistData_playerSerializer
    implements StructuredSerializer<GLoadPlaylistData_player> {
  @override
  final Iterable<Type> types = const [
    GLoadPlaylistData_player,
    _$GLoadPlaylistData_player
  ];
  @override
  final String wireName = 'GLoadPlaylistData_player';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GLoadPlaylistData_player object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'loadPlaylist',
      serializers.serialize(object.loadPlaylist,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GLoadPlaylistData_player deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLoadPlaylistData_playerBuilder();

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
        case 'loadPlaylist':
          result.loadPlaylist = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GLoadPlaylistData extends GLoadPlaylistData {
  @override
  final String G__typename;
  @override
  final GLoadPlaylistData_player player;

  factory _$GLoadPlaylistData(
          [void Function(GLoadPlaylistDataBuilder)? updates]) =>
      (new GLoadPlaylistDataBuilder()..update(updates)).build();

  _$GLoadPlaylistData._({required this.G__typename, required this.player})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GLoadPlaylistData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        player, 'GLoadPlaylistData', 'player');
  }

  @override
  GLoadPlaylistData rebuild(void Function(GLoadPlaylistDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLoadPlaylistDataBuilder toBuilder() =>
      new GLoadPlaylistDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLoadPlaylistData &&
        G__typename == other.G__typename &&
        player == other.player;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), player.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GLoadPlaylistData')
          ..add('G__typename', G__typename)
          ..add('player', player))
        .toString();
  }
}

class GLoadPlaylistDataBuilder
    implements Builder<GLoadPlaylistData, GLoadPlaylistDataBuilder> {
  _$GLoadPlaylistData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GLoadPlaylistData_playerBuilder? _player;
  GLoadPlaylistData_playerBuilder get player =>
      _$this._player ??= new GLoadPlaylistData_playerBuilder();
  set player(GLoadPlaylistData_playerBuilder? player) =>
      _$this._player = player;

  GLoadPlaylistDataBuilder() {
    GLoadPlaylistData._initializeBuilder(this);
  }

  GLoadPlaylistDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _player = $v.player.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GLoadPlaylistData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLoadPlaylistData;
  }

  @override
  void update(void Function(GLoadPlaylistDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GLoadPlaylistData build() {
    _$GLoadPlaylistData _$result;
    try {
      _$result = _$v ??
          new _$GLoadPlaylistData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GLoadPlaylistData', 'G__typename'),
              player: player.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'player';
        player.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GLoadPlaylistData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GLoadPlaylistData_player extends GLoadPlaylistData_player {
  @override
  final String G__typename;
  @override
  final String loadPlaylist;

  factory _$GLoadPlaylistData_player(
          [void Function(GLoadPlaylistData_playerBuilder)? updates]) =>
      (new GLoadPlaylistData_playerBuilder()..update(updates)).build();

  _$GLoadPlaylistData_player._(
      {required this.G__typename, required this.loadPlaylist})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GLoadPlaylistData_player', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        loadPlaylist, 'GLoadPlaylistData_player', 'loadPlaylist');
  }

  @override
  GLoadPlaylistData_player rebuild(
          void Function(GLoadPlaylistData_playerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLoadPlaylistData_playerBuilder toBuilder() =>
      new GLoadPlaylistData_playerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLoadPlaylistData_player &&
        G__typename == other.G__typename &&
        loadPlaylist == other.loadPlaylist;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), loadPlaylist.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GLoadPlaylistData_player')
          ..add('G__typename', G__typename)
          ..add('loadPlaylist', loadPlaylist))
        .toString();
  }
}

class GLoadPlaylistData_playerBuilder
    implements
        Builder<GLoadPlaylistData_player, GLoadPlaylistData_playerBuilder> {
  _$GLoadPlaylistData_player? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _loadPlaylist;
  String? get loadPlaylist => _$this._loadPlaylist;
  set loadPlaylist(String? loadPlaylist) => _$this._loadPlaylist = loadPlaylist;

  GLoadPlaylistData_playerBuilder() {
    GLoadPlaylistData_player._initializeBuilder(this);
  }

  GLoadPlaylistData_playerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _loadPlaylist = $v.loadPlaylist;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GLoadPlaylistData_player other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLoadPlaylistData_player;
  }

  @override
  void update(void Function(GLoadPlaylistData_playerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GLoadPlaylistData_player build() {
    final _$result = _$v ??
        new _$GLoadPlaylistData_player._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GLoadPlaylistData_player', 'G__typename'),
            loadPlaylist: BuiltValueNullFieldError.checkNotNull(
                loadPlaylist, 'GLoadPlaylistData_player', 'loadPlaylist'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
