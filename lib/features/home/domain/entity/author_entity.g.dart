// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthorEntityAdapter extends TypeAdapter<AuthorEntity> {
  @override
  final int typeId = 1;

  @override
  AuthorEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthorEntity(
      name: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthorEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthorEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
