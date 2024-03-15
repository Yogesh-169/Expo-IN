import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'business_conversion_screen.dart';

void main() {
  runApp(ProfilePhotoSelector());
}

class ProfilePhotoSelector extends StatefulWidget {
  @override
  _ProfilePhotoSelectorState createState() => _ProfilePhotoSelectorState();
}

class _ProfilePhotoSelectorState extends State<ProfilePhotoSelector> {
  File? _selectedImage;

  Future<void> _selectProfilePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _continueToDemoPage() {
    // Navigate to the demo page (placeholder for now)
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => BusinessConversionScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(vertical: 16), // Adjust vertical padding here
          ),
        ),
      ),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Profile Photo Selector'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _selectedImage == null
                      ? Text('No image selected.', style: TextStyle(color: Colors.black))
                      : CircleAvatar(
                    radius: 80,
                    backgroundImage: FileImage(_selectedImage!),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _selectProfilePhoto,
                    child: Text('Select Profile Photo'),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            width: double.infinity, // Set button width to screen width
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: _continueToDemoPage,
              child: Text('Continue'),
            ),
          ),
        ),
      ),
    );
  }
}
