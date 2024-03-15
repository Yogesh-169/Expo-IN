import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'personal_info_screen.dart'; // Import the personal info screen

class MobileNumberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile Number'),
        backgroundColor: Colors.black, // Set app bar color to black
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ExpoIn',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Set text color to black
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Enter your number to get started!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Some small text about ExpoIn.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Enter your mobile number',
                  border: OutlineInputBorder(),
                ),
                initialCountryCode: 'IN', // Initial country code
                onChanged: (phone) {
                  print(phone.completeNumber); // Callback to get complete number
                },
              ),
            ),
          ),
          Container(
            width: double.infinity, // Stretch to full width
            margin: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PersonalInfoScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                primary: Colors.black87, // Set button color to shaded black
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
