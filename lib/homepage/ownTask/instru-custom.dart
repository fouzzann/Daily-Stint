

// import 'package:daily_stint_2/homepage/ownTask/2%20options/2option.dart';
// import 'package:flutter/material.dart';

// class InstruCustom   extends StatelessWidget {
//   const InstruCustom  ({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(backgroundColor: Color(0xFFE6D7F1),
//        body: 
//        SingleChildScrollView(
//          child: Column(
//           children: [
//             Image.asset('asset/cartoon-icon-calendar-3d-rendering-5416156.jpg', 
//          ),
//          SizedBox(  
//           height: 23,
//          ),
//          Text('Option Custom',        
//          style: TextStyle(color: Color(0xFF563267),
//           fontWeight: FontWeight.w800, 
//           fontSize: 40
//          ),
//          ),SizedBox(
//           height: 50,
//           ),
//          Column(mainAxisAlignment: MainAxisAlignment.center,
//            children: [
//              Container(
//                child: Padding(
//                  padding: const EdgeInsets.only(right:15),
//                  child: Text(''' 
//       "Embark on intentional living with our\n      enabling meticulous day and long-term \n  planning. Customize your journey in just\n                                3 steps:

//       1. Click to arrange and add your plan. 
//       2. Select start and end dates. 
//       3. Add plans for a minimum one-week\n          duration.

//           Craft a purpose-driven life with\n      personalized roadmaps. Start shaping \n                      your days today!"
//     ''',
//                  style: TextStyle(color: Color(0xFF563267),
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500  
//                  ),
//                  ),
//                ),
               
//              ),       
//            ],
//          ),
//          Padding(
//                padding: const EdgeInsets.only(left: 290,top:10), 
//                child: ElevatedButton(onPressed: (){
//                 Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
//                   return Option();
//                 }));
//                }, style: ButtonStyle(
//                 backgroundColor: 
//                 MaterialStateProperty.all<Color>(Color(0xFF563267))
//                 ),child: Text('NEXT',
//                 style: TextStyle(
//                   color: Colors.white
//                 ),
//                 )), 
//              )
//           ],
//          ),
//        ),
//       ),
//     );
//   }
// }