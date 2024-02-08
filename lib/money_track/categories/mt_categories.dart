import 'package:flutter/material.dart';

class MtCategories extends StatefulWidget {
  const MtCategories({super.key});

  @override
  State<MtCategories> createState() => _MtCategoriesState();
}

class _MtCategoriesState extends State<MtCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Color(0xFF563267),
      title: Text('Categories',
       style: TextStyle(
        color: Colors.white
      ),),
      centerTitle: true,
    ),
      
      body: Center(child: Text('')),
    );
  }
}