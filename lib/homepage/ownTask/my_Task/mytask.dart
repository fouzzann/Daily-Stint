import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:daily_stint_2/Hive/box.dart';
import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/homepage/home.dart';
import 'package:daily_stint_2/homepage/ownTask/my_Task/addplan.dart';
import 'package:daily_stint_2/homepage/ownTask/my_Task/edittask.dart';
import 'package:daily_stint_2/homepage/ownTask/my_Task/details.dart';

class MyTask extends StatefulWidget {
  const MyTask({Key? key}) : super(key: key);

  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _planNameController = TextEditingController();
  TextEditingController _addedTextFieldController = TextEditingController();

  void _deleteTask(Model model) async {
    await model.delete();
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context, Model model) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete this task?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteTask(model);
                Navigator.of(context).pop();
              },
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE6D7F1),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MyHome()));
            },
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
          title: Text(
            'My Task',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF563267),
        ),
        floatingActionButton: FloatingActionButton(backgroundColor:  Color(0xFF563267),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => AddPlan()));
          },
          child: Icon(Icons.add,
          color: Colors.white,),
        ),
        body: ValueListenableBuilder<Box<Model>>(
          valueListenable: Boxes.getData().listenable(),
          builder: (context, box, _) {
            var myData = box.values.toList().cast<Model>();
            if (myData.isEmpty) {
              return Center(
                child: Text(
                  "Oops! Tasks were not added.",
                  style: TextStyle(fontSize: 18, color: Colors.black38),
                ),
              );
            }
            return ListView.builder(
              itemCount: myData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => MyDetails(
                          name: myData[index % myData.length],
                          deleteTaskCallback: _deleteTask,
                        ),
                      ));
                    },
                    child: Card(
                      elevation: 30,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage('asset/card 2.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: 250,
                        width: 350,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    _showDeleteConfirmationDialog(context, myData[index]);
                                  },
                                  icon: Icon(Icons.delete, color: Colors.red),
                                ),
                                IconButton(
                                  onPressed: () {
                                    _editDay(
                                      myData[index],
                                      myData[index].selectedDate.toString(),
                                      myData[index].planName.toString(),
                                      myData[index].buildTextField.toString(),
                                    );
                                  },
                                  icon: Icon(Icons.edit, color: Colors.white),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    myData[index].planName.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                myData[index].selectedDate.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  color: Color.fromARGB(171, 255, 255, 255),
                                ),
                              ),
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

  void _editDay(Model updateModel, String date, String planName, String addedTextField) async {
    _dateController.text = date;
    _planNameController.text = planName;
    _addedTextFieldController.text = addedTextField;
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => DayEdit(updateModel: updateModel)));
  }
}
