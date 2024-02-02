
import 'dart:io';
import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/admin/categories.dart';
import 'package:flutter/material.dart';

class AdmDetails extends StatefulWidget {
  final Model Adm;
  const AdmDetails({Key? key, required this.Adm}) : super(key: key);

  @override
  State<AdmDetails> createState() => _AdmDetailsState();
}

class _AdmDetailsState extends State<AdmDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Categories()));
            },
            icon: Icon(Icons.arrow_back),  
          ),
          title: Text( widget.Adm.AdmTitile,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600, 
            color: Color.fromARGB(164, 0, 0, 0)
          ),),
          centerTitle: true,
        ),
        body: SingleChildScrollView( 
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 350, 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: FileImage(File(widget.Adm.AdmPhoto.toString())),
                      fit: BoxFit.cover,
                    ),
                  ),
                  
                ),
                SizedBox(height: 30,),
                Container(
                      decoration: BoxDecoration(
                      ),
                      child: Container(width: 350,
                        child: Text(
                          widget.Adm.AdmDescrption,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black),
                        ),
                      ),
                    ), 
                    SizedBox( 
                      height: 20,
                    ),
                    ElevatedButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Categories()));
                    }, child: Text('COMPLETED',
                    style: TextStyle(

                      color: 
                      Colors.green
                     ),),
                    ), 
                    SizedBox( 
                      height: 15,
                    ),
                    
              ],
            ),    
          ),
          
        ), 
      ),
    );
  }
}
