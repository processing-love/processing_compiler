// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_project_file.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DbProjectFileAdapter extends TypeAdapter<DbProjectFile> {
  @override
  final int typeId = 1;

  @override
  DbProjectFile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DbProjectFile(
      name: fields[0] as String,
      code: fields[1] as String,
      type: fields[3] as int,
      htmlTemplate: fields[5] as String,
      time: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DbProjectFile obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.time)
      ..writeByte(5)
      ..write(obj.htmlTemplate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbProjectFileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
