import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/homepage/ownTask/mytask.dart';
import 'package:flutter/material.dart';

class MyDetails extends StatefulWidget {
  final Model name;

  const MyDetails({Key? key, required this.name});

  @override
  State<MyDetails> createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetails> {
  List<bool?> isCompleted = [];
  @override
  void initState() {
  super.initState();
  
  isCompleted = List.generate(
    widget.name.buildTextField.length,
    (index) => null,
  );
}
  Widget build(BuildContext context) {
    List<String> filteredBuildTextField =
        widget.name.buildTextField.where((value) => value.isNotEmpty).toList();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => MyTask(),
              ));
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Text(
              'Details',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Color(0xFF563267),
              ),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 192, 161, 214),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: filteredBuildTextField.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(elevation: 10,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                             
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            margin: EdgeInsets.symmetric(vertical: 8),
                            padding: EdgeInsets.all(12),
                            child: Text(
                              filteredBuildTextField[index],
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              Radio(value: true, groupValue: isCompleted[index]??false, onChanged: (value){
                                setState(() {
                                  isCompleted[index] = value!;
                                }
                                );
                              },activeColor: Colors.green,
                              ),Text('Completed',
                              style: TextStyle(color: Colors.green),),
                               Radio(value: false, groupValue: isCompleted[index]??false, onChanged: (value){
                                setState(() {
                                  isCompleted[index] = value!;
                                });
                              },activeColor: Colors.red,
                               ),Text('Not Completed',
                               style: TextStyle(color: Colors.red),),
                            ],
                             )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ), 
            Padding(
              padding: const EdgeInsets.only(bottom: 10),  
              child: ElevatedButton(
                onPressed: () {
                 
                }, 
                child: Text('Complete',
                style: TextStyle(color: Colors.green),), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
