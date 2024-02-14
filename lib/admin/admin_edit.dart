import 'dart:io';
import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/admin/adm_categories.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdmEdit extends StatefulWidget {
  final Adm updateModel2;
const AdmEdit({super.key, required this.updateModel2});
  @override
  
  State<AdmEdit> createState() => _AdmEditState();
}

class _AdmEditState extends State<AdmEdit> {
  @override
  void initState() {
   _AdmPhoto.text = widget.updateModel2.AdmPhoto;
   _AdmTitle.text = widget.updateModel2.AdmTitile;
   _AdmDescription.text = widget.updateModel2.AdmDescrption;
    super.initState();
  }
  TextEditingController _AdmPhoto= TextEditingController();
  TextEditingController _AdmTitle = TextEditingController();
  TextEditingController _AdmDescription = TextEditingController();
  File? _selectedImage;
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _AdmPhoto.text = pickedFile.path;
      });
    }
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
          child: Column(
            children: [SizedBox(height: 20,),
              GestureDetector(onTap: (){_pickImage();},
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
                 height: 70, 
                width: 350, 
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), 
                 color: Color.fromARGB(255, 204, 203, 203,),
                 
                ),
                child: Center(child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      validator:(Value){
                            if(Value == null|| Value.isEmpty){
                              return "Please Enter Your Plan Name";
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
                    child: TextFormField(  validator:(Value){
                            if(Value == null|| Value.isEmpty){
                              return "Please Enter Your Plan Name";
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
                    ElevatedButton(onPressed: ()async{
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AdmCategories()));
                   widget.updateModel2.AdmPhoto = _AdmPhoto.text.toString();
                   widget.updateModel2.AdmTitile = _AdmTitle.text.toString();
                   widget.updateModel2.AdmDescrption = _AdmDescription.text.toString();
                    }, child: Text('Update'))
                  ],
                ),
                SizedBox(height: 10,),
            ],
          ), 
        ),
      ),
    );
  }
  
}