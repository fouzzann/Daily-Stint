
import 'package:daily_stint_2/welcome_screen/planing.dart';
import 'package:flutter/material.dart';

class WelcomePage  extends StatelessWidget {
  const WelcomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Color(0xFFE6D7F1),
       body: 
       SingleChildScrollView(
         child: Column(
          children: [
            Image.asset('asset/work.png',
         ),
         SizedBox(
          height: 23,
         ),
         Text('WELCOME',
         
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
                 child: Text(
                 'With limited time at our',
                 style: TextStyle(color: Color(0xFF563267),
                  fontSize: 23,
                  fontWeight: FontWeight.w500
                 ),
                 ),
               ),
               
             ),
             Container(
               child: Padding(
                 padding: const EdgeInsets.only(right:15),
                 child: Text(
                 'disposal, it becomes',
                 style: TextStyle(color: Color(0xFF563267),
                  fontSize: 23,
                  fontWeight: FontWeight.w500
                 ),
                 ),
               ),
             ),
              Container(
               child: Padding(
                 padding: const EdgeInsets.only(right:15),
                 child: Text(
                 ' imperative to prioritize',
                 style: TextStyle(color: Color(0xFF563267),
                  fontSize: 23,
                  fontWeight: FontWeight.w500
                 ),
                 ),
               ),
             ),
             Container(
               child: Padding(
                 padding: const EdgeInsets.only(right:15),
                 child: Text(
                 'tasks wisely, making each',
                 style: TextStyle(color: Color(0xFF563267),
                  fontSize: 23,
                  fontWeight: FontWeight.w500
                 ),
                 ),
               ),
             ),
             Container(
               child: Padding(
                 padding: const EdgeInsets.only(right:15),
                 child: Text(
                 'moment count in our ',
                 style: TextStyle(color: Color(0xFF563267),
                  fontSize: 23,
                  fontWeight: FontWeight.w500
                 ),
                 ),
               ),
             ),
              Container(
               child: Padding(
                 padding: const EdgeInsets.only(right:15),
                 child: Text(
                 'pursuit of goals and',
                 style: TextStyle(color: Color(0xFF563267),
                  fontSize: 23,
                  fontWeight: FontWeight.w500
                 ),
                 ),
               ),
             ),
             Container(
               child: Padding(
                 padding: const EdgeInsets.only(right:15),
                 child: Text(
                 'fulfillment  ',
                 style: TextStyle(color: Color(0xFF563267),
                  fontSize: 23,
                  fontWeight: FontWeight.w500
                 ),
                 ),
               ),
             ),
             
             
           ],
         ),         
          ],
         ),
       ),
         floatingActionButton: Container(
          height: 35,
          width: 80,
           child: FloatingActionButton(
            onPressed: () {
               
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlaningPage()), 
              );
            },
            child: Text('Start >',
            style: TextStyle(
              color: Colors.white
            ),),
            backgroundColor:Color(0xFF563267)
                   ),
         ),
      
      ),
    );
  }
}