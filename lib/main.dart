import 'package:flutter/material.dart';

//import 'package:trainee_login/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kaleidoscope_fp/auth/home.dart';
import 'package:kaleidoscope_fp/auth/login.dart';
import 'package:kaleidoscope_fp/auth/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';


// FIrebase Implmentation is going to start from this commit 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const Login());
}


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
     return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: getUserLoginStatus(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == true) {
              return  HomeScreenPage();
            } else {
              return const Welcome(); 
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
   
}
}


Future<bool> getUserLoginStatus() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn');
  return isLoggedIn ?? false; 
}



 // 
    // MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Login',
      
    //   theme: ThemeData(
        
    //     primarySwatch: Colors.blue,
    //     useMaterial3: true,
    //     textTheme: GoogleFonts.latoTextTheme(
    //       Theme.of(context).textTheme,
    //     ),
    //     scaffoldBackgroundColor: Colors.white,
    //     visualDensity: VisualDensity.adaptivePlatformDensity,

    //   ),

    //   home: const Welcome(),

    // );
    