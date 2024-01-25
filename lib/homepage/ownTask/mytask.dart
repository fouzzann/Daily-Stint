
import 'package:daily_stint_2/Hive/box.dart';
import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/homepage/home.dart';
import 'package:daily_stint_2/homepage/ownTask/2%20options/addplan.dart';
import 'package:daily_stint_2/homepage/ownTask/2%20options/edittask.dart';
import 'package:daily_stint_2/homepage/ownTask/2%20options/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

class MyTask extends StatefulWidget {
  const MyTask({super.key,});

  @override
  State<MyTask> createState() => _myTaskState();
}

class _myTaskState extends State<MyTask> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _PlanNameController = TextEditingController();
  TextEditingController _AddedTextFieldController = TextEditingController();
  @override 
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Color(0xFFE6D7F1),
        appBar: AppBar(

          leading: IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MyHome()));
          } ,icon: Icon(Icons.arrow_back,
          color: Color.fromARGB(255, 32, 10, 61),)),
          title: Padding(
          padding: const EdgeInsets.only(left:80),
          child: Text('My Task',
          style: TextStyle(fontSize: 25,
          fontWeight: FontWeight.w600, 
          color:  Color.fromARGB(255, 38, 6, 80),),
                
          ),
        ),
          backgroundColor:Color.fromARGB(255, 192, 161, 214),           
        ),floatingActionButton: FloatingActionButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return Day();},),);},child: Icon(Icons.add),),
        body:ValueListenableBuilder<Box<Model>>(valueListenable: Boxes.getData().listenable(),
        // valueListenable: Hive.box<Model>('model').listenable(),  
        builder: (context, box, _) { 
          var myData = box.values.toList().cast<Model>();
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              return             
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MyDetails(name: myData[index%myData.length])));
                },
                  child: Card(
                    elevation: 30,
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Container(
                      decoration: BoxDecoration(  borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(image: AssetImage('asset/card.webp'), 
                        fit: BoxFit.cover
                        
                        )
                      ),
                      height: 250,  
                      width: 350,                  
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 275),
                          child: Row(
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
                               editDay(
                                myData[index],
                                 myData[index].selectedDate.toString(),
                                  myData[index].planName.toString(),
                                   myData[index].buildTextField.toString()
                                );
                              }, icon: Icon(Icons.edit,color: Colors.white,))
                            ],
                          ),
                        ),
                         Column(
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 10),
                               child: Text(myData[index].planName.toString(),
                               style: TextStyle(color: Colors.white,
                               fontSize: 25,
                               fontWeight: FontWeight.w900,
                               ),

                               ),
                             ),
                           ],
                         ), 
                         Padding(
                           padding: const EdgeInsets.only(left: 10), 
                           child: Text(myData[index].selectedDate.toString(),
                           style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15
                           ),),
                         ),
                         
                         // Text(myData[index].buildTextField.toString())
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
  Future<void>editDay(
  Model updateModel,
  String Date,
  String planName,
  String addedTextField
  )async{
  _dateController.text = Date;
  _PlanNameController.text = planName;
  _AddedTextFieldController.text = addedTextField;
  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DayEdit(updateModel: updateModel)));
  }
}

