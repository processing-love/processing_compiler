// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_app_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DbAppConfigAdapter extends TypeAdapter<DbAppConfig> {
  @override
  final int typeId = 2;

  @override
  DbAppConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DbAppConfig(
      isFirstConfig: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DbAppConfig obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isFirstConfig);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbAppConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
