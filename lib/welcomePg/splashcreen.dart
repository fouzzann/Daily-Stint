import 'dart:async';

import 'package:daily_stint_2/homepage/home.dart';
import 'package:daily_stint_2/main.dart';
import 'package:daily_stint_2/welcomePg/welcomscrn.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  
  State<splashScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    Timer(Duration(seconds: 3),(){
      checkLoginStatus();
    });
  
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    });
  }

  Future<void> checkLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool(Save_Key_Name);
    if (isLoggedIn == null || isLoggedIn == false) {
      // Do nothing or add additional logic if needed
    } else {
       
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => MyHome()),
      );
    }
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/Screenshot 2024-01-05 143830.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
