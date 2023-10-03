// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_articles_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookMarkArticleAdapter extends TypeAdapter<BookMarkArticle> {
  @override
  final int typeId = 3;

  @override
  BookMarkArticle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookMarkArticle(
      fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BookMarkArticle obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookMarkArticleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
