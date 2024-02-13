
import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/Hive/mt_db/mt_category_db.dart';
import 'package:daily_stint_2/money_track/add_transaction/add_transactios.dart';
import 'package:daily_stint_2/money_track/categories/cat_add_popup.dart';
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
        floatingActionButton: FloatingActionButton(backgroundColor: Color(0xFF563267),
          onPressed: (){
          if(selectedIndexNotifer.value == 0)
          {
             print('add tra ');
             Navigator.of(context).pushNamed(AddTransactions.routeName);
          }else{
             print('add cat');
             showCategoryAddPopup(context);
            //  final _sample = CategoryModel(
            //   name: 'Travel',
            //    type: CategoryType.expense,
            //     id: DateTime.now().microsecondsSinceEpoch.toString() 
            //   );
            //  CategoryDB().insertCategory(_sample);
          }
        
        },
        child: Icon(Icons.add,
        color: Colors.white,),
        ),  
      ),
    );
  }

 

  
}