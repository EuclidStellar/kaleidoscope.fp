// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';




// class SecretScreen extends StatefulWidget {
//   @override
//   _SecretScreenState createState() => _SecretScreenState();
// }

// class _SecretScreenState extends State<SecretScreen> {
//   late DateTime unlockTime;
//   bool isUnlocked = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadUnlockTime();
//   }

  

//   Future<void> _loadUnlockTime() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   final storedUnlockTime = prefs.getString('unlock_time');

//   if (storedUnlockTime != null) {
//     unlockTime = DateTime.parse(storedUnlockTime);
//   } else {
//     // If no unlock time is stored, set a default unlock time (e.g., 1 hour from now)
//     unlockTime = DateTime.now().add(Duration(hours: 1));
//     prefs.setString('unlock_time', unlockTime.toIso8601String());
//   }

//   // Check if it's time to unlock
//   if (DateTime.now().isAfter(unlockTime)) {
//     setState(() {
//       isUnlocked = true;
//     });
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Secret Screen'),
//       ),
//       body: Center(
//         child: isUnlocked
//             ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Secret Unlocked!'),
//                   // Add your secret content here
//                 ],
//               )
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Secret locked until:'),
//                   Text(unlockTime.toString()),
//                 ],
//               ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slide_countdown/slide_countdown.dart';

class SecretScreen extends StatefulWidget {
  @override
  _SecretScreenState createState() => _SecretScreenState();
}

class _SecretScreenState extends State<SecretScreen> {
  DateTime? unlockTime;
  bool isUnlocked = false;

  @override
  void initState() {
    super.initState();
    _loadUnlockTime();
  }

  Future<void> _loadUnlockTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final storedUnlockTime = prefs.getString('unlock_time');

    if (storedUnlockTime != null) {
      unlockTime = DateTime.parse(storedUnlockTime);
    } else {
      // Set the default unlock time to 5 days from now
      unlockTime = DateTime.now().add(Duration(days: 5));
      prefs.setString('unlock_time', unlockTime!.toIso8601String());
    }

    // Check if it's time to unlock
    if (DateTime.now().isAfter(unlockTime!)) {
      setState(() {
        isUnlocked = true;
      });
    }
  }

  @override
  void didUpdateWidget(covariant SecretScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _loadUnlockTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Secret Screen'),
      ),
      body: Center(
        child: isUnlocked
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Secret Unlocked!'),
                  // Add your secret content here
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Secret locked until:'),
                  unlockTime != null
                      ? SlideCountdown(
                          duration: unlockTime!.difference(DateTime.now()),
                          slideDirection: SlideDirection.down,
                          separator: ':',
                        )
                      : CircularProgressIndicator(), // Show a loading indicator if unlockTime is null
                ],
              ),
      ),
    );
  }
}
