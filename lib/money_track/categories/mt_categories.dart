import 'package:daily_stint_2/Hive/mt_db/mt_category_db.dart';
import 'package:daily_stint_2/homepage/home.dart';
import 'package:daily_stint_2/money_track/categories/Expense_list.dart';
import 'package:daily_stint_2/money_track/categories/income_list.dart';
import 'package:flutter/material.dart';

class MtCategories extends StatefulWidget {
  const MtCategories({super.key});

  @override
  State<MtCategories> createState() => _MtCategoriesState();
}

class _MtCategoriesState extends State<MtCategories>with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
  _tabController = TabController(length: 2, vsync: this);
  CategoryDB().refreshaUI();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFFE6D7F1),
      appBar: AppBar(leading: IconButton(onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MyHome()));
    }, icon: Icon(Icons.arrow_back,
    color: Colors.white,)),
      backgroundColor: Color(0xFF563267),
      title: Text('Categories',
       style: TextStyle(
        color: Colors.white
      ),),
      centerTitle: true,
    ),
      
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'INCOME',),
              Tab(text: 'EXPENSE',)
            ],
            ),
            Expanded(
              
              child: TabBarView(
                controller: _tabController,
                children: [
                IncomeCategoryList(),
                ExpenseCategoryList()
              ]),
            )
        ],
      )
    );
  }
}