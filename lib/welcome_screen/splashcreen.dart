import 'dart:async';

import 'package:daily_stint_2/homepage/home.dart';
import 'package:daily_stint_2/main.dart';
import 'package:daily_stint_2/welcome_screen/welcomscrn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

const Save_Key_Name = "isLoggedIn";

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    // Simulating some initialization or loading time
    await Future.delayed(Duration(seconds: 3));  

    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool(Save_Key_Name);
    if (isLoggedIn == null || isLoggedIn == false) {
      // User is not logged in, navigate to the welcome screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    } else {
      // User is logged in, navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => MyHome()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/Screenshot 2024-01-05 143830.png'),
            fit: BoxFit.cover,
          ),
        ),
        
        child: Padding(
          padding: const EdgeInsets.only(top: 270),
          child: SpinKitFadingCircle(  
            color: Colors.purple, 
            size: 56.0,
            
          ),
        ),
        
      ),
    );
  }
} 
