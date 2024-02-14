import 'dart:io';
import 'package:daily_stint_2/admin/categories.dart';
import 'package:flutter/material.dart';

class AdmDetails extends StatefulWidget {
  final Adm;
  const AdmDetails({Key? key, required this.Adm}) : super(key: key);

  @override
  State<AdmDetails> createState() => _AdmDetailsState();
}

class _AdmDetailsState extends State<AdmDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE6D7F1),
        appBar: AppBar(
          backgroundColor: Color(0xFF563267),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Categories()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text(
            widget.Adm.AdmTitile,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
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
                      decoration: BoxDecoration(),
                      child: Container(
                        width: 350,
                        child: Text(
                          widget.Adm.AdmDescrption,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.only(top: 600),
              child: Center(
                child: Positioned(
                  
                  bottom: 20,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF563267)),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Categories()));
                    },
                    child: Text(
                      'COMPLETED',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
