



import 'package:flutter/material.dart';
import 'package:action_slider/action_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kaleidoscope_fp/auth/signup.dart';
import 'package:qr_flutter/qr_flutter.dart';

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

  ActionSliderController _actionSliderController =
      ActionSliderController(); // Create an instance of ActionSliderController

  bool _registrationSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            MySignUpTextField(
              hintText: 'Name',
              inputType: TextInputType.name,
              labelText2: 'Name',
              secure1: false,
              nameController: _nameController,
              capital: TextCapitalization.characters,
            ),

            SizedBox(height: 8),
            MySignUpTextField(
              hintText: 'Email',
              inputType: TextInputType.emailAddress,
              labelText2: 'College Email',
              secure1: false,
              nameController: _emailController,
              capital: TextCapitalization.none,
            ),
            SizedBox(height: 8),
            MySignUpTextField(
              hintText: 'Section',
              inputType: TextInputType.name,
              labelText2: 'Section',
              secure1: false,
              nameController: _sectionController,
              capital: TextCapitalization.words,
            ),
            SizedBox(height: 8),
            MySignUpTextField(
              hintText: 'Branch',
              inputType: TextInputType.name,
              labelText2: 'Branch',
              secure1: false,
              nameController: _branchController,
              capital: TextCapitalization.characters,
            ),
            SizedBox(height: 8),
            MySignUpTextField(
              hintText: 'Year',
              inputType: TextInputType.name,
              labelText2: 'Year',
              secure1: false,
              nameController: _yearController,
              capital: TextCapitalization.characters,
            ),
            SizedBox(height: 8),
            MySignUpTextField(
              hintText: 'Phone Number',
              inputType: TextInputType.phone,
              labelText2: 'Phone Number',
              secure1: false,
              nameController: _phoneNumberController,
              capital: TextCapitalization.none,
            ),
            SizedBox(height: 8),
            MySignUpTextField(
              hintText: 'Drive Link (Previous Work)',
              inputType: TextInputType.name,
              labelText2: 'Drive Link (Previous Work)',
              secure1: false,
              nameController: _driveLinkController,
              capital: TextCapitalization.characters,
            ),

            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ActionSlider.standard(
                controller: _actionSliderController,
                sliderBehavior: SliderBehavior.stretch,
                toggleColor: Colors.amber,
                loadingIcon: const Icon(Icons.refresh),
                successIcon: const Icon(
                  Icons.check,
                ),
                failureIcon: const Icon(Icons.close),
                slideAnimationCurve: Curves.easeOutCubic,
                loadingAnimationCurve: Curves.easeOutCubic,
                reverseSlideAnimationCurve: Curves.bounceIn,
                rolling: true,
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                child: _registrationSuccess
                    ? const Text(
                        'Registered Successfully!',
                        style: TextStyle(color: Colors.green),
                      )
                    : const Text(
                        'Slide to register',
                        style: TextStyle(color: Colors.white),
                      ),
                action: (controller) async {
                  controller.loading(); // starts loading animation
                  await Future.delayed(const Duration(seconds: 3));
                  _register();
                  _generateQRCode();
                  controller.success();
                  setState(() {
                    _registrationSuccess = true;
                  }); // starts success animation
                },
                // many more parameters
              ),
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
        const SnackBar(
          content: Text('Registration successful!'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (error) {
      // Display an error message
      print('Error during registration: $error');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error during registration. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _generateQRCode() async {
    // Get the current user's UID
    String? uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) {
      print('User is not authenticated.');
      return;
    }

    // Create QR code data (you can customize this based on your requirements)
    String qrData = 'User ID: $uid\nName: ${_nameController.text}\nEmail: ${_emailController.text}';

    // Generate QR code widget
   QrImageView(data: qrData, size: 200,);

    // Show dialog with QR code
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your Entry Ticket'),
          content: Container(
            child: Column(
              children: [
                  QrImageView(data: qrData, size: 200, padding: EdgeInsets.all(20),),
                const SizedBox(height: 16),
                const Text('Scan this QR code for entry'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );

    // Save QR code data to Firestore
    await FirebaseFirestore.instance.collection('qr_codes').doc(uid).set({
      'uid': uid,
      'qr_data': qrData,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}





// import 'package:flutter/material.dart';
// import 'package:action_slider/action_slider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:kaleidoscope_fp/auth/signup.dart';

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

//   ActionSliderController _actionSliderController =
//       ActionSliderController(); // Create an instance of ActionSliderController

//   bool _registrationSuccess = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Event Registration'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             MySignUpTextField(
//               hintText: 'Name',
//               inputType: TextInputType.name,
//               labelText2: 'Name',
//               secure1: false,
//               nameController: _nameController,
//               capital: TextCapitalization.characters,
//             ),

//             SizedBox(height: 8),
//              MySignUpTextField(
//               hintText: 'Email',
//               inputType: TextInputType.emailAddress,
//               labelText2: 'College Email',
//               secure1: false,
//               nameController: _emailController,
//               capital: TextCapitalization.none,
//             ),
//              SizedBox(height: 8),
//              MySignUpTextField(
//               hintText: 'Section',
//               inputType: TextInputType.name,
//               labelText2: 'Section',
//               secure1: false,
//               nameController: _sectionController,
//               capital: TextCapitalization.words,
//             ),
//              SizedBox(height: 8),
//              MySignUpTextField(
//               hintText: 'Branch',
//               inputType: TextInputType.name,
//               labelText2: 'Branch',
//               secure1: false,
//               nameController: _branchController,
//               capital: TextCapitalization.characters,
//             ),
//              SizedBox(height: 8),
//              MySignUpTextField(
//               hintText: 'Year',
//               inputType: TextInputType.name,
//               labelText2: 'Year',
//               secure1: false,
//               nameController: _yearController,
//               capital: TextCapitalization.characters,
//             ),
//              SizedBox(height: 8),
//              MySignUpTextField(
//               hintText: 'Phone Number',
//               inputType: TextInputType.phone,
//               labelText2: 'Phone Number',
//               secure1: false,
//               nameController: _phoneNumberController,
//               capital: TextCapitalization.none,
//             ),
//              SizedBox(height: 8),
//              MySignUpTextField(
//               hintText: 'Drive Link (Previous Work)',
//               inputType: TextInputType.name,
//               labelText2: 'Drive Link (Previous Work)',
//               secure1: false,
//               nameController: _driveLinkController,
//               capital: TextCapitalization.characters,
//             ),

//             const SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ActionSlider.standard(
//                 controller: _actionSliderController,
//                 sliderBehavior: SliderBehavior.stretch,
//                 toggleColor: Colors.amber,
//                 loadingIcon: const Icon(Icons.refresh),
//                 successIcon: const Icon(
//                   Icons.check,
//                 ),
//                 failureIcon: const Icon(Icons.close),
//                 slideAnimationCurve: Curves.easeOutCubic,
//                 loadingAnimationCurve: Curves.easeOutCubic,
//                 reverseSlideAnimationCurve: Curves.bounceIn,
//                 rolling: true,
//                 backgroundColor: const Color.fromARGB(255, 0, 0, 0),
//                 child: _registrationSuccess
//                     ? const Text(
//                         'Registered Successfully!',
//                         style: TextStyle(color: Colors.green),
//                       )
//                     : const Text(
//                         'Slide to register',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                 action: (controller) async {
//                   controller.loading(); // starts loading animation
//                   await Future.delayed(const Duration(seconds: 3));
//                   _register();
                 
//                   controller.success();
//                    setState(() {
//                     _registrationSuccess = true;
//                   }); // starts success animation
//                 },
//                 // many more parameters
//               ),
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

//     // Get the current user's UID
//     String? uid = FirebaseAuth.instance.currentUser?.uid;

//     if (uid == null) {
//       print('User is not authenticated.');
//       return;
//     }

//     // Store data in Firestore
//     try {
//       await _chayan24Collection.add({
//         'uid': uid,
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
//         const SnackBar(
//           content: Text('Registration successful!'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//     } catch (error) {
//       // Display an error message
//       print('Error during registration: $error');

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Error during registration. Please try again.'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//     }
//   }
// }

