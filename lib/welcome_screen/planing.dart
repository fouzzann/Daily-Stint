
import 'package:daily_stint_2/welcome_screen/workethics.dart';
import 'package:flutter/material.dart';

class PlaningPage  extends StatelessWidget {
  const PlaningPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Color(0xFFE6D7F1),
       body: 
       SingleChildScrollView(
         child: Column(
          children: [
            Image.asset('asset/planing.png',
         ),
         SizedBox( 
          height: 23,
         ),
         Text('Planning',
         
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
                 'Take charge of your life by ',
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
                 'carefully planning and crafting',
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
                 'your own schedule, just like an',
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
                 'artisan shaping a masterpiece',
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
                 'or a pilot navigating their own',
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
                 'flight path.',
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
                MaterialPageRoute(builder: (context) => EthicksPage()),  
              );
            }, 
            child: Text('Next >', 
            style: TextStyle(
              color: Colors.white
            ),),
            backgroundColor:Color(0xFF563267)
                   ),
       
       
      
      ),
    ))
    ;
  }
}