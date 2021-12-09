// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_project_raw_code.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DbProjectRawCodeAdapter extends TypeAdapter<DbProjectRawCode> {
  @override
  final int typeId = 1;

  @override
  DbProjectRawCode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DbProjectRawCode(
      createTime: fields[0] as int?,
      rawCode: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DbProjectRawCode obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.createTime)
      ..writeByte(1)
      ..write(obj.rawCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbProjectRawCodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
