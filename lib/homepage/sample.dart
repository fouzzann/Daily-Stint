
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class CircularImagePicker extends StatefulWidget {
  @override
  _CircularImagePickerState createState() => _CircularImagePickerState();
}

class _CircularImagePickerState extends State<CircularImagePicker> {
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: Color.fromARGB(255, 127, 107, 131),
            width: 5,
          ),
        ),
        child: _selectedImage != null
            ? ClipOval(
                child: Image.file(
                  _selectedImage!,
                  fit: BoxFit.cover,
                  height: 190,
                  width: 190,
                ),
              )
            : Center(
                child: Text(
                  'Tap to select image',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Circular Image Picker'),
      ),
      body: Center(
        child: CircularImagePicker(),
      ),
    ),
  ));
}
