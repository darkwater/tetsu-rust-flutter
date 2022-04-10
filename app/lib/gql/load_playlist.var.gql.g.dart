// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_playlist.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GLoadPlaylistVars> _$gLoadPlaylistVarsSerializer =
    new _$GLoadPlaylistVarsSerializer();

class _$GLoadPlaylistVarsSerializer
    implements StructuredSerializer<GLoadPlaylistVars> {
  @override
  final Iterable<Type> types = const [GLoadPlaylistVars, _$GLoadPlaylistVars];
  @override
  final String wireName = 'GLoadPlaylistVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GLoadPlaylistVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'playlist',
      serializers.serialize(object.playlist,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  GLoadPlaylistVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLoadPlaylistVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'playlist':
          result.playlist.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GLoadPlaylistVars extends GLoadPlaylistVars {
  @override
  final BuiltList<String> playlist;

  factory _$GLoadPlaylistVars(
          [void Function(GLoadPlaylistVarsBuilder)? updates]) =>
      (new GLoadPlaylistVarsBuilder()..update(updates)).build();

  _$GLoadPlaylistVars._({required this.playlist}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        playlist, 'GLoadPlaylistVars', 'playlist');
  }

  @override
  GLoadPlaylistVars rebuild(void Function(GLoadPlaylistVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLoadPlaylistVarsBuilder toBuilder() =>
      new GLoadPlaylistVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLoadPlaylistVars && playlist == other.playlist;
  }

  @override
  int get hashCode {
    return $jf($jc(0, playlist.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GLoadPlaylistVars')
          ..add('playlist', playlist))
        .toString();
  }
}

class GLoadPlaylistVarsBuilder
    implements Builder<GLoadPlaylistVars, GLoadPlaylistVarsBuilder> {
  _$GLoadPlaylistVars? _$v;

  ListBuilder<String>? _playlist;
  ListBuilder<String> get playlist =>
      _$this._playlist ??= new ListBuilder<String>();
  set playlist(ListBuilder<String>? playlist) => _$this._playlist = playlist;

  GLoadPlaylistVarsBuilder();

  GLoadPlaylistVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _playlist = $v.playlist.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GLoadPlaylistVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLoadPlaylistVars;
  }

  @override
  void update(void Function(GLoadPlaylistVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GLoadPlaylistVars build() {
    _$GLoadPlaylistVars _$result;
    try {
      _$result = _$v ?? new _$GLoadPlaylistVars._(playlist: playlist.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'playlist';
        playlist.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GLoadPlaylistVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
