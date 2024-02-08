import 'package:daily_stint_2/diary/add_diary.dart';
import 'package:daily_stint_2/diary/saved_diary.dart';
import 'package:daily_stint_2/homepage/home.dart';
import 'package:flutter/material.dart';

class DiaryInterface extends StatefulWidget {
  const DiaryInterface({super.key});

  @override
  State<DiaryInterface> createState() => _DiaryInterfaceState();
}

class _DiaryInterfaceState extends State<DiaryInterface> {
  @override 
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Color(0xFFE6D7F1),
        appBar: AppBar(leading: IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MyHome()));
        }, icon: Icon(Icons.arrow_back,
        color: Colors.white,)),
          backgroundColor:  Color(0xFF563267), 
          title: Text('Diary', 
          style: TextStyle( 
            color: Colors.white,
            fontWeight:FontWeight.w500 
          ),),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Diary()));
              },
                child: Card(
                  elevation: 10,
                  child: Container(
                    
                   height: 200,
                   width: 300,
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                   image: DecorationImage(image: AssetImage('asset/Add Diary.jpg'),fit: BoxFit.fill ),
      
                   ),
                   
                  ),
                ),
              ),
              SizedBox( 
                height: 10, 
               ),
              Text('Create New Diary',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color:Color.fromARGB(255, 81, 32, 90)
              ),),
              SizedBox( 
                height: 50,
               ),
              Card(elevation: 10,
                child: GestureDetector(onTap: () {     
                   Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DiaryList()));
                },
                  child: Container(
                     height: 200,
                     width: 300,
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                     image: DecorationImage(image: AssetImage('asset/Saved Diary.png',),fit: BoxFit.fill ),
                     ),
                    ),
                    
                ),
              ),
              SizedBox( 
                height: 10, 
               ),
              Text('Saved Diary',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color:Color.fromARGB(255, 81, 32, 90)
              ),),
            ],
          ),
        ),
      ),
    );
  }
}