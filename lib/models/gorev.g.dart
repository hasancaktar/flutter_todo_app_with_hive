// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gorev.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GorevAdapter extends TypeAdapter<Gorev> {
  @override
  final int typeId = 0;

  @override
  Gorev read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Gorev(
      aciklama: fields[0] as String,
      tamamlanma: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Gorev obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.aciklama)
      ..writeByte(1)
      ..write(obj.tamamlanma);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GorevAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
