

import 'package:daily_stint_2/homepage/ownTask/2%20options/Day.dart';
import 'package:daily_stint_2/homepage/ownTask/instru-custom.dart';
import 'package:flutter/material.dart';

class InstruDay   extends StatelessWidget {
  const InstruDay  ({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Color(0xFFE6D7F1),
       body: 
       SingleChildScrollView(
         child: Column( 
          children: [
            Image.asset('asset/istockphoto-1365619500-640x640.jpg',
         ),
         SizedBox( 
          height: 23,
         ),
         Text('Option Day',        
         style: TextStyle(color: Color(0xFF563267),
          fontWeight: FontWeight.w800, 
          fontSize: 40
         ),
         ),SizedBox(
          height: 80,
          ),
         Column(mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
               child: Padding(
                 padding: const EdgeInsets.only(right:15),
                 child: Text(''' 
    1. Tap the designated section to add\n         your plan.
    2. Enter your plan details for morning,\n        afternoon, and evening.
    3. Click "Submit" to proceed and\n        complete your day.

    That's it! Your day is now customized \n    according to your preferences with the\n           "Make Your Own Plane Time"
                 ''',
                 style: TextStyle(color: Color(0xFF563267),
                  fontSize: 20,
                  fontWeight: FontWeight.w500  
                 ),
                 ),
               ),
               
             ),       
           ],
         ),
         Padding(
               padding: const EdgeInsets.only(left: 290,top:40), 
               child: ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return Day();
                }));
               }, style: ButtonStyle(
                backgroundColor: 
                MaterialStateProperty.all<Color>(Color(0xFF563267))
                ),child: Text('NEXT',
                style: TextStyle(
                  color: Colors.white
                ),
                )), 
             )
          ],
         ),
       ),
      ),
    );
  }
}