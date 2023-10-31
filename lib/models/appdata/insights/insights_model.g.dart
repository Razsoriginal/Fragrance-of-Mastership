// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insights_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InsightModelAdapter extends TypeAdapter<InsightModel> {
  @override
  final int typeId = 7;

  @override
  InsightModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InsightModel(
      id: fields[0] as String,
      title: fields[1] as String,
      content: fields[5] as String,
      categories: (fields[2] as List).cast<String>(),
      description: fields[4] as String,
      tags: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, InsightModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.categories)
      ..writeByte(3)
      ..write(obj.tags)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InsightModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
