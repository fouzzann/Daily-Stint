

import 'package:daily_stint_2/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService{
  static Future<bool>isLoggedIn() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn')?? false;
  }
  
  static Future<void> setLoggedIn(bool value)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setBool(Save_Key_Name, true);
  }
}


