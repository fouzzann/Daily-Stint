


import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)

class Model extends HiveObject{
  @HiveField(0)
  String selectedDate;
  @HiveField(1)
  String planName;
  @HiveField(2)
  List<String> buildTextField;
  @HiveField(3)
  String subTaskName;
   @HiveField(4)
  String AddSubTask;
   @HiveField(5)
  String baseAddTask;
   @HiveField(6)
  String id;

  Model({
    required this.selectedDate,
    required this.planName,
    required this.buildTextField,
    required this.subTaskName,
    required this.AddSubTask,
    required this.baseAddTask,
    required this.id
    });
}