

import 'package:daily_stint_2/money_track/mt_home.dart';
import 'package:flutter/material.dart';

class MtBottomNavigationBar extends StatelessWidget {
  const MtBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:MtHomeScreen.selectedIndexNotifer,
    builder: (BuildContext ctx, int updatedIndex, Widget?_){
      return  BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 170, 151, 184),
        selectedItemColor: Color.fromARGB(255, 109, 72, 126),
         
        currentIndex:updatedIndex,
        onTap:(newIndex) {
        MtHomeScreen.selectedIndexNotifer.value = newIndex;
      }, 
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled),
        label: 'Transactions'
        ),
        BottomNavigationBarItem(icon: Icon(Icons.category),
        label: 'Categories'
        )
      ]);
    },
    );
  }
}