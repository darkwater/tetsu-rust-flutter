// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_player_status.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetPlayerStatusVars> _$gGetPlayerStatusVarsSerializer =
    new _$GGetPlayerStatusVarsSerializer();

class _$GGetPlayerStatusVarsSerializer
    implements StructuredSerializer<GGetPlayerStatusVars> {
  @override
  final Iterable<Type> types = const [
    GGetPlayerStatusVars,
    _$GGetPlayerStatusVars
  ];
  @override
  final String wireName = 'GGetPlayerStatusVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetPlayerStatusVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GGetPlayerStatusVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GGetPlayerStatusVarsBuilder().build();
  }
}

class _$GGetPlayerStatusVars extends GGetPlayerStatusVars {
  factory _$GGetPlayerStatusVars(
          [void Function(GGetPlayerStatusVarsBuilder)? updates]) =>
      (new GGetPlayerStatusVarsBuilder()..update(updates)).build();

  _$GGetPlayerStatusVars._() : super._();

  @override
  GGetPlayerStatusVars rebuild(
          void Function(GGetPlayerStatusVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetPlayerStatusVarsBuilder toBuilder() =>
      new GGetPlayerStatusVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetPlayerStatusVars;
  }

  @override
  int get hashCode {
    return 256736494;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GGetPlayerStatusVars').toString();
  }
}

class GGetPlayerStatusVarsBuilder
    implements Builder<GGetPlayerStatusVars, GGetPlayerStatusVarsBuilder> {
  _$GGetPlayerStatusVars? _$v;

  GGetPlayerStatusVarsBuilder();

  @override
  void replace(GGetPlayerStatusVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetPlayerStatusVars;
  }

  @override
  void update(void Function(GGetPlayerStatusVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetPlayerStatusVars build() {
    final _$result = _$v ?? new _$GGetPlayerStatusVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
