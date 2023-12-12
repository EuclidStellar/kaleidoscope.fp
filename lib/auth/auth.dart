
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kaleidoscope_fp/auth/home.dart';
import 'package:kaleidoscope_fp/utils/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  // Starting error handling if any !

// Email Sign up

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await sendEmailverifcation(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'The account already exists for that email.');
      }

      
    }
  }


  // saving user data 

  //  Future<void> storeUserDataInFirestore({
  //   required String uid,
  //   required String name,
  //   required String email,
  //   required String phone,
  // }) async {
  //   await FirebaseFirestore.instance.collection('users').doc(uid).set({
  //     'name': name,
  //     'email': email,
  //     'phone': phone,
  //   });
  // }

  Future<void> storeUserDataInFirestore({
  required String uid,
  required String name,
  required String email,
  required String phone,
   required BuildContext context,
}) async {
  try {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'name': name,
      'email': email,
      'phone': phone,
    });

    // Send email verification
    await sendEmailverifcation(context); // You need to implement this function

  } catch (e) {
    // Handle Firestore errors
    print('Error storing user data in Firestore: $e');
    // You can add additional error handling or show a snackbar
    throw e; // Rethrow the exception if needed
  }
}


  Future<void> emailLogin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (_auth.currentUser!.emailVerified) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login successful'),
          ),
        );

        await saveUserLoginStatus(true);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                const HomeScreenPage(title: 'Homepage'),
          ),
        );
      } else {
        showSnackBar(context, 'Please verify your email');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'A link is sent to your email. Please verify your email address to continue',
            ),
            duration: Duration(seconds: 5),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong password provided for that user.');
      } else if (e.code == 'invalid-email') {
        showSnackBar(context, 'Email is Invalid ');
      } else if (e.code == 'user-disabled') {
        showSnackBar(context, 'Account deleted');
      } else if (e.code == 'too-many-requests') {
        showSnackBar(context, 'Too many requests. Try again later.');
      } else if (e.code == 'operation-not-allowed') {
        showSnackBar(
            context, 'Signing in with Email and Password is not enabled.');
      } else if (e.code == 'network-request-failed') {
        showSnackBar(context, 'Please check your internet connection');
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        showSnackBar(context, 'Invalid login credentials');
      } else {
        showSnackBar(context, e.code);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

// Forgot Password

  Future<void> sendPasswordResetEmail(
      BuildContext context, String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showSnackBar(context, 'Password reset email sent. Check your inbox.');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    } catch (e) {
      showSnackBar(context, 'Password reset failed. Please try again.');
    }
  }


  Future<void> saveUserLoginStatus(bool isLoggedIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  Future<bool> getUserLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn');
    return isLoggedIn ?? false;
  }

// Email Verification

  Future<void> sendEmailverifcation(BuildContext context) async {
    try {
      await _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Verification Email has been sent');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
