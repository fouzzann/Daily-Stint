import 'package:daily_stint_2/homepage/home.dart';
import 'package:daily_stint_2/settings.dart/profile.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
  
}

class _SearchState extends State<Search> {
   int _currentIndex = 0;
  @override
  Widget build(
    BuildContext context) {
    return SafeArea(
      child: Scaffold( backgroundColor: Color(0xFFE6D7F1),
        appBar: AppBar(backgroundColor: Color(0xFFE6D7F1),
          title: Text('Search'),
          centerTitle: true,
        ),
        
        body: SingleChildScrollView(
          child: Card(
            color: Color.fromARGB(255, 212, 197, 223),
            child: Container(
              height: 60,   
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextFormField(
                  decoration:InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search Plan',
                    suffix: Icon(Icons.search)
                  ),
                ),
              ),
            ),
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MyHome()));
                      break;
                    case 1:
                       
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
                    icon: Icon(Icons.search), 
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                  label: 'Settings',   
                  ),
                ],
              ),))
      ),
    );
  }
}