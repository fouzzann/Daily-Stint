
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
  
   @HiveField(5)
  String baseAddTask;
   @HiveField(6)
  String id;
  @HiveField(7)
  String AdmPhoto;
  @HiveField(8)
  String AdmTitile;
  @HiveField(9)
  String AdmDescrption;
  



  Model({
    required this.selectedDate,
    required this.planName,
    required this.buildTextField,
    
    required this.baseAddTask,
    required this.id,
    required this.AdmPhoto,
    required this.AdmTitile,
    required this.AdmDescrption,
    });
   

}



@HiveType(typeId: 1)

class DrModel extends HiveObject{
  @HiveField(0)
  String DiaryName;
  @HiveField(1)
  String AddDiary;
  @HiveField(2)
  String DiaryDate;


  DrModel({
    required this.DiaryName,
    required this.AddDiary,
    required this.DiaryDate
    });




    
}


@HiveType(typeId: 2)

class SubModel extends HiveObject{
 
 @HiveField(0)
  String subTaskName;
   @HiveField(1)
  String AddSubTask;

  SubModel({
    required this.subTaskName,
    required this.AddSubTask,
    });




    
}