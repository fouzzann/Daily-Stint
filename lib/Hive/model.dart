
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
  @HiveField(7)
  String DiaryName;
  @HiveField(8)
  String AddDiary;
  @HiveField(9)
  String AdmPhoto;
  @HiveField(10)
  String AdmTitile;
  @HiveField(11)
  String AdmDescrption;
  @HiveField(12)
  


  Model({
    required this.selectedDate,
    required this.planName,
    required this.buildTextField,
    required this.subTaskName,
    required this.AddSubTask,
    required this.baseAddTask,
    required this.id,
    required this.DiaryName,
    required this.AddDiary,
    required this.AdmPhoto,
    required this.AdmTitile,
    required this.AdmDescrption
    });
}