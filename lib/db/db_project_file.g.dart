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
      nameKey: fields[6] as String?,
      name: fields[0] as String,
      code: fields[1] as String,
      htmlTemplate: fields[5] as String,
      projectType: fields[3] as int,
      modifyTime: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DbProjectFile obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(3)
      ..write(obj.projectType)
      ..writeByte(4)
      ..write(obj.modifyTime)
      ..writeByte(5)
      ..write(obj.htmlTemplate)
      ..writeByte(6)
      ..write(obj.nameKey);
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
