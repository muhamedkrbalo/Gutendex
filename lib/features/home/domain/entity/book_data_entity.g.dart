// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_data_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookDataEntityAdapter extends TypeAdapter<BookDataEntity> {
  @override
  final int typeId = 0;

  @override
  BookDataEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookDataEntity(
      id: fields[0] as int?,
      title: fields[1] as String?,
      authors: (fields[2] as List?)?.cast<AuthorEntity>(),
      summaries: (fields[3] as List?)?.cast<String>(),
      formats: fields[4] as FormatsEntity?,
    );
  }

  @override
  void write(BinaryWriter writer, BookDataEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.authors)
      ..writeByte(3)
      ..write(obj.summaries)
      ..writeByte(4)
      ..write(obj.formats);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookDataEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
