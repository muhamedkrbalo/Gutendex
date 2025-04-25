// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formats_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FormatsEntityAdapter extends TypeAdapter<FormatsEntity> {
  @override
  final int typeId = 2;

  @override
  FormatsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FormatsEntity(
      image: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FormatsEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormatsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
