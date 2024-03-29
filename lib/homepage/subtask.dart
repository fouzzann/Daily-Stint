import 'package:daily_stint_2/Hive/box.dart';
import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/homepage/home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class SubTask extends StatefulWidget {
  const SubTask({Key? key}) : super(key: key);

  @override
  State<SubTask> createState() => _SubTaskState();
}

class _SubTaskState extends State<SubTask> {
  TextEditingController _subTaskName = TextEditingController();
  TextEditingController _addSubTask = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
          backgroundColor: Color(0xFF563267),
          title: Text(
            'SubTask',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: ValueListenableBuilder<Box<SubModel>>(
          valueListenable: Boxes2.getData().listenable(),
          builder: (context, box, _) {
            var data = box.values.toList().cast<SubModel>();
            if (data.isEmpty) {
              return Center(
                child: Text(
                  "Ooop's SubTask were not added ",
                  style: TextStyle(fontSize: 18, color: Colors.black38),
                ),
              );
            }

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 100,
                      child: Card(
                        color: Color.fromARGB(255, 238, 211, 243),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[index].subTaskName.toString(),
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      delete(data[index]);
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              Text(data[index].AddSubTask.toString()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF563267),
          onPressed: () async {
            await _showMyDialog(context);
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Plan'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _subTaskName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a plan name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Plan Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _addSubTask,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a plan';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Plan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pop(context);
                  _addData();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _addData() {
    final data = SubModel(
      subTaskName: _subTaskName.text.toString(),
      AddSubTask: _addSubTask.text.toString(),
    );
    final box = Boxes2.getData();
    box.add(data);
    data.save();
    _subTaskName.clear();
    _addSubTask.clear();
  }

  void delete(SubModel model) async {
    await model.delete();
  }
}
