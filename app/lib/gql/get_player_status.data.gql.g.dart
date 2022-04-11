// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_player_status.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetPlayerStatusData> _$gGetPlayerStatusDataSerializer =
    new _$GGetPlayerStatusDataSerializer();
Serializer<GGetPlayerStatusData_player> _$gGetPlayerStatusDataPlayerSerializer =
    new _$GGetPlayerStatusData_playerSerializer();

class _$GGetPlayerStatusDataSerializer
    implements StructuredSerializer<GGetPlayerStatusData> {
  @override
  final Iterable<Type> types = const [
    GGetPlayerStatusData,
    _$GGetPlayerStatusData
  ];
  @override
  final String wireName = 'GGetPlayerStatusData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetPlayerStatusData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'player',
      serializers.serialize(object.player,
          specifiedType: const FullType(GGetPlayerStatusData_player)),
    ];

    return result;
  }

  @override
  GGetPlayerStatusData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetPlayerStatusDataBuilder();

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
                  specifiedType: const FullType(GGetPlayerStatusData_player))!
              as GGetPlayerStatusData_player);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetPlayerStatusData_playerSerializer
    implements StructuredSerializer<GGetPlayerStatusData_player> {
  @override
  final Iterable<Type> types = const [
    GGetPlayerStatusData_player,
    _$GGetPlayerStatusData_player
  ];
  @override
  final String wireName = 'GGetPlayerStatusData_player';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetPlayerStatusData_player object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.paused;
    if (value != null) {
      result
        ..add('paused')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.mediaTitle;
    if (value != null) {
      result
        ..add('mediaTitle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.playlistPos;
    if (value != null) {
      result
        ..add('playlistPos')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.playlistCount;
    if (value != null) {
      result
        ..add('playlistCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.chapter;
    if (value != null) {
      result
        ..add('chapter')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.chapters;
    if (value != null) {
      result
        ..add('chapters')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.timePos;
    if (value != null) {
      result
        ..add('timePos')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.timeRemaining;
    if (value != null) {
      result
        ..add('timeRemaining')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.seekable;
    if (value != null) {
      result
        ..add('seekable')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GGetPlayerStatusData_player deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetPlayerStatusData_playerBuilder();

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
        case 'paused':
          result.paused = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'mediaTitle':
          result.mediaTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'playlistPos':
          result.playlistPos = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'playlistCount':
          result.playlistCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'chapter':
          result.chapter = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'chapters':
          result.chapters = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'timePos':
          result.timePos = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'timeRemaining':
          result.timeRemaining = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'seekable':
          result.seekable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetPlayerStatusData extends GGetPlayerStatusData {
  @override
  final String G__typename;
  @override
  final GGetPlayerStatusData_player player;

  factory _$GGetPlayerStatusData(
          [void Function(GGetPlayerStatusDataBuilder)? updates]) =>
      (new GGetPlayerStatusDataBuilder()..update(updates)).build();

  _$GGetPlayerStatusData._({required this.G__typename, required this.player})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GGetPlayerStatusData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        player, 'GGetPlayerStatusData', 'player');
  }

  @override
  GGetPlayerStatusData rebuild(
          void Function(GGetPlayerStatusDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetPlayerStatusDataBuilder toBuilder() =>
      new GGetPlayerStatusDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetPlayerStatusData &&
        G__typename == other.G__typename &&
        player == other.player;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), player.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GGetPlayerStatusData')
          ..add('G__typename', G__typename)
          ..add('player', player))
        .toString();
  }
}

class GGetPlayerStatusDataBuilder
    implements Builder<GGetPlayerStatusData, GGetPlayerStatusDataBuilder> {
  _$GGetPlayerStatusData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetPlayerStatusData_playerBuilder? _player;
  GGetPlayerStatusData_playerBuilder get player =>
      _$this._player ??= new GGetPlayerStatusData_playerBuilder();
  set player(GGetPlayerStatusData_playerBuilder? player) =>
      _$this._player = player;

  GGetPlayerStatusDataBuilder() {
    GGetPlayerStatusData._initializeBuilder(this);
  }

  GGetPlayerStatusDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _player = $v.player.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetPlayerStatusData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetPlayerStatusData;
  }

  @override
  void update(void Function(GGetPlayerStatusDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetPlayerStatusData build() {
    _$GGetPlayerStatusData _$result;
    try {
      _$result = _$v ??
          new _$GGetPlayerStatusData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GGetPlayerStatusData', 'G__typename'),
              player: player.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'player';
        player.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GGetPlayerStatusData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetPlayerStatusData_player extends GGetPlayerStatusData_player {
  @override
  final String G__typename;
  @override
  final bool? paused;
  @override
  final String? mediaTitle;
  @override
  final int? playlistPos;
  @override
  final int? playlistCount;
  @override
  final int? chapter;
  @override
  final int? chapters;
  @override
  final double? timePos;
  @override
  final double? timeRemaining;
  @override
  final bool? seekable;

  factory _$GGetPlayerStatusData_player(
          [void Function(GGetPlayerStatusData_playerBuilder)? updates]) =>
      (new GGetPlayerStatusData_playerBuilder()..update(updates)).build();

  _$GGetPlayerStatusData_player._(
      {required this.G__typename,
      this.paused,
      this.mediaTitle,
      this.playlistPos,
      this.playlistCount,
      this.chapter,
      this.chapters,
      this.timePos,
      this.timeRemaining,
      this.seekable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GGetPlayerStatusData_player', 'G__typename');
  }

  @override
  GGetPlayerStatusData_player rebuild(
          void Function(GGetPlayerStatusData_playerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetPlayerStatusData_playerBuilder toBuilder() =>
      new GGetPlayerStatusData_playerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetPlayerStatusData_player &&
        G__typename == other.G__typename &&
        paused == other.paused &&
        mediaTitle == other.mediaTitle &&
        playlistPos == other.playlistPos &&
        playlistCount == other.playlistCount &&
        chapter == other.chapter &&
        chapters == other.chapters &&
        timePos == other.timePos &&
        timeRemaining == other.timeRemaining &&
        seekable == other.seekable;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, G__typename.hashCode),
                                        paused.hashCode),
                                    mediaTitle.hashCode),
                                playlistPos.hashCode),
                            playlistCount.hashCode),
                        chapter.hashCode),
                    chapters.hashCode),
                timePos.hashCode),
            timeRemaining.hashCode),
        seekable.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GGetPlayerStatusData_player')
          ..add('G__typename', G__typename)
          ..add('paused', paused)
          ..add('mediaTitle', mediaTitle)
          ..add('playlistPos', playlistPos)
          ..add('playlistCount', playlistCount)
          ..add('chapter', chapter)
          ..add('chapters', chapters)
          ..add('timePos', timePos)
          ..add('timeRemaining', timeRemaining)
          ..add('seekable', seekable))
        .toString();
  }
}

class GGetPlayerStatusData_playerBuilder
    implements
        Builder<GGetPlayerStatusData_player,
            GGetPlayerStatusData_playerBuilder> {
  _$GGetPlayerStatusData_player? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _paused;
  bool? get paused => _$this._paused;
  set paused(bool? paused) => _$this._paused = paused;

  String? _mediaTitle;
  String? get mediaTitle => _$this._mediaTitle;
  set mediaTitle(String? mediaTitle) => _$this._mediaTitle = mediaTitle;

  int? _playlistPos;
  int? get playlistPos => _$this._playlistPos;
  set playlistPos(int? playlistPos) => _$this._playlistPos = playlistPos;

  int? _playlistCount;
  int? get playlistCount => _$this._playlistCount;
  set playlistCount(int? playlistCount) =>
      _$this._playlistCount = playlistCount;

  int? _chapter;
  int? get chapter => _$this._chapter;
  set chapter(int? chapter) => _$this._chapter = chapter;

  int? _chapters;
  int? get chapters => _$this._chapters;
  set chapters(int? chapters) => _$this._chapters = chapters;

  double? _timePos;
  double? get timePos => _$this._timePos;
  set timePos(double? timePos) => _$this._timePos = timePos;

  double? _timeRemaining;
  double? get timeRemaining => _$this._timeRemaining;
  set timeRemaining(double? timeRemaining) =>
      _$this._timeRemaining = timeRemaining;

  bool? _seekable;
  bool? get seekable => _$this._seekable;
  set seekable(bool? seekable) => _$this._seekable = seekable;

  GGetPlayerStatusData_playerBuilder() {
    GGetPlayerStatusData_player._initializeBuilder(this);
  }

  GGetPlayerStatusData_playerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _paused = $v.paused;
      _mediaTitle = $v.mediaTitle;
      _playlistPos = $v.playlistPos;
      _playlistCount = $v.playlistCount;
      _chapter = $v.chapter;
      _chapters = $v.chapters;
      _timePos = $v.timePos;
      _timeRemaining = $v.timeRemaining;
      _seekable = $v.seekable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetPlayerStatusData_player other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetPlayerStatusData_player;
  }

  @override
  void update(void Function(GGetPlayerStatusData_playerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetPlayerStatusData_player build() {
    final _$result = _$v ??
        new _$GGetPlayerStatusData_player._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GGetPlayerStatusData_player', 'G__typename'),
            paused: paused,
            mediaTitle: mediaTitle,
            playlistPos: playlistPos,
            playlistCount: playlistCount,
            chapter: chapter,
            chapters: chapters,
            timePos: timePos,
            timeRemaining: timeRemaining,
            seekable: seekable);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
