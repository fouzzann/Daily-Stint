import 'package:daily_stint_2/authentication/login.dart';
import 'package:daily_stint_2/homepage/home.dart';
import 'package:daily_stint_2/homepage/ownTask/my_Task/search.dart';

import 'package:daily_stint_2/settings.dart/app_info.dart';
import 'package:daily_stint_2/admin/auth_admin.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
  
}

class _ProfileState extends State<Profile> {
  File? _selectedImage;
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  int _currentIndex = 0;
  @override    
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( backgroundColor: Color(0xFFE6D7F1),
        appBar: AppBar(backgroundColor: Color(0xFFE6D7F1),
          title: Text(''),
          centerTitle: true, 
        ), 
        body:       
         Center(
           child: Column(
             children: [
              SizedBox(
              height: 20,
             ),
              GestureDetector(onTap: _pickImage,
                child: Container(height: 200,
                   width: 200,
                   decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(100) ,
                    
                   ),   
                child: _selectedImage !=null?ClipOval(
                  child: Image.file(_selectedImage!,
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,),
                ):Center(
                child: Container(height: 200, 
                width: 200,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                  child: Image.asset('asset/icon.png',
                  fit: BoxFit.cover,
                  ),
                  
                    
                ),
                              ),  
                     ),
              ),
                   IconButton(onPressed: (){_pickImage(); }, icon:Icon(Icons.add_a_photo,size: 30,) ),
                   Container(
                    child: Column()
                    
                   ),
                   SizedBox(height: 20,),
                   GestureDetector(onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AppInfo()));},
                     child: Container( 
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(width: 10,),                           
                            IconButton(onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AppInfo()));}, icon: Icon(Icons.info),),
                            SizedBox(width: 10,),
                            Text('App Info',
                            style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                     ),
                   ),
                       SizedBox(height: 20,),
                   GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>LoginPage2()));},
                     child: Container( 
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(width: 10,), 
                           
                            IconButton(onPressed: (){}, icon:  Icon(Icons.person_pin),),
                            SizedBox(width: 10,),
                            Text('Admin',
                            style: TextStyle(fontSize: 16), )   
                          ],
                        ),
                      ),
                     ),
                   ),
                       SizedBox(height: 20,),
                   GestureDetector(onTap: (){},
                     child: Container( 
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(width: 10,),                           
                            IconButton(onPressed: (){
                             
                            }, icon: Icon(Icons.feedback), ),
                            SizedBox(width: 10,),
                            Text('Feed Back',
                            style: TextStyle(fontSize: 16), )  
                          ],
                        ), 
                      ),
                     ),
                   ), 
                   SizedBox(height: 20,),
                    GestureDetector(onTap: (){Logout(context);},
                      child: Container( 
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(width: 10,),
                            IconButton(onPressed: (){ Logout(context);}, icon: Icon(Icons.exit_to_app) ),
                            SizedBox(width: 10,),
                            Text('Log Out',
                            style: TextStyle(fontSize: 16), )  
                          ],
                        ), 
                      ),
                                         ),
                    ),
             ],
           ),
         ),
         bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom:13),
            child: ClipRRect(borderRadius: BorderRadius.circular(30),
              child: BottomNavigationBar( 
                backgroundColor: const Color.fromARGB(255, 219, 190, 224),
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() { 
                    _currentIndex = index;
                  });
               
                  // Navigate to the respective screen based on the tapped index 
                  switch (index) {   
                    case 0:
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MyHome()));
                      break;
                    case 1:
                       Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Search()));
                      break;
                    case 2:
                    //  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MyActivity()));  
                      break;
                  }
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search), 
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                  label: 'Settings',  
                  ),
                ],
              ),
            ),
            ),
            
        
      ),
    );
  }
   Logout(BuildContext ctx) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => LoginPage()), (route) => false);
   }
}