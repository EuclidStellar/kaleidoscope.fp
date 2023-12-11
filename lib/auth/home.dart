import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kaleidoscope_fp/auth/welcome.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                reverse: true,
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      // IconButton(
                      //   onPressed: () {
                      //     Navigator.pop(context);
                      //   },
                      //   icon: const Padding(
                      //     padding: EdgeInsets.only(left: 12.0),
                      //     child: Image(
                      //       image: AssetImage(
                      //         'assets/images/back_arrow.png',
                      //       ),
                      //       width: 30,
                      //       fit: BoxFit.scaleDown,
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   width: 40,
                      // ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 120.0),
                        child: Text(
                          'Blockchain\nResearch Lab',
                          style: TextStyle(
                            color: Color.fromARGB(255, 103, 150, 194),
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) =>
                                Welcome(), // Navigate to the welcome screen
                          ));
                        },
                        icon: Icon(Icons.exit_to_app), // Logout icon
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset('assets/images/img11.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ]))));
  }
}



// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:trainee_login/screens/welcome_screen.dart';
// import 'package:trainee_login/services/firebase_auth.dart'; // Import your welcome screen

// class HomeScreenPage extends StatelessWidget {
//  const HomeScreenPage({super.key, required String title});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text('Homepage'),
//         actions: [
//           IconButton(
//             onPressed: () {

               
//               // Add your logout logic here (e.g., sign out the user)
//               // For example, if you're using Firebase Authentication:
//               FirebaseAuth.instance.signOut();
//               Navigator.of(context).pushReplacement(MaterialPageRoute(
//                 builder: (context) => Welcome(), // Navigate to the welcome screen
//               ));
//             },
//             icon: Icon(Icons.exit_to_app), // Logout icon
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           reverse: true,
//           child: Column(
//             children: [
//               // Add your content here
//               const SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 child: Image.asset('assets/images/brlhome.png'),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

