
import 'package:daily_stint_2/authentication/login.dart';
import 'package:daily_stint_2/homepage/subtask.dart';
import 'package:daily_stint_2/homepage/diary.dart';
import 'package:daily_stint_2/homepage/ownTask/mytask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  // Future<void>_conformLogout() async{
  //   return showDialog(
  //     context: context,
  //      builder: (BuildContext context){
  //       return AlertDialog(
  //         title: Text('LogOut'), 
  //         content: Text('Are you sure you want to logout?',
  //         style: TextStyle(
  //           fontSize: 18   
  //         ),
  //         ),  
  //         actions: [
  //           TextButton(onPressed: 
  //           (){
  //             Navigator.of(context).pop(false);
  //           }, child: Text('Cancel'),
  //           ),
  //           TextButton(onPressed: (){
  //             Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>LoginPage()), (route) => false);
  //           },
  //            child: Text('Logout',
  //            style: TextStyle(
  //             color: Colors.red
  //            ),))
  //         ],
  //       );
  //      }
  //     );
  //
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE6D7F1),
        appBar: AppBar(
          backgroundColor: Color(0xFFE6D7F1),

        ),
        drawer: Drawer(backgroundColor:const Color.fromARGB(255, 204, 179, 247),
          child: ListView(
            children: [
  CircleAvatar(
    radius: 100,
    backgroundColor: Colors.transparent,
    child: Container(
      width: 150,
      height: 150, 
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('asset/download.jpeg'),
        ),
      ),
    ),
  ),
  Column(
    children: [
   
        
       Text('user',
        style: TextStyle(fontSize: 23),),
      
    ],
  ),
  ListTile(
    onTap: (){},
    leading: Icon(Icons.person),
    title: Text('Account',
    style: TextStyle(
      fontWeight: FontWeight.w500
    ),
    ),
  ),
   ListTile(
    onTap: (){},
    leading: Icon(Icons.settings),
    title: Text('Settings', 
    style: TextStyle(
      fontWeight: FontWeight.w500
    ),
    ),
  ),
   ListTile(
    onTap: (){},
    leading: Icon(Icons.info),
    title: Text('App info',
    style: TextStyle(
      fontWeight: FontWeight.w500
    ),
    ),
  ),
   ListTile(
    onTap: (){},
    leading: Icon(Icons.list_alt_rounded),
    title: Text('My activity',
    style: TextStyle(
      fontWeight: FontWeight.w500
    ),
    ),
    
  ),
      ListTile(
    onTap: (){ 
    },
    leading: Icon(Icons.person_pin),
    title: Text('Admin Module',
    style: TextStyle(
      fontWeight: FontWeight.w500
    ),
    ),
  ),
    ListTile(
    onTap: (){
     Logout(context);
    },
    leading: Icon(Icons.exit_to_app),
    title: Text('LogOut',
    style: TextStyle(
      fontWeight: FontWeight.w500
    ),
    ),
  ),
   
],

          ),
          
        ),
        ////////////////////////////// Admin////////////////////////////
        body: SingleChildScrollView(
          child: Center(
            child: Column( 
              children: [
                GestureDetector(  onTap: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyTask()), // Replace YourNextScreen with the actual name of your next screen
                );
                // right: 47,top:30
              },
                  child: Container(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(right:  ScreenUtil().setWidth(47),
                        top: ScreenUtil().setHeight(30),
                        ),
                        child: Text(
                          '''
          Let's Start your
            Journey With 
              Daily Stint 
                    ''',
                                
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    height: 160,
                    width: 290,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage( 
                        image: AssetImage('asset/home screen.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                ////////////////////////////// Own plan////////////////////////////
                SizedBox(
                  height: 30,
                ),
                GestureDetector(  onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyTask(),
                   ) // Replace YourNextScreen with the actual name of your next screen
                );
              },
                  child: Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 47,bottom:100),
                        child: Text(
                          '''
          Make Own Plan 
                        ''',
                                
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF563267),
                          ),
                        ),
                      ),
                    ),
                    height: 160,
                    width: 290,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage('asset/planing.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ), 
                  
                  
                ),
                ////////////////////////////// subtask////////////////////////////
                SizedBox(
                  height: 30,
                ),
                GestureDetector(onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                    return SubTask();
                  }));
                },
                  child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 47,top:30),
                    
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30,left:70),                        child: Center(
                            child: Icon(Icons.add,
                            size: 34,
                            color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom:25),
                          child: Text(
                            ' Subtask' 
                          ,
                                  
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ], 
                    ),
                  ),
                  height: 90,
                  width: 290,
                  decoration: BoxDecoration(color: Colors.green,
                    borderRadius: BorderRadius.circular(20), 
                    ),
                  ),
                ),
            
            ////////////////////////////// my diary////////////////////////////
                SizedBox(
                  height: 30,
                ),
                 GestureDetector(onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                    return Diary();
                  }));
                },
                  child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 47,top:30),
                    
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30,left:70),                        child: Center(
                            child: Icon(Icons.menu_book_outlined,
                            size: 34,
                            color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom:25),
                          child: Text(
                            ' My Diary' 
                          ,
                                  
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ], 
                    ), 
                  ),
                 height: 90,
                  width: 290,
                  decoration: BoxDecoration(color: Colors.grey,
                    borderRadius: BorderRadius.circular(20), 
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
 Logout(BuildContext ctx)async{
  final SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.clear();
     
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>LoginPage()), (route) => false);
 } 
 
}
