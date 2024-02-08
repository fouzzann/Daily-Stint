import 'dart:ffi';

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
        selectedItemColor: Color(0xFF563267),
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