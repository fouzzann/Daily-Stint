import 'dart:io';
import 'package:daily_stint_2/Hive/box.dart';
import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/admin/adm_details.dart';
import 'package:daily_stint_2/admin/admin_edit.dart';
import 'package:daily_stint_2/homepage/home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Categories extends StatefulWidget {
  const Categories ({super.key,}); 

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
 TextEditingController _AdmPhoto = TextEditingController();
  TextEditingController _AdmTitle = TextEditingController();
   TextEditingController _AdmDescription= TextEditingController();
  @override 
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MyHome()));
          } ,icon: Icon(Icons.arrow_back,
       )), 
          title: Padding(
          padding: const EdgeInsets.only(left:80),
          child: Text('Categories',
          style: TextStyle(fontSize: 25,
          fontWeight: FontWeight.w600, 
          ),
                       
          ),
        ),
          
        ),
        body:ValueListenableBuilder<Box<Model>>(valueListenable: Boxes.getData().listenable(), 
        builder: (context, box, _) { 
          var myData = box.values.toList().cast<Model>();
          return   Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 25.0,  
                    mainAxisExtent: 150    
                  ),
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AdmDetails(Adm: myData[index%myData.length])));
                    },   
                      child: Container(
                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: FileImage(File(myData[index].AdmPhoto.toString()),
                      ),
                      fit: BoxFit.cover,
                    
                      ),
                      
                       ),
                        child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Container(decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    spreadRadius: 3,
                                    blurRadius: 53,
                                    offset: Offset(0, 3)
                                  )
                                ]
                              ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(myData[index].AdmTitile,
                                  style: TextStyle(fontSize: 35,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black38),
                                  ),
                                ),
                              ),
                            ),                          
                          ],  
                        )
                      ),
                    );
                  },
            ),
          );  
        },
    ),
    
        
      ),
    );
  }
  
  Future<void>AdminEdit(
  Model updateModel2,
  String Photo,
  String Title,
  String Description
  )async{
    _AdmPhoto.text = Photo;
  _AdmTitle.text = Title;
  _AdmDescription.text = Description;
  
  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AdmEdit(updateModel2: updateModel2)));
  } 
}

