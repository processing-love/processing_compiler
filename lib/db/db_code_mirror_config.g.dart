// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_code_mirror_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DbCodeMirrorConfigAdapter extends TypeAdapter<DbCodeMirrorConfig> {
  @override
  final int typeId = 0;

  @override
  DbCodeMirrorConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DbCodeMirrorConfig(
      codeFontSize: fields[1] as double,
      codeThemeName: fields[2] as String,
    )..language = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, DbCodeMirrorConfig obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.codeFontSize)
      ..writeByte(2)
      ..write(obj.codeThemeName)
      ..writeByte(3)
      ..write(obj.language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbCodeMirrorConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
