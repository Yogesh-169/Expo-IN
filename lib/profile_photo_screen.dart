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




//
//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
//
// class EditProfilePage extends StatefulWidget {
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   File? _profileImage;
//   final _formKey = GlobalKey<FormState>();
//   String _name = '';
//   String _mobileNumber = '';
//   String _email = '';
//   DateTime _dob = DateTime.now();
//   String _gender = 'Male';
//
//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final image = await picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         _profileImage = File(image.path);
//       });
//     }
//   }
//
//   void _onSubmit() {
//     // TODO: Save the user's profile changes to the backend
//   }
//
//   Future<void> _pickDate() async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: _dob,
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//
//     if (pickedDate != null && pickedDate != _dob) {
//       setState(() {
//         _dob = pickedDate;
//       });
//     }
//   }
//
//   String _formattedDOB() {
//     return DateFormat('yyyy-MM-dd').format(_dob);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//         backgroundColor: Colors.amberAccent,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.all(20),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Container(
//                           height: 100,
//                           width: 100,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.grey, // Grey background around the notch
//                           ),
//                         ),
//                         CircleAvatar(
//                           radius: 50,
//                           backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
//                           child: _profileImage == null
//                               ? IconButton(
//                             onPressed: _pickImage,
//                             icon: Icon(Icons.add_a_photo),
//                           )
//                               : null,
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 30),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Name',
//                         hintText: 'Enter your name',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                       initialValue: _name,
//                       onChanged: (value) => _name = value,
//                     ),
//                     SizedBox(height: 25),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Mobile number',
//                         hintText: 'Enter your mobile number',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                       initialValue: _mobileNumber,
//                       onChanged: (value) => _mobileNumber = value,
//                       keyboardType: TextInputType.phone,
//                     ),
//                     SizedBox(height: 25),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         hintText: 'Enter your email',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                       initialValue: _email,
//                       onChanged: (value) => _email = value,
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                     SizedBox(height: 25),
//                     TextFormField(
//                       onTap: () {
//                         _pickDate(); // Call the _pickDate function when the text field is tapped
//                       },
//                       decoration: InputDecoration(
//                         labelText: 'Date of Birth',
//                         hintText: 'Select Date of Birth',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                       controller: TextEditingController(text: _formattedDOB()), // Display selected date in the text field
//                       readOnly: true, // Make the text field read-only
//                     ),
//                     SizedBox(height: 25),
//                     DropdownButtonFormField<String>(
//                       decoration: InputDecoration(
//                         labelText: 'Gender',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                       value: _gender,
//                       items: [
//                         DropdownMenuItem(
//                           child: Text('Male'),
//                           value: 'Male',
//                         ),
//                         DropdownMenuItem(
//                           child: Text('Female'),
//                           value: 'Female',
//                         ),
//                         DropdownMenuItem(
//                           child: Text('Other'),
//                           value: 'Other',
//                         ),
//                       ],
//                       onChanged: (value) => _gender = value!,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _onSubmit,
//             child: Text('Update Profile',style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20
//             )),
//             style: ElevatedButton.styleFrom(primary: Colors.amberAccent, minimumSize: Size(double.infinity, 60)),
//           ),
//         ],
//       ),
//     );
//   }
// }
