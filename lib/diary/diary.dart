
import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/diary/diary_list.dart';
import 'package:daily_stint_2/homepage/ownTask/my_Task/mytask.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Diary extends StatefulWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  State<Diary> createState() => _CustomState();
}

class _CustomState extends State<Diary> {
  TextEditingController _DiaryDateController = TextEditingController();
  TextEditingController _AddDiaryController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _PlanNameController = TextEditingController();
  TextEditingController _DiaryNameController= TextEditingController();
  TextEditingController _optionNameController = TextEditingController();
  TextEditingController _subTaskName = TextEditingController();
  TextEditingController _addSubTask = TextEditingController();
  TextEditingController _baseAddTask = TextEditingController();
  TextEditingController _id = TextEditingController();
  List<TextEditingController> _addedTextFieldControllers = [];
  TextEditingController _AdmPhoto= TextEditingController();
  TextEditingController _AdmTitle = TextEditingController();
  TextEditingController _AdmDescription = TextEditingController();
  
 
  final _formKey = GlobalKey<FormState>();
  DateTime today = DateTime.now();
  List<Widget> textFields = [];
  DateTime selectedDate = DateTime.now();
  @override

  void initState() {
     super.initState();
    _dateController = TextEditingController(
    text: DateFormat(
      'dd-MMM-yyyy',
    ).format(DateTime.now()),
  );
  
  super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Diary',
          style: TextStyle(fontSize: 25,  
          fontWeight: FontWeight.w600, 
          color:  Color.fromARGB(255, 38, 6, 80),
          ),
        ),
        centerTitle: true,
         
          ),
    
        body: SingleChildScrollView(
          child: Column(
            children: [ 
             
              
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 10,
    
                child: TableCalendar(
                  focusedDay: today,
                  firstDay: DateTime.utc(2023, 1, 1),
                  lastDay: DateTime.utc(2090, 1, 1),
                ),
               ),
               SizedBox(
                height: 30,
               ),
               Form(key:_formKey,
                child: Column(            
                  children: [       
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Container(
                      
                        decoration: BoxDecoration(
                          
                          borderRadius: BorderRadius.circular(8)
                        ), 
                        child: Container(
                          height: 100,
                          child: Card(                          
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _DiaryNameController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator:(Value){
                              if(Value == null|| Value.isEmpty){
                                return "Please Enter Your Diary Name";
                              }
                              return null;
                              },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  
                                  hintText: "Add Diary Name", 
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Diary',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),),
                 
                    Padding(
                      padding: const EdgeInsets.only(left: 155 ),  
                      child: TextFormField(
                                        decoration: InputDecoration( 
                                        border: InputBorder.none
                                        ),                 
                                        controller: _DiaryDateController,
                                      ),
                    ),
                SizedBox(

                ),
                  Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Container(
                      
                        decoration: BoxDecoration(
                          
                          borderRadius: BorderRadius.circular(8)
                        ), 
                        child: Container(
                          
                          height: 700,
                          child: Card(                          
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                maxLines: null,
                                controller: _AddDiaryController ,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator:(Value){
                              if(Value == null|| Value.isEmpty){
                                return "Please Enter Your Content";
                              }
                              return null;
                              },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                   
                                  hintText: "Type here", 
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                   
                  ],
                ),
              ),
           
           
            SizedBox(height:40),
            ElevatedButton(onPressed: (){
              if(_formKey.currentState!.validate()){
                saveToDataBase();
                
              }                          
            },
             child: Text('Save',
                         style: TextStyle(color: Colors.white),),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF563267)),
            ),
            ),
            SizedBox(
              height: 10,
            )
            
            ],
          ),
        ),
      ),
    );
  }
 
  void saveToDataBase()async{
    final myData = Model(
       AdmPhoto: _AdmPhoto.text.toString(),
      AdmTitile: _AdmTitle.text.toString(),
      AdmDescrption: _AdmDescription.text.toString(),
      // DiaryDate: _DiaryDateController.text.toString(),
      AddDiary: _AddDiaryController.text.toString(),
      DiaryName:_DiaryNameController.text.toString(),
      id: UniqueKey().toString(),
      baseAddTask: _baseAddTask.text.toString(),
      selectedDate: _dateController.text.toString(),
      subTaskName: _subTaskName.text.toString(), 
      AddSubTask: _addSubTask.text.toString(),  
      planName: _PlanNameController.text.toString(),
      buildTextField: _addedTextFieldControllers.map((controller) => controller.text).toList());
    var box = await Hive.openBox<Model>('model');
    await box.add(myData);
    // await box.close();
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DiaryList()));
    print(box);
  }
} 




