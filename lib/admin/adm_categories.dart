import 'dart:io';
import 'package:daily_stint_2/Hive/box.dart';
import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/admin/admin_add.dart';
import 'package:daily_stint_2/admin/admin_edit.dart';
import 'package:daily_stint_2/homepage/home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class AdmCategories extends StatefulWidget {
  const AdmCategories ({super.key,}); 

  @override
  State<AdmCategories> createState() => _AdmCategoriesState();
}

class _AdmCategoriesState extends State<AdmCategories> {
 TextEditingController _AdmPhoto = TextEditingController();
  TextEditingController _AdmTitle = TextEditingController();
   TextEditingController _AdmDescription= TextEditingController();
  @override 
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor:  Color(0xFFE6D7F1),
        appBar: AppBar(backgroundColor:   Color(0xFF563267),
          leading: IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MyHome()));
          } ,icon: Icon(Icons.arrow_back,
          color: Colors.white,
       )), 
          title: Text('Categories',
          style: TextStyle(fontSize: 25,
          fontWeight: FontWeight.w600, 
          color: Colors.white
          ), 
          ),
          centerTitle:true
          
        ),
        body:ValueListenableBuilder<Box<Adm>>(valueListenable: Boxes3.getData().listenable(), 
        builder: (context, box, _) { 
          var myData = box.values.toList().cast<Adm>();
          if (myData.isEmpty) {
            return Center(
              child: Text(
                'No categories were not added .',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(onTap: (){
                      AdminEdit(
                              myData[index], 
                               myData[index].AdmPhoto.toString(),
                                  myData[index].AdmTitile.toString(),
                                   myData[index].AdmDescrption.toString() );
                    },
                      child: Container(
                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: FileImage(File(myData[index].AdmPhoto.toString()),
                      ),
                      fit: BoxFit.cover)
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
                                    blurRadius: 10,
                                    offset: Offset(0, 3)
                                  )
                                ]
                              ),
                                child: Text(myData[index].AdmTitile, 
                                style: TextStyle(fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: Colors.black87
                                ),
                                
                                ),
                              ),
                            ),  
                             
                            TextButton(onPressed: (){delete(myData[index]);}, child: Icon(Icons.delete,color: Colors.red,))
                          ],
                        )
                      ),
                    );
                  },
            ),
          );  
        },
              ),
              floatingActionButton: FloatingActionButton(backgroundColor:  Color(0xFF563267),
                onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Admin()));
              },child: Icon(Icons.add,
              color: Colors.white,),),
        
      ),
    );
  }
  void delete(Model)async{ 
    await Model.delete();
  }
  Future<void>AdminEdit(
  Adm updateModel2,
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
