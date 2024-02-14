
import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/diary/saved_diary.dart';
import 'package:flutter/material.dart';

class DiaryDetails extends StatefulWidget {
  final DrModel Diary;
  const DiaryDetails({Key? key, required this.Diary}) : super(key: key);

  @override
  State<DiaryDetails> createState() => _DiaryDetailsState();
}

class _DiaryDetailsState extends State<DiaryDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => DiaryList()));
            },
            icon: Icon(Icons.arrow_back),  
          ),
           
          centerTitle: true,
        ),
        body: SingleChildScrollView( 
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(
                  child: Container(
                    child: Text(widget.Diary.DiaryName,
                  style: TextStyle(
                    fontSize: 40, 
                    fontWeight: FontWeight.w500,
                    color: Colors.black38
                  ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5, 
                ),
                Container(
                  child: Text(widget.Diary.DiaryDate, 
                style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(255, 70, 69, 69),
                  fontWeight: FontWeight.w500
                ),
                  ), 
                ),
                SizedBox(
                  height: 40,
                ),
            Card(elevation: 10,
              child: Padding(
                
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.Diary.AddDiary, 
                                  style: TextStyle(
                                    fontSize: 20
                                  ),
                                    ),
              ),
            ),
                    
              ],
            ),    
          ),
          
        ), 
      ),
    );
  }
}
