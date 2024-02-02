

import 'package:daily_stint_2/Hive/box.dart';
import 'package:daily_stint_2/Hive/model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class SubTask extends StatefulWidget {
  const SubTask({Key? key}) : super(key: key);

  @override
  State<SubTask> createState() => _SubTaskState();
}

class _SubTaskState extends State<SubTask> {
 TextEditingController _DiaryNameController= TextEditingController();
  TextEditingController _AddDiaryController = TextEditingController();
  TextEditingController _subTaskName = TextEditingController();
  TextEditingController _addSubTask = TextEditingController();
  TextEditingController _baseAddTask = TextEditingController();
   TextEditingController _id = TextEditingController();
  List<TextEditingController> _addedTextFieldControllers = [];
     TextEditingController _AdmPhoto = TextEditingController();
        TextEditingController _AdmTitle = TextEditingController();
           TextEditingController _AdmDescription = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SubTask',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<Box<Model>>(
        valueListenable: Boxes.getData().listenable(),
        builder: (context, box, _) {
          var data = box.values.toList().cast<Model>();
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                child: Card(
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
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _showMyDialog(context);
        },
        child: Icon(Icons.add),
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
            child: Column( 
              children: [
                TextFormField(
                  controller: _subTaskName,
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
                  decoration: InputDecoration(
                    hintText: 'Enter Plan',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
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
                Navigator.pop(context);
                _addData();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    
    );
  }

  void _addData() {
    final data = Model(
      AdmPhoto: _AdmPhoto.text.toString(),
      AdmTitile: _AdmTitle.text.toString(),
      AdmDescrption: _AdmDescription.text.toString(),
        AddDiary: _AddDiaryController.text.toString(),
      DiaryName:_DiaryNameController.text.toString(),
      id: _id.text.toString(),
      baseAddTask: _baseAddTask.text.toString(),
      selectedDate: _subTaskName.text.toString(),
      subTaskName: _subTaskName.text.toString(),
      AddSubTask: _addSubTask.text.toString(),
      planName: _subTaskName.text.toString(),
      buildTextField: _addedTextFieldControllers.map((controller) => controller.text).toList(),
    );
    final box = Boxes.getData();
    box.add(data);
    data.save();
    _subTaskName.clear();
    _addSubTask.clear();
    print(box);
  }

  void delete(Model model) async {
    await model.delete();
  }
}
