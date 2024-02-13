import 'package:daily_stint_2/homepage/ownTask/my_Task/mytask.dart';
import 'package:flutter/material.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Column(
            children: [
              Icon(
                Icons.verified,
               color: Colors.white,
              size: 200,
              ),
              SizedBox(
                height: 40,
              ),
              Text('CONGRATULATIONS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w800
              ),
              ), 
              Text('YOU HAVE COMPLETED THE TASK  \n     keep going with our Daily Stint ',
              style: TextStyle(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 210),  
                child: ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MyTask()));
                }, child: Text('DONE',style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w700
                ),)),
              )
            ],  
          ),  
        ), 
      ),
    );
  }
}