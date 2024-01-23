
import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/homepage/ownTask/mytask.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class DayEdit extends StatefulWidget {
final Model updateModel;

  const DayEdit({super.key, required this.updateModel});

  @override
  State<DayEdit> createState() => _CustomState();
}

class _CustomState extends State<DayEdit> {

  TextEditingController _dateController = TextEditingController();
  TextEditingController _PlanNameController = TextEditingController();
  TextEditingController _AddedTextFieldController = TextEditingController();
  List<TextEditingController> _addedTextFieldControllers = [];
  
 
  final _formKey = GlobalKey<FormState>();
  DateTime today = DateTime.now();
  List<Widget> textFields = [];
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {

    //  _dateController = TextEditingController(
    //   text: DateFormat(
    //     'yyyy-mm-dd',   
    //   ).format(DateTime.now())  
    //   );
    // _addedTextFieldControllers = [TextEditingController()];
   
   _dateController.text=widget.updateModel.selectedDate;
   _PlanNameController.text =widget.updateModel.planName;
// _AddedTextFieldController.text= widget.updateModel.buildTextField.toString();
_addedTextFieldControllers = widget.updateModel.buildTextField.map((value) => TextEditingController(text: value)).toList();
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
              SizedBox(
                height: 35,
              ),
             
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
            ElevatedButton(onPressed: ()async{
              widget.updateModel.selectedDate = _dateController.text.toString();
              widget.updateModel.planName = _PlanNameController.text.toString();
              widget.updateModel.buildTextField = _addedTextFieldControllers.map((controller) => controller.text).toList();
              await widget.updateModel.save();
              Navigator.pop(context);
            }, child: Text('Update',
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
    );
  }
 
}



