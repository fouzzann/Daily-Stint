import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/diary/diary_interface.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Diary extends StatefulWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  TextEditingController _DiaryDateController = TextEditingController();
  TextEditingController _AddDiaryController = TextEditingController();
  TextEditingController _DiaryNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  DateTime today = DateTime.now();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _DiaryDateController = TextEditingController(
      text: DateFormat(
        "dd-MMM-yyyy",
      ).format(DateTime.now()),
    );
  }

    @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(leading: IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DiaryInterface()));
        }, icon: Icon(Icons.arrow_back,
        color: Colors.white,)),
          backgroundColor:  Color(0xFF563267),
          title: Text(
            'My Diary',
            style: TextStyle(
              fontSize: 25, 
              fontWeight: FontWeight.w600,
              color:Colors.white
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
                  lastDay: DateTime.now(), // Allow dates up to today
                  selectedDayPredicate: (day) {
                    return isSameDay(selectedDate, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      selectedDate = selectedDay;
                      _DiaryDateController.text =
                          DateFormat("dd-MMM-yyyy").format(selectedDay);
                    });
                  },
                  availableCalendarFormats: {
    CalendarFormat.month: 'Month',
   
  },
                 
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          height: 100,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _DiaryNameController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (Value) {
                                  if (Value == null || Value.isEmpty) {
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
                    Text(
                      'Diary',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // TextFormField(
                    //   decoration: InputDecoration(border: InputBorder.none),
                    //   controller: _DiaryDateController,
                    //   enabled: false,
                    // ),
                    SizedBox(),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                          height: 700,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                maxLines: null,
                                controller: _AddDiaryController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (Value) {
                                  if (Value == null || Value.isEmpty) {
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
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    saveDiaryDetails();
                  }
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF563267)),
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

  void saveDiaryDetails() async {
    final myData = DrModel(
      DiaryDate: _DiaryDateController.text.toString(),
      AddDiary: _AddDiaryController.text.toString(),
      DiaryName: _DiaryNameController.text.toString(),
    );
    var box = await Hive.openBox<DrModel>('drmodel');
    await box.add(myData);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => DiaryInterface()));
  }
}