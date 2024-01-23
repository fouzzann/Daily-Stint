
import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/homepage/ownTask/mytask.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Day extends StatefulWidget {
  const Day({Key? key}) : super(key: key);

  @override
  State<Day> createState() => _CustomState();
}

class _CustomState extends State<Day> {

  TextEditingController _dateController = TextEditingController();
  TextEditingController _PlanNameController = TextEditingController();
  TextEditingController _AddedTextFieldController = TextEditingController();
  TextEditingController _optionNameController = TextEditingController();
  TextEditingController _subTaskName = TextEditingController();
  TextEditingController _addSubTask = TextEditingController();
  List<TextEditingController> _addedTextFieldControllers = [];
 
  final _formKey = GlobalKey<FormState>();
  DateTime today = DateTime.now();
  List<Widget> textFields = [];
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
     _dateController = TextEditingController(
      text: DateFormat(
        'dd-mm-yyyy',   
      ).format(DateTime.now())  
      );
    _addedTextFieldControllers = [TextEditingController()];
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xFFE6D7F1)),
        backgroundColor: Color(0xFFE6D7F1),
        body: SingleChildScrollView(
          child: Column(
            children: [ 
              
            //  TextField(
            //   decoration: InputDecoration( hintText: 'Option Day',
            //       border: InputBorder.none
            //       ),
            //   controller: _optionNameController,
            //  ),
              Padding(
                padding: const EdgeInsets.only(left: 155),   
                child: TextFormField(
                  decoration: InputDecoration( 
                  border: InputBorder.none
                  ),
                  controller: _dateController,
                ),
              ),
              
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 10,
                color: Color.fromARGB(255, 133, 111, 143),
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
                    Text(''),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Container(
                      
                        decoration: BoxDecoration(
                          border: Border.all(
                            
                            
                          ),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: TextFormField(
                          controller: _PlanNameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator:(Value){
                        if(Value == null|| Value.isEmpty){
                          return "Please Enter Your Plan Name";
                        }
                        return null;
                        } ,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: " Add Plan Name", 
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: textFields,
                    )
                  ],
                ),
              ),
              ElevatedButton(

                onPressed: () {
                  if (_addedTextFieldControllers.length<9999999) {
                    setState(() {
                      List<TextEditingController> controllers = List.from(_addedTextFieldControllers);
                     _addedTextFieldControllers.add(TextEditingController());
                     textFields.add(buildTextField(_addedTextFieldControllers.length - 1,));

                    }
                   );
                  }
                },
                child: Text("+ Add Plan's",
                style: TextStyle(
                  color: Colors.white
                ),),
                style: ButtonStyle(
                  backgroundColor:  MaterialStateProperty.all<Color>(Color.fromARGB(255, 55, 206, 68),
                  ),

                ),
            ),
            SizedBox(height:69),
            ElevatedButton(onPressed: (){
              if(_formKey.currentState!.validate()){
                saveToDataBase();
                
              }             
              print(_dateController.text);
              print(_addedTextFieldControllers.map((controller) => controller.text).toList());
              print(_PlanNameController.text);
            }, child: Text('Save',
            style: TextStyle(color: Colors.white),),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF563267)),
            ),
            ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildTextField(int intex) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Expanded(
        child: Container(height: 100,
          decoration: BoxDecoration(
          color: Color.fromARGB(255, 131, 100, 146),
          borderRadius: BorderRadius.circular(10)  
        ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: TextFormField(
               controller: _addedTextFieldControllers[intex],
              decoration: InputDecoration(            
                hintText: "Tap To Add Plan +",             
                border: InputBorder.none               
              ),
            ),
          ),
        ),
      ),
    );
  }
  void saveToDataBase()async{
    final myData = Model(selectedDate: _dateController.text.toString(),
    subTaskName: _subTaskName.text.toString(), 
    AddSubTask: _addSubTask.text.toString(),  
     planName: _PlanNameController.text.toString(),
      buildTextField: _addedTextFieldControllers.map((controller) => controller.text).toList());
    var box = await Hive.openBox<Model>('model');
    await box.add(myData);
    // await box.close();
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MyTask()));
    print(box);
  }
}




