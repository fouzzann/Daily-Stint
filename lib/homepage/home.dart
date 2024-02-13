
import 'package:daily_stint_2/admin/categories.dart';
import 'package:daily_stint_2/diary/diary_interface.dart';
import 'package:daily_stint_2/homepage/ownTask/my_Task/addplan.dart';
import 'package:daily_stint_2/money_track/mt_home.dart';
import 'package:daily_stint_2/settings.dart/profile.dart';
import 'package:daily_stint_2/homepage/subtask.dart';
import 'package:daily_stint_2/homepage/ownTask/my_Task/mytask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyHome extends StatefulWidget {
  const MyHome({Key? key});

  @override
  State<MyHome> createState() => _MyHomeState();
  
  
}

class _MyHomeState extends State<MyHome> {

  
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE6D7F1), 
        appBar: AppBar(title: Text('Home',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500
        ),),
        centerTitle: true,
          leading: IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Profile()));
          }, icon: Icon(Icons.menu, 
          color:  Colors.white)),
          
          backgroundColor:  Color(0xFF563267),
        ),  
          
        body: SingleChildScrollView(
          child: Center(
            child: Column( 
              children: [SizedBox(
                height: 30,
              ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Categories()
                      ),
                    );
                  },
                  
                    /////////////// Admin//////////////////// 
                  child: Container(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: ScreenUtil().setWidth(47),
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
                
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyTask(),
                      ),
                    );
                  },
                    /////////////// Own Plan//////////////////// 
                  child:  Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 47, bottom: 100),
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
                
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => SubTask(),
                      ),
                    );
                  },
                  /////////////// SubTask//////////////////// 
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 47, top: 30),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 30, left: 70),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                size: 34,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Text(
                              ' Subtask',
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
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 98, 161, 212),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
        
                ////////////////////////////// MoneyManage////////////////////////////
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => MtHomeScreen(),
                      ),
                    );
                  },    
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 47, top: 30),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 30, left: 50),
                            child: Center(
                              child: Icon(
                                Icons.monetization_on_sharp,
                                size: 34,
                                color: Colors.white,
                              ),
                            ), 
                          ), 
                          
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Text(
                              ' Money Track',
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
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 113, 185, 116),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  
                ), 
                SizedBox(height: 30,),
                  GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => DiaryInterface(),
                      ),
                    );
                  },   
                  ////////////////////////////// My Diary ////////////////////////////
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 47, top: 30),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 30, left: 70),
                            child: Center(
                              child: Icon(
                                Icons.menu_book_outlined,
                                size: 34,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Text(
                              ' My Diary',
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
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  
                ),
                SizedBox(height: 30,)
              ]
            )
          ),
        ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom:13 ),
          child: ClipRRect(borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar( 
              backgroundColor: const Color.fromARGB(255, 219, 190, 224),
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() { 
                  _currentIndex = index;
                });
             
                // Navigate to the respective screen based on the tapped index 
                switch (index) {   
                  case 0:
             
                    break;
                  case 1:
                     Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AddPlan()));
                    break;
                  case 2:
                   Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Profile()));
                    break;
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_box_outlined), 
                  label: 'Add Plan',
                ), 
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',  
                ),
              ],
            ),
          ),
        ),
      
      ),
    );
  }
}