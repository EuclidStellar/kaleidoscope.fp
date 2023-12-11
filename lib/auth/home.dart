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


