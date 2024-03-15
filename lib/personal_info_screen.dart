import 'package:flutter/material.dart';
import 'package:mainexpoin/profile_photo_screen.dart';

import 'business_conversion_screen.dart';

class PersonalInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Info'),
        backgroundColor: Colors.black, // Set app bar color to black
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.black), // Set label color to black
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0), // Rounded corners for the border
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black), // Set label color to black
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0), // Rounded corners for the border
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Address',
                labelStyle: TextStyle(color: Colors.black), // Set label color to black
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0), // Rounded corners for the border
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(),
            ), // Empty space to push button to the bottom
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePhotoSelector()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black87, // Set button color to shaded black
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Rounded corners for the button
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Continue',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
