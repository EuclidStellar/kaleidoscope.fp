import 'package:flutter/material.dart';
import 'package:kaleidoscope_fp/screens/registration.dart';

import '../model/eventsmodel.dart';

class EventsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return ListTile(
            title: Text(event.name),
            subtitle: Text(event.description),
            trailing: event.isUpcoming
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RegistrationScreen(),
                        ),
                      );
                    },
                    child: Text('Register'),
                  )
                : null,
          );
        },
      ),
    );
  }
}
