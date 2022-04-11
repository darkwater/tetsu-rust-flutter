// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_seek.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPlayerSeekVars> _$gPlayerSeekVarsSerializer =
    new _$GPlayerSeekVarsSerializer();

class _$GPlayerSeekVarsSerializer
    implements StructuredSerializer<GPlayerSeekVars> {
  @override
  final Iterable<Type> types = const [GPlayerSeekVars, _$GPlayerSeekVars];
  @override
  final String wireName = 'GPlayerSeekVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPlayerSeekVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.to;
    if (value != null) {
      result
        ..add('to')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.by;
    if (value != null) {
      result
        ..add('by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GPlayerSeekVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPlayerSeekVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'to':
          result.to = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'by':
          result.by = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GPlayerSeekVars extends GPlayerSeekVars {
  @override
  final double? to;
  @override
  final double? by;

  factory _$GPlayerSeekVars([void Function(GPlayerSeekVarsBuilder)? updates]) =>
      (new GPlayerSeekVarsBuilder()..update(updates)).build();

  _$GPlayerSeekVars._({this.to, this.by}) : super._();

  @override
  GPlayerSeekVars rebuild(void Function(GPlayerSeekVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPlayerSeekVarsBuilder toBuilder() =>
      new GPlayerSeekVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPlayerSeekVars && to == other.to && by == other.by;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, to.hashCode), by.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GPlayerSeekVars')
          ..add('to', to)
          ..add('by', by))
        .toString();
  }
}

class GPlayerSeekVarsBuilder
    implements Builder<GPlayerSeekVars, GPlayerSeekVarsBuilder> {
  _$GPlayerSeekVars? _$v;

  double? _to;
  double? get to => _$this._to;
  set to(double? to) => _$this._to = to;

  double? _by;
  double? get by => _$this._by;
  set by(double? by) => _$this._by = by;

  GPlayerSeekVarsBuilder();

  GPlayerSeekVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _to = $v.to;
      _by = $v.by;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPlayerSeekVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPlayerSeekVars;
  }

  @override
  void update(void Function(GPlayerSeekVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPlayerSeekVars build() {
    final _$result = _$v ?? new _$GPlayerSeekVars._(to: to, by: by);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
