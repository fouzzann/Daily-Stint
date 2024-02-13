import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/homepage/ownTask/my_Task/congrats.dart';
import 'package:daily_stint_2/homepage/ownTask/my_Task/mytask.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDetails extends StatefulWidget {
  final Model name;
  final void Function(Model) deleteTaskCallback;

  const MyDetails({Key? key, required this.name, required this.deleteTaskCallback})
      : super(key: key);

  @override
  State<MyDetails> createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetails> {
  List<bool?> isCompleted = [];
  bool isCompletePressed = false;

  @override
  void initState() {
    loadRadioState();
    super.initState();

    isCompleted = List.generate(
      widget.name.buildTextField.length,
      (index) => null,
    );
  }

  void loadRadioState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = List.generate(
        widget.name.buildTextField.length,
        (index) => prefs.getBool('${widget.name.id}_radioState_$index') ?? null,
      );
    });
  }

  void saveRadioState(int index, bool? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('${widget.name.id}_radioState_$index', value ?? false);
  }

  @override
  Widget build(BuildContext context) {
    List<String> filteredBuildTextField = widget.name.buildTextField
        .where((value) => value.isNotEmpty)
        .toList();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE6D7F1),
        appBar: AppBar(
          backgroundColor: Color(0xFF563267),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => MyTask(),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text(
            'Details',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: filteredBuildTextField.isEmpty
            ? Center(
                child: Text(
                  'oops! you were not added the task\n   if you want to add please click \n      the edit button to add task',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black38),
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredBuildTextField.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Color.fromARGB(255, 222, 208, 224),
                          elevation: 10,
                          child: Column(
                            children: [
                              Text(
                                filteredBuildTextField[index],
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black38,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Radio(
                                    value: true,
                                    groupValue: isCompleted[index] ?? false,
                                    onChanged: (value) {
                                      setState(() {
                                        isCompleted[index] = value!;
                                        saveRadioState(index, value);
                                      });
                                    },
                                    activeColor: Colors.green,
                                  ),
                                  Text(
                                    'Completed',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  Radio(
                                    value: false,
                                    groupValue: isCompleted[index] ?? false,
                                    onChanged: (value) {
                                      setState(() {
                                        isCompleted[index] = value!;
                                        saveRadioState(index, value);
                                      });
                                    },
                                    activeColor: Colors.red,
                                  ),
                                  Text(
                                    'Not Completed',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF563267)),
                    ),
                      onPressed: () {
                        setState(() {
                          isCompletePressed = true;
                          for (int i = 0; i < isCompleted.length; i++) {
                            isCompleted[i] = false;
                          }
                        });
                        widget.deleteTaskCallback(widget.name);
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => CongratsScreen()));
                      },
                      child: Text(
                        'Completed',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),  
                ],
              ),
      ),
    );
  }
}
