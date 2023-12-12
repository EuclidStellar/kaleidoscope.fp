// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class RegistrationScreen extends StatefulWidget {
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }

// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _sectionController = TextEditingController();
//   final TextEditingController _branchController = TextEditingController();
//   final TextEditingController _yearController = TextEditingController();
//   final TextEditingController _phoneNumberController = TextEditingController();
//   final TextEditingController _driveLinkController = TextEditingController();

//   final CollectionReference _chayan24Collection =
//       FirebaseFirestore.instance.collection('chayan24');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Event Registration'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             TextFormField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextFormField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'College Email'),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             TextFormField(
//               controller: _sectionController,
//               decoration: InputDecoration(labelText: 'Section'),
//             ),
//             TextFormField(
//               controller: _branchController,
//               decoration: InputDecoration(labelText: 'Branch'),
//             ),
//             TextFormField(
//               controller: _yearController,
//               decoration: InputDecoration(labelText: 'Year'),
//             ),
//             TextFormField(
//               controller: _phoneNumberController,
//               decoration: InputDecoration(labelText: 'Phone Number'),
//               keyboardType: TextInputType.phone,
//             ),
//             TextFormField(
//               controller: _driveLinkController,
//               decoration:
//                   InputDecoration(labelText: 'Drive Link (Previous Work)'),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 // Validate and process registration logic
//                 _register();
//               },
//               child: Text('Register'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _register() async {
//     // Implement your registration logic here
//     String name = _nameController.text;
//     String email = _emailController.text;
//     String section = _sectionController.text;
//     String branch = _branchController.text;
//     String year = _yearController.text;
//     String phoneNumber = _phoneNumberController.text;
//     String driveLink = _driveLinkController.text;

//     // Store data in Firestore
//     try {
//       await _chayan24Collection.add({
//         'name': name,
//         'email': email,
//         'section': section,
//         'branch': branch,
//         'year': year,
//         'phone': phoneNumber,
//         'drivelink': driveLink,
//         'timestamp': FieldValue.serverTimestamp(),
//       });

//       // Display a success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Registration successful!'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//     } catch (error) {
//       // Display an error message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error: $error'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//     }
//   }
// }



import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _driveLinkController = TextEditingController();

  final CollectionReference _chayan24Collection =
      FirebaseFirestore.instance.collection('chayan24');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'College Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              controller: _sectionController,
              decoration: InputDecoration(labelText: 'Section'),
            ),
            TextFormField(
              controller: _branchController,
              decoration: InputDecoration(labelText: 'Branch'),
            ),
            TextFormField(
              controller: _yearController,
              decoration: InputDecoration(labelText: 'Year'),
            ),
            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            TextFormField(
              controller: _driveLinkController,
              decoration:
                  InputDecoration(labelText: 'Drive Link (Previous Work)'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Validate and process registration logic
                _register();
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  void _register() async {
    // Implement your registration logic here
    String name = _nameController.text;
    String email = _emailController.text;
    String section = _sectionController.text;
    String branch = _branchController.text;
    String year = _yearController.text;
    String phoneNumber = _phoneNumberController.text;
    String driveLink = _driveLinkController.text;

    // Get the current user's UID
    String? uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) {
      print('User is not authenticated.');
      return;
    }

    // Store data in Firestore
    try {
      await _chayan24Collection.add({
        'uid': uid,
        'name': name,
        'email': email,
        'section': section,
        'branch': branch,
        'year': year,
        'phone': phoneNumber,
        'drivelink': driveLink,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Display a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration successful!'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (error) {
      // Display an error message
      print('Error during registration: $error');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error during registration. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
