
import 'package:daily_stint_2/homepage/home.dart';
import 'package:flutter/material.dart';

class LetsGoPage  extends StatelessWidget {
  const LetsGoPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Color(0xFFE6D7F1),
       body: 
       SingleChildScrollView(
         child: Column( 
          children: [
            Image.asset('asset/step.jpg',
         ),
         SizedBox(
          height: 23,
         ),
         Text("Let's go..!",
         
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
                 'Take the first step towards',
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
                 'success by beginning your ',
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
                 'journey with us, where you ',
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
                 'have the opportunity to shape ',
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
                 'your own path and achieve the ',
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
                 'success you desire',
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
                MaterialPageRoute(builder: (context) => MyHome()),  
              );
            },
            child: Text('Go >',  
            style: TextStyle(
              color: Colors.white
            ),),
            backgroundColor:Color(0xFF563267)
                   ),
       
      
      ),
    ));
  }
}