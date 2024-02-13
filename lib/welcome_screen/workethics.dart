
import 'package:daily_stint_2/welcome_screen/LetsGo.dart';
import 'package:flutter/material.dart';

class EthicksPage  extends StatelessWidget {
  const EthicksPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Color(0xFFE6D7F1),
       body: 
       SingleChildScrollView(
         child: Column( 
          children: [
            Image.asset('asset/Work-ethics.png',
         ),
         SizedBox(
          height: 23,
         ),
         Text('Work Ethicks',
         
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
                 'Adhering to strong work ethics ',
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
                 'in your daily life ensures that ',
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
                 'approach each task with ',
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
                 'diligence, integrity, and a',
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
                 'commitment to excellence,',
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
                 'fostering personal and',
                 style: TextStyle(color: Color(0xFF563267),
                  fontSize: 23,
                  fontWeight: FontWeight.w500
                 ),
                 ),
               ),
             ),Container(
               child: Padding(
                 padding: const EdgeInsets.only(right:15),
                 child: Text(
                 'professional growth',
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
                MaterialPageRoute(builder: (context) => 
                LetsGoPage()),   
              );
            },
            child: Text('Next >', 
            style: TextStyle(
              color: Colors.white
            ),),
            backgroundColor:Color(0xFF563267)
                   ),
       
      
      ),
    )
    );
  }
}