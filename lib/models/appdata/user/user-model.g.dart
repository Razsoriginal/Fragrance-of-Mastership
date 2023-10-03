// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FragranceUserAdapter extends TypeAdapter<FragranceUser> {
  @override
  final int typeId = 4;

  @override
  FragranceUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FragranceUser(
      token: fields[0] as int?,
      name: fields[1] as String,
      email: fields[2] as String,
      gender: fields[3] as String,
      ageGroup: fields[4] as String,
      phoneNumber: fields[5] as String,
      preferredLanguage: fields[6] as String,
      country: fields[7] as String,
      state: fields[8] as String,
      city: fields[9] as String,
      zipCode: fields[10] as String,
      userClass: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FragranceUser obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.ageGroup)
      ..writeByte(5)
      ..write(obj.phoneNumber)
      ..writeByte(6)
      ..write(obj.preferredLanguage)
      ..writeByte(7)
      ..write(obj.country)
      ..writeByte(8)
      ..write(obj.state)
      ..writeByte(9)
      ..write(obj.city)
      ..writeByte(10)
      ..write(obj.zipCode)
      ..writeByte(11)
      ..write(obj.userClass);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FragranceUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
