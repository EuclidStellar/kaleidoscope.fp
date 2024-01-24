import 'package:flutter/material.dart';
import 'package:kaleidoscope_fp/screens/registration.dart';

import '../model/eventsmodel.dart';

class EventsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return GestureDetector(
            onTap: () {
              _showEventDetailsDialog(context, event);
            },
            child: ListTile(
              leading: Image.network(
                event.imageURL,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(event.name),
              subtitle: Text(event.description),
              trailing: event.isUpcoming
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 33, 163, 243), // Set your desired button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Adjust border radius
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Set your desired text color
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }

  void _showEventDetailsDialog(BuildContext context, Event event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                event.imageURL,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 8.0),
              Text(
                event.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(event.description),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Implement the functionality for the "View Gallery" button
                },
                child: Text('View Gallery'),
              ),
            ],
          ),
        );
      },
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:kaleidoscope_fp/screens/registration.dart';

// import '../model/eventsmodel.dart';

// class EventsTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Events'),
//       ),
//       body: ListView.builder(
//         itemCount: events.length,
//         itemBuilder: (context, index) {
//           final event = events[index];
//           return ListTile(
//             leading: Image.network(
//               event.imageURL,
//               width: 50, // Adjust the width as needed
//               height: 50, // Adjust the height as needed
//               fit: BoxFit.cover,
//             ),
//             title: Text(event.name),
//             subtitle: Text(event.description),
//             trailing: event.isUpcoming
//                 ? ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => RegistrationScreen(),
//                         ),
//                       );
//                     },
//                     child: Text('Register'),
//                   )
//                 : null,
//           );
//         },
//       ),
//     );
//   }
// }