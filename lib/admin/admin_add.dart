import 'dart:io';
import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/admin/adm_categories.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}
class _AdminState extends State<Admin> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _PlanNameController = TextEditingController();
  TextEditingController _baseAddTask = TextEditingController();
  List<TextEditingController> _addedTextFieldControllers = [];
  TextEditingController _AdmPhoto= TextEditingController();
  TextEditingController _AdmTitle = TextEditingController();
  TextEditingController _AdmDescription = TextEditingController();
  File? _selectedImage;
  Future<bool> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _AdmPhoto.text = pickedFile.path;
      });
      return true;
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AdmCategories()));}, icon: Icon(Icons.arrow_back)),
        title: Text('Admin Module'),
      centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20,),
                GestureDetector(onTap: () async{
                  final isImageValid = await _pickImage();
                  if(_formKey.currentState!.validate()&& isImageValid){
                    AdminDatabase();
                  }
          
                  },
                  child: Container(
                    height: 250, 
                    width: 350,
                    decoration: BoxDecoration(                                   
                      borderRadius: BorderRadius.circular(25),     
                      color: Color.fromARGB(255, 204, 203, 203,),
                    ),                
                      child:_selectedImage!=null?Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)), 
                        child: Image.file(_selectedImage!,
                        fit: BoxFit.cover,                        
                        height:200,
                        width: 350),
                      ):Container(child: Center(child: Text('Tap To Add Photo')), 
                        height: 200,
                        width: 200,  
                      ),
                  ),
                ),
                SizedBox(height: 20,),
                Divider(thickness: 2,),
                SizedBox(height: 20,),
                Container(
                   height: 100,   
                  width: 350, 
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), 
                   color: Color.fromARGB(255, 204, 203, 203,),
                   
                  ),
                  child: Center(child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField( autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Title';
                            }
                            return null;
                          },
                      controller: _AdmTitle,
                      maxLines: null, 
                      decoration: InputDecoration(border: InputBorder.none,hintText: 'Tap To Add Title'), 
                    
                    ),
                  )),
                ),
                 SizedBox(height: 20,),
                 Divider(thickness: 2,),
                  SizedBox(height: 20,), 
                  Container(  
                    width: 350,
                    height: 700,
                    decoration: BoxDecoration(color: Color.fromARGB(255, 204, 203, 203,
                    ),borderRadius: BorderRadius.circular(25)) ,  
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Description';
                            }
                            return null; 
                          },
                        controller: _AdmDescription,
                        maxLines: null,
                        decoration: InputDecoration(border: InputBorder.none,hintText: 'Tap To Add Description'), 
                        
                      ),
                    ),          
                  ),
                     SizedBox(height: 10,),
                  Column(
                    children: [
                      ElevatedButton(onPressed: (){
                       Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AdmCategories()));
                       if( _formKey.currentState!.validate()){
                         AdminDatabase();
                       }
                      }, child: Text('Save'))
                    ],
                  ),
                  SizedBox(height: 10,),
              ],
            ),
          ), 
        ),
      ),
    );
  }
  void AdminDatabase()async{
    final myData = Model(
      // DiaryDate: _DiaryDateController.text.toString(),
       AdmPhoto: _AdmPhoto.text.toString(),
      AdmTitile: _AdmTitle.text.toString(),
      AdmDescrption: _AdmDescription.text.toString(),
      // AddDiary: _AddDiaryController.text.toString(),
      // DiaryName:_DiaryNameController.text.toString(),
      id: UniqueKey().toString(),
      baseAddTask: _baseAddTask.text.toString(),
      selectedDate: _dateController.text.toString(),
   
     planName: _PlanNameController.text.toString(),
      buildTextField: _addedTextFieldControllers.map((controller) => controller.text).toList());
    var box = await Hive.openBox<Model>('model');
    await box.add(myData);
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AdmCategories()));
   print(box);
  }
}