
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Custom extends StatefulWidget {
  const Custom({Key? key}) : super(key: key);

  @override
  State<Custom> createState() => _CustomState();
}

class _CustomState extends State<Custom> {
  final _formKey = GlobalKey<FormState>();
  DateTime today = DateTime.now();
  List<Widget> textFields = [];
  DateTime selectedDate = DateTime.now();
  void _OnDaySelected(DateTime day,DateTime focusedDay){
    setState(() {
      today=day;
    });
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
              Text(


                
                      "Selected day ="+today.toString().split(" ")[0],
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600 ,
                      color:  Color.fromARGB(255, 133, 111, 143), 
                    ),  ),
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
                  onDaySelected: _OnDaySelected,
                  headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  
                  ),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                ), 
              ),
              SizedBox(
                height: 30,
              ),
              Form(key: _formKey,
                child: Column(            
                  children: [
                    Text('Add Plan Name'),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: TextFormField(autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator:(Value){
                      if(Value == null|| Value.isEmpty){
                        return "Please Enter Your Plan Name";
                      }
                      return null;
                      } ,
                        decoration: InputDecoration(
                          hintText: "Plan Name",
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
                  if (textFields.length < 20) {
                    setState(() {
                      textFields.add(buildTextField());
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
              if(_formKey.currentState!.validate());
            }, child: Text('Finish',
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
  Widget buildTextField() {
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




