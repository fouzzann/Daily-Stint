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
      baseAddTask: fields[5] as String,
      id: fields[6] as String,
      AdmPhoto: fields[7] as String,
      AdmTitile: fields[8] as String,
      AdmDescrption: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Model obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.selectedDate)
      ..writeByte(1)
      ..write(obj.planName)
      ..writeByte(2)
      ..write(obj.buildTextField)
      ..writeByte(5)
      ..write(obj.baseAddTask)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.AdmPhoto)
      ..writeByte(8)
      ..write(obj.AdmTitile)
      ..writeByte(9)
      ..write(obj.AdmDescrption);
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

class DrModelAdapter extends TypeAdapter<DrModel> {
  @override
  final int typeId = 1;

  @override
  DrModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DrModel(
      DiaryName: fields[0] as String,
      AddDiary: fields[1] as String,
      DiaryDate: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DrModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.DiaryName)
      ..writeByte(1)
      ..write(obj.AddDiary)
      ..writeByte(2)
      ..write(obj.DiaryDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubModelAdapter extends TypeAdapter<SubModel> {
  @override
  final int typeId = 2;

  @override
  SubModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubModel(
      subTaskName: fields[0] as String,
      AddSubTask: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SubModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.subTaskName)
      ..writeByte(1)
      ..write(obj.AddSubTask);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
