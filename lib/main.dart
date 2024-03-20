import 'package:flutter/material.dart';
import 'mobile_number_screen.dart';
import 'personal_info_screen.dart';
import 'profile_photo_screen.dart';
import 'business_conversion_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MobileNumberScreen(), // Start with MobileNumberScreen
    );
  }
}
