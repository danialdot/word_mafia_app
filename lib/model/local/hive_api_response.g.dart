// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_api_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ApiResponseBoxAdapter extends TypeAdapter<ApiResponseBox> {
  @override
  final int typeId = 0;

  @override
  ApiResponseBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ApiResponseBox(
      url: fields[0] as String,
      response: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ApiResponseBox obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.response);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiResponseBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
