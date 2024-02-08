

import 'package:daily_stint_2/money_track/categories/mt_categories.dart';
import 'package:daily_stint_2/money_track/transactions/mt_transactions.dart';
import 'package:daily_stint_2/money_track/mt_widgets.dart';
import 'package:flutter/material.dart';

class MtHomeScreen extends StatelessWidget {
   MtHomeScreen({super.key});
 static ValueNotifier<int> selectedIndexNotifer = ValueNotifier(0);
  final _pages = const [
   MtTransaction(),
   MtCategories(),
  ];
   
  @override   
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: MtBottomNavigationBar(),
        body: ValueListenableBuilder(valueListenable:selectedIndexNotifer, 
        builder: (BuildContext context,int updatedIndex, _) {
          return _pages[updatedIndex];
        }, 
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          if(selectedIndexNotifer.value == 0)
          {
             print('add tra ');
          }else{
             print('add cat');
          }
        
        },
        child: Icon(Icons.add),
        ),  
      ),
    );
  }

 

  
}