// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelAdapter extends TypeAdapter<Model> {
  @override
  final int typeId = 0;

  @override
  Model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Model(
      selectedDate: fields[0] as String,
      planName: fields[1] as String,
      buildTextField: (fields[2] as List).cast<String>(),
      subTaskName: fields[3] as String,
      AddSubTask: fields[4] as String,
      baseAddTask: fields[5] as String,
      id: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Model obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.selectedDate)
      ..writeByte(1)
      ..write(obj.planName)
      ..writeByte(2)
      ..write(obj.buildTextField)
      ..writeByte(3)
      ..write(obj.subTaskName)
      ..writeByte(4)
      ..write(obj.AddSubTask)
      ..writeByte(5)
      ..write(obj.baseAddTask)
      ..writeByte(6)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
