import 'package:daily_stint_2/Hive/box.dart';
import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/diary/diary_details.dart';
import 'package:daily_stint_2/diary/diary_edit.dart';
import 'package:daily_stint_2/diary/diary_interface.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DiaryList extends StatefulWidget {
 
  const DiaryList({super.key,});

  @override
  State<DiaryList> createState() => _DiaryListState();
}

class _DiaryListState extends State<DiaryList> {
  TextEditingController _DiaryDateController = TextEditingController();
  TextEditingController _AddDiaryController = TextEditingController();
  TextEditingController _DiaryNameController= TextEditingController();
  @override 
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Color(0xFFE6D7F1),
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DiaryInterface()));
          } ,icon: Icon(Icons.arrow_back,
          color: Colors.white ,)),
          title: Text('Saved Diary',
          style: TextStyle(fontSize: 25,
          fontWeight: FontWeight.w600, 
          color:  Colors.white,
          ),
                       
          ), 
          centerTitle: true,
          backgroundColor: Color(0xFF563267),           
        ),
        body:ValueListenableBuilder<Box<DrModel>>(valueListenable: Boxes1.getData().listenable(), 
        builder: (context, box, _) { 
          var myData = box.values.toList().cast<DrModel>();
          if(myData.isEmpty){
            return
            Center(
              child: Text("Ooop's Diary were not added ",
              style: TextStyle(fontSize: 18,
              color: Colors.black38,  
              ), 
             ), 
            ); 
          }
          return ListView.builder(
            itemCount: myData.length,
            itemBuilder: (context, index) {   
              return             
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(onTap: (){
                 
         Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => DiaryDetails(Diary: myData[index%myData.length])
         ));

                },
                  child: Card(
                    elevation: 30,
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Container(
                      decoration: BoxDecoration( borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(image: AssetImage('asset/Saved Diary 2.jpg'), 
                        fit: BoxFit.cover
                       
                        ),
                        
                      ),
                      
                      height: 250,  
                      width: 350,                  
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                        Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(onPressed: (){
                          showDialog(context: context, builder: (context)=>AlertDialog(title: Text('Delete?'),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.of(context).pop(false);
                            }, child: Text('Cancel')),
                            TextButton(onPressed: (){
                               delete(myData[index]);
                              Navigator.pop(context);
                            }
                            , child: Text('Delete',
                            style: TextStyle(color: Colors.red),))
                            ],));
                            }, icon: Icon(Icons.delete,color: Colors.red,)),
                            IconButton(onPressed: (){
                              _editDiary(
                                myData[index],
                                myData[index].AddDiary.toString(),
                                myData[index].DiaryDate.toString(),
                                myData[index].DiaryName.toString(),
                        
                              );
                            }, icon: Icon(Icons.edit))
                          ],
                        ),
                         Column( 
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 10),
                               child: Text(myData[index].DiaryName.toString(),
                               style: TextStyle(color: Colors.black38, 
                               fontSize: 35,
                               fontWeight: FontWeight.w900,
                               ),

                               ), 
                             ),
                             Padding(
                               padding: const EdgeInsets.only(left: 10), 
                               child: Text(myData[index].DiaryDate.toString(),
                               style: TextStyle(
                                fontSize: 20  
                               ),
                               ),
                               
                             ),
                           ],
                         ), 
                      
                       ],
                      ),
                    ),
                  ),
                  
                ),
              );
            }, 
          );
        },
              ),
        
      ),
    );
  }
  void delete(Model)async{
    await Model.delete();
  }
 void _editDiary(DrModel editDiary ,String AddDiary,String DiaryDate,String DiaryName) async{
  _AddDiaryController.text = AddDiary;
  _DiaryDateController.text = DiaryDate;
  _DiaryNameController.text = DiaryName;
  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> DiaryEdit(editDiary: editDiary)));
 }

}