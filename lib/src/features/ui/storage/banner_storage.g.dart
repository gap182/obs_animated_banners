// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_storage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BannerStorageAdapter extends TypeAdapter<BannerStorage> {
  @override
  final int typeId = 1;

  @override
  BannerStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BannerStorage(
      group: (fields[1] as Map).cast<String, dynamic>(),
      texts: (fields[2] as List)
          .map((dynamic e) => (e as Map).cast<String, dynamic>())
          .toList(),
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BannerStorage obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.group)
      ..writeByte(2)
      ..write(obj.texts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BannerStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
