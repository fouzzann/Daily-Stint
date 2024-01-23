


// import 'package:daily_stint_2/homepage/ownTask/2%20options/Custom.dart';
// import 'package:daily_stint_2/homepage/ownTask/2%20options/Day.dart';
// import 'package:flutter/material.dart';

// class Option extends StatefulWidget {
//   const Option ({Key? key});

//   @override
//   State<Option> createState() => _MyHomeState();
// }

// class _MyHomeState extends State<Option> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color(0xFFE6D7F1),
//         appBar: AppBar(
//           backgroundColor: Color(0xFFE6D7F1), 

//         ),
        
//         ////////////////////////////// day////////////////////////////
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 60, top: 35),
//             child: Column(
//               children: [Text('Select an a Option',
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.w900 ,
//                 color:Color.fromARGB(255, 108, 85, 119),
//               ),
//               ),SizedBox(
//                 height: 50,
//               ),
//                 GestureDetector(  onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Day()), // Replace YourNextScreen with the actual name of your next screen
//                 );
//               },
//                   child: Card(elevation: 10,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  
//                     child: Container(
//                       child: Center(
//                         child: Padding(
//                           padding: const EdgeInsets.only(right: 47,top:190),
//                           child: Text(
//                             '''
//            Day 
//                     ''',
                                  
//                             style: TextStyle(
//                               fontSize: 23,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                       height: 230,
//                       width: 290,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(40), 
//                         image: DecorationImage( 
//                           image: AssetImage('asset/istockphoto-1365619500-640x640.jpg'),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 ////////////////////////////// custom////////////////////////////
//                 SizedBox(
//                   height: 50,
//                 ),
//                 GestureDetector(  onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Custom()), // Replace YourNextScreen with the actual name of your next screen
//                 );
//               },
//                   child: Card(elevation: 10,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//                     child: Container(
//                       child: Center(
//                         child: Padding(
//                           padding: const EdgeInsets.only(right: 47,top:190),
//                           child: Text(
//                             '''
//          Custom 
//                         ''',
                                  
//                             style: TextStyle(
//                               fontSize: 23,
//                               fontWeight: FontWeight.w900,
//                               color: Colors.white
//                             ),
//                           ),
//                         ),
//                       ),
//                       height: 230,
//                       width: 290,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(40),
//                         image: DecorationImage(
//                           image: AssetImage('asset/cartoon-icon-calendar-3d-rendering-5416156.jpg'),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ), 
                  
                  
//                 ),
             
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
