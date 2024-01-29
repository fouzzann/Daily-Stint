import 'package:daily_stint_2/categories/hydrate.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(  backgroundColor: Color(0xFFE6D7F1), 
        appBar: AppBar(
          title: Text("Categories",
           style: TextStyle(fontSize: 25,
          fontWeight: FontWeight.w600, 
          color:  Color.fromARGB(255, 38, 6, 80),), 
       
          ),centerTitle: true,
           backgroundColor: Color.fromARGB(255, 193, 168, 211), 
        ),
       body: Center( 
         child: Column(
          children: [SizedBox(
            height: 23,
          ),
            ////////////////// Hydrate://////////////////////////
            GestureDetector(onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Hydrate()));
            },
              child: Card
              (elevation: 10,
                color: Color.fromARGB(255, 205, 186, 219),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ), 
                  height: 100,
                  width: 390,
                   
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
             ////////////////// Morning Exercise://////////////////////////
            Card(elevation: 10,
              color: Color.fromARGB(255, 205, 186, 219),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ), 
                height: 100,
                width: 390,
                 
              ),
            ),
            SizedBox(
              height: 10,
            ),
              ////////////////// Healthy Breakfast://////////////////////////
            Card(elevation: 10,
              color: Color.fromARGB(255, 205, 186, 219),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ), 
                height: 100,
                width: 390,
                 
              ),
            ),
            SizedBox(
              height: 10,
            ),
             ////////////////// Mindfulness or Meditation://////////////////////////
            Card(elevation: 10,
              color: Color.fromARGB(255, 205, 186, 219),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ), 
                height: 100,
                width: 390,
                 
              ),
            ),
            SizedBox(
              height: 10,
            ),
             ////////////////// Read or Learn://////////////////////////
            Card(elevation: 10,
              color: Color.fromARGB(255, 205, 186, 219),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ), 
                height: 100,
                width: 390,
                 
              ),
            ),
            SizedBox(
              height: 10,
            ),
             //////////////////Set Goals for the Day://////////////////////////
            Card(elevation: 10,
              color: Color.fromARGB(255, 205, 186, 219),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ), 
                height: 100,
                width: 390,
                 
              ),
            ),
            SizedBox( 
              height: 10,
            ),
          ], 
         ),
       ),
      ), 
    );
  }
}