// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RemoteAdapter extends TypeAdapter<Remote> {
  @override
  final int typeId = 0;

  @override
  Remote read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Remote(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      name: fields[3] as String,
      addr: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Remote obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fingerprint)
      ..writeByte(2)
      ..write(obj.jwt)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.addr);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RemoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
