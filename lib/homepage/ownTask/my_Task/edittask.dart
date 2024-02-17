import 'package:daily_stint_2/Hive/model.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class EditTask extends StatefulWidget {
  final Model updateModel;

  const EditTask({Key? key, required this.updateModel}) : super(key: key);

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _PlanNameController = TextEditingController();
  List<TextEditingController> _addedTextFieldControllers = [];

  final _formKey = GlobalKey<FormState>();
  DateTime today = DateTime.now();
  List<Widget> textFields = [];
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    _dateController.text = widget.updateModel.selectedDate;
    _PlanNameController.text = widget.updateModel.planName;
    _addedTextFieldControllers =
        widget.updateModel.buildTextField.map((value) => TextEditingController(text: value)).toList();
    textFields.addAll(_addedTextFieldControllers.map((controller) => buildTextField(_addedTextFieldControllers.indexOf(controller))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Edit Plan',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 38, 6, 80),
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 192, 161, 214),
        ),
        backgroundColor: Color(0xFFE6D7F1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 35,
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(8)),
                        child: TextFormField(
                          controller: _PlanNameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (Value) {
                            if (Value == null || Value.isEmpty) {
                              return "Please Enter Your Plan Name";
                            }
                            return null;
                          },
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
              Container(
                height: 80,
                width: 390,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _addedTextFieldControllers.add(TextEditingController());
                      textFields.add(buildTextField(_addedTextFieldControllers.length - 1));
                    });
                  },
                  child: Center(
                    child: Text(
                      'Click here to Add plan',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  widget.updateModel.selectedDate = _dateController.text.toString();
                  widget.updateModel.planName = _PlanNameController.text.toString();
                  widget.updateModel.buildTextField = _addedTextFieldControllers.map((controller) => controller.text).toList();
                  await widget.updateModel.save();
                  Navigator.pop(context);
                },
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF563267)),
                ),
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(int index) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 131, 100, 146),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextFormField(
            controller: _addedTextFieldControllers[index],
            decoration: InputDecoration(
              hintText: "Tap To Add Plan +",
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
