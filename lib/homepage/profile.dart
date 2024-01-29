import 'package:daily_stint_2/homepage/home.dart';
import 'package:daily_stint_2/homepage/ownTask/my_Task/search.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 0;
  @override    
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( backgroundColor: Color(0xFFE6D7F1),
        appBar: AppBar(backgroundColor: Color(0xFFE6D7F1),
          title: Text('Profile'),
          centerTitle: true, 
        ),
        body: SingleChildScrollView(child: Container()),
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MyHome()));
                      break;
                    case 1:
                       Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Search()));
                      break;
                    case 2:
                    //  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MyActivity()));  
                      break;
                  }
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search), 
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',   
                  ),
                ],
              ),
            ))
        
      ),
    );
  }
}