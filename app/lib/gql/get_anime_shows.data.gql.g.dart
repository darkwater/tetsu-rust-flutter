// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_anime_shows.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetAnimeShowsData> _$gGetAnimeShowsDataSerializer =
    new _$GGetAnimeShowsDataSerializer();
Serializer<GGetAnimeShowsData_animes> _$gGetAnimeShowsDataAnimesSerializer =
    new _$GGetAnimeShowsData_animesSerializer();
Serializer<GGetAnimeShowsData_animes_watchProgress>
    _$gGetAnimeShowsDataAnimesWatchProgressSerializer =
    new _$GGetAnimeShowsData_animes_watchProgressSerializer();

class _$GGetAnimeShowsDataSerializer
    implements StructuredSerializer<GGetAnimeShowsData> {
  @override
  final Iterable<Type> types = const [GGetAnimeShowsData, _$GGetAnimeShowsData];
  @override
  final String wireName = 'GGetAnimeShowsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAnimeShowsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'animes',
      serializers.serialize(object.animes,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GGetAnimeShowsData_animes)])),
    ];

    return result;
  }

  @override
  GGetAnimeShowsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAnimeShowsDataBuilder();

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
        case 'animes':
          result.animes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GGetAnimeShowsData_animes)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAnimeShowsData_animesSerializer
    implements StructuredSerializer<GGetAnimeShowsData_animes> {
  @override
  final Iterable<Type> types = const [
    GGetAnimeShowsData_animes,
    _$GGetAnimeShowsData_animes
  ];
  @override
  final String wireName = 'GGetAnimeShowsData_animes';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAnimeShowsData_animes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'aid',
      serializers.serialize(object.aid, specifiedType: const FullType(int)),
      'romajiName',
      serializers.serialize(object.romajiName,
          specifiedType: const FullType(String)),
      'picname',
      serializers.serialize(object.picname,
          specifiedType: const FullType(String)),
      'year',
      serializers.serialize(object.year, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.watchProgress;
    if (value != null) {
      result
        ..add('watchProgress')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GGetAnimeShowsData_animes_watchProgress)));
    }
    return result;
  }

  @override
  GGetAnimeShowsData_animes deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAnimeShowsData_animesBuilder();

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
        case 'aid':
          result.aid = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'romajiName':
          result.romajiName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'picname':
          result.picname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'year':
          result.year = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'watchProgress':
          result.watchProgress.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetAnimeShowsData_animes_watchProgress))!
              as GGetAnimeShowsData_animes_watchProgress);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAnimeShowsData_animes_watchProgressSerializer
    implements StructuredSerializer<GGetAnimeShowsData_animes_watchProgress> {
  @override
  final Iterable<Type> types = const [
    GGetAnimeShowsData_animes_watchProgress,
    _$GGetAnimeShowsData_animes_watchProgress
  ];
  @override
  final String wireName = 'GGetAnimeShowsData_animes_watchProgress';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAnimeShowsData_animes_watchProgress object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'progress',
      serializers.serialize(object.progress,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  GGetAnimeShowsData_animes_watchProgress deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAnimeShowsData_animes_watchProgressBuilder();

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
        case 'progress':
          result.progress = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAnimeShowsData extends GGetAnimeShowsData {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetAnimeShowsData_animes> animes;

  factory _$GGetAnimeShowsData(
          [void Function(GGetAnimeShowsDataBuilder)? updates]) =>
      (new GGetAnimeShowsDataBuilder()..update(updates)).build();

  _$GGetAnimeShowsData._({required this.G__typename, required this.animes})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GGetAnimeShowsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        animes, 'GGetAnimeShowsData', 'animes');
  }

  @override
  GGetAnimeShowsData rebuild(
          void Function(GGetAnimeShowsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAnimeShowsDataBuilder toBuilder() =>
      new GGetAnimeShowsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAnimeShowsData &&
        G__typename == other.G__typename &&
        animes == other.animes;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), animes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GGetAnimeShowsData')
          ..add('G__typename', G__typename)
          ..add('animes', animes))
        .toString();
  }
}

class GGetAnimeShowsDataBuilder
    implements Builder<GGetAnimeShowsData, GGetAnimeShowsDataBuilder> {
  _$GGetAnimeShowsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetAnimeShowsData_animes>? _animes;
  ListBuilder<GGetAnimeShowsData_animes> get animes =>
      _$this._animes ??= new ListBuilder<GGetAnimeShowsData_animes>();
  set animes(ListBuilder<GGetAnimeShowsData_animes>? animes) =>
      _$this._animes = animes;

  GGetAnimeShowsDataBuilder() {
    GGetAnimeShowsData._initializeBuilder(this);
  }

  GGetAnimeShowsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _animes = $v.animes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAnimeShowsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAnimeShowsData;
  }

  @override
  void update(void Function(GGetAnimeShowsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetAnimeShowsData build() {
    _$GGetAnimeShowsData _$result;
    try {
      _$result = _$v ??
          new _$GGetAnimeShowsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GGetAnimeShowsData', 'G__typename'),
              animes: animes.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'animes';
        animes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GGetAnimeShowsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetAnimeShowsData_animes extends GGetAnimeShowsData_animes {
  @override
  final String G__typename;
  @override
  final int aid;
  @override
  final String romajiName;
  @override
  final String picname;
  @override
  final String year;
  @override
  final GGetAnimeShowsData_animes_watchProgress? watchProgress;

  factory _$GGetAnimeShowsData_animes(
          [void Function(GGetAnimeShowsData_animesBuilder)? updates]) =>
      (new GGetAnimeShowsData_animesBuilder()..update(updates)).build();

  _$GGetAnimeShowsData_animes._(
      {required this.G__typename,
      required this.aid,
      required this.romajiName,
      required this.picname,
      required this.year,
      this.watchProgress})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GGetAnimeShowsData_animes', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        aid, 'GGetAnimeShowsData_animes', 'aid');
    BuiltValueNullFieldError.checkNotNull(
        romajiName, 'GGetAnimeShowsData_animes', 'romajiName');
    BuiltValueNullFieldError.checkNotNull(
        picname, 'GGetAnimeShowsData_animes', 'picname');
    BuiltValueNullFieldError.checkNotNull(
        year, 'GGetAnimeShowsData_animes', 'year');
  }

  @override
  GGetAnimeShowsData_animes rebuild(
          void Function(GGetAnimeShowsData_animesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAnimeShowsData_animesBuilder toBuilder() =>
      new GGetAnimeShowsData_animesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAnimeShowsData_animes &&
        G__typename == other.G__typename &&
        aid == other.aid &&
        romajiName == other.romajiName &&
        picname == other.picname &&
        year == other.year &&
        watchProgress == other.watchProgress;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, G__typename.hashCode), aid.hashCode),
                    romajiName.hashCode),
                picname.hashCode),
            year.hashCode),
        watchProgress.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GGetAnimeShowsData_animes')
          ..add('G__typename', G__typename)
          ..add('aid', aid)
          ..add('romajiName', romajiName)
          ..add('picname', picname)
          ..add('year', year)
          ..add('watchProgress', watchProgress))
        .toString();
  }
}

class GGetAnimeShowsData_animesBuilder
    implements
        Builder<GGetAnimeShowsData_animes, GGetAnimeShowsData_animesBuilder> {
  _$GGetAnimeShowsData_animes? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _aid;
  int? get aid => _$this._aid;
  set aid(int? aid) => _$this._aid = aid;

  String? _romajiName;
  String? get romajiName => _$this._romajiName;
  set romajiName(String? romajiName) => _$this._romajiName = romajiName;

  String? _picname;
  String? get picname => _$this._picname;
  set picname(String? picname) => _$this._picname = picname;

  String? _year;
  String? get year => _$this._year;
  set year(String? year) => _$this._year = year;

  GGetAnimeShowsData_animes_watchProgressBuilder? _watchProgress;
  GGetAnimeShowsData_animes_watchProgressBuilder get watchProgress =>
      _$this._watchProgress ??=
          new GGetAnimeShowsData_animes_watchProgressBuilder();
  set watchProgress(
          GGetAnimeShowsData_animes_watchProgressBuilder? watchProgress) =>
      _$this._watchProgress = watchProgress;

  GGetAnimeShowsData_animesBuilder() {
    GGetAnimeShowsData_animes._initializeBuilder(this);
  }

  GGetAnimeShowsData_animesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _aid = $v.aid;
      _romajiName = $v.romajiName;
      _picname = $v.picname;
      _year = $v.year;
      _watchProgress = $v.watchProgress?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAnimeShowsData_animes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAnimeShowsData_animes;
  }

  @override
  void update(void Function(GGetAnimeShowsData_animesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetAnimeShowsData_animes build() {
    _$GGetAnimeShowsData_animes _$result;
    try {
      _$result = _$v ??
          new _$GGetAnimeShowsData_animes._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GGetAnimeShowsData_animes', 'G__typename'),
              aid: BuiltValueNullFieldError.checkNotNull(
                  aid, 'GGetAnimeShowsData_animes', 'aid'),
              romajiName: BuiltValueNullFieldError.checkNotNull(
                  romajiName, 'GGetAnimeShowsData_animes', 'romajiName'),
              picname: BuiltValueNullFieldError.checkNotNull(
                  picname, 'GGetAnimeShowsData_animes', 'picname'),
              year: BuiltValueNullFieldError.checkNotNull(
                  year, 'GGetAnimeShowsData_animes', 'year'),
              watchProgress: _watchProgress?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'watchProgress';
        _watchProgress?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GGetAnimeShowsData_animes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetAnimeShowsData_animes_watchProgress
    extends GGetAnimeShowsData_animes_watchProgress {
  @override
  final String G__typename;
  @override
  final double progress;

  factory _$GGetAnimeShowsData_animes_watchProgress(
          [void Function(GGetAnimeShowsData_animes_watchProgressBuilder)?
              updates]) =>
      (new GGetAnimeShowsData_animes_watchProgressBuilder()..update(updates))
          .build();

  _$GGetAnimeShowsData_animes_watchProgress._(
      {required this.G__typename, required this.progress})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GGetAnimeShowsData_animes_watchProgress', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        progress, 'GGetAnimeShowsData_animes_watchProgress', 'progress');
  }

  @override
  GGetAnimeShowsData_animes_watchProgress rebuild(
          void Function(GGetAnimeShowsData_animes_watchProgressBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAnimeShowsData_animes_watchProgressBuilder toBuilder() =>
      new GGetAnimeShowsData_animes_watchProgressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAnimeShowsData_animes_watchProgress &&
        G__typename == other.G__typename &&
        progress == other.progress;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), progress.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GGetAnimeShowsData_animes_watchProgress')
          ..add('G__typename', G__typename)
          ..add('progress', progress))
        .toString();
  }
}

class GGetAnimeShowsData_animes_watchProgressBuilder
    implements
        Builder<GGetAnimeShowsData_animes_watchProgress,
            GGetAnimeShowsData_animes_watchProgressBuilder> {
  _$GGetAnimeShowsData_animes_watchProgress? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  double? _progress;
  double? get progress => _$this._progress;
  set progress(double? progress) => _$this._progress = progress;

  GGetAnimeShowsData_animes_watchProgressBuilder() {
    GGetAnimeShowsData_animes_watchProgress._initializeBuilder(this);
  }

  GGetAnimeShowsData_animes_watchProgressBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _progress = $v.progress;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAnimeShowsData_animes_watchProgress other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAnimeShowsData_animes_watchProgress;
  }

  @override
  void update(
      void Function(GGetAnimeShowsData_animes_watchProgressBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetAnimeShowsData_animes_watchProgress build() {
    final _$result = _$v ??
        new _$GGetAnimeShowsData_animes_watchProgress._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                'GGetAnimeShowsData_animes_watchProgress', 'G__typename'),
            progress: BuiltValueNullFieldError.checkNotNull(progress,
                'GGetAnimeShowsData_animes_watchProgress', 'progress'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
