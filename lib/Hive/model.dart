
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
  String baseAddTask;
   @HiveField(4)
  String id;
 



  Model({
    required this.selectedDate,
    required this.planName,
    required this.buildTextField,
    
    required this.baseAddTask,
    required this.id,
  
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
//Adm////////////////////
@HiveType(typeId: 6)

class Adm extends HiveObject{
   @HiveField(7)
  String AdmPhoto;
  @HiveField(8)
  String AdmTitile;
  @HiveField(9)
  String AdmDescrption;
  

  Adm({
    required this.AdmPhoto,
    required this.AdmTitile,
    required this.AdmDescrption
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

@HiveType(typeId: 4)
enum CategoryType{
   @HiveField(0)
  income,
  @HiveField(1)
  expense
}

@HiveType(typeId: 3)

class CategoryModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name ;
  @HiveField(2)
  final bool isDeleted;
  @HiveField(3)
  final CategoryType type;

  CategoryModel({
   required this.name,
   this.isDeleted = false,
   required this.type,
   required this.id
   });

   @override
  String toString() {
   
   return '$name $type';
  }

}



@HiveType(typeId: 5)
class TransactionsModel{
  @HiveField(0)
final String purpose;
  @HiveField(1)
final double amount;
  @HiveField(2)
final DateTime date;
  @HiveField(3)
final CategoryType type;
  @HiveField(4)
final CategoryModel Category;
  @HiveField(5)
   String? id;

  TransactionsModel({
    required this.purpose,
     required this.amount,
      required this.date,
       required this.type,
        required this.Category
        }){
          id = DateTime.now().millisecondsSinceEpoch.toString();
        }
}