import 'package:flutter/material.dart';
import 'CustomeNavigation.dart';

class BusinessConversionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Set app bar color to black
        title: Text('Business Conversion'),
        actions: [
          TextButton(
            onPressed: () {
              // Navigate to Home1 when Skip is pressed
              Navigator.push(context, MaterialPageRoute(builder: (context) => CustomNavigationPanel()));
            },
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter Site URL:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'https://example.com',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Enter Phone Number:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: '123-456-7890',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Spacer(), // Added Spacer widget to push button to bottom
            ElevatedButton(
              onPressed: () {
                // Logic for continue
              },
              child: Text('Agree & Complete'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
                primary: Colors.black, // Set button background color to black
              ),
            ),
          ],
        ),
      ),
    );
  }
}
