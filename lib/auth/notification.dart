
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('notification').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No notifications available.'),
            );
          }

          // Map each document to a Notification object
          List<NotificationMessage> notifications = snapshot.data!.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return NotificationMessage(
              name: data['name'] ?? '',
              message: data['message'] ?? '',
            );
          }).toList();

          // Reverse the order to display latest messages at the top
          notifications = notifications.reversed.toList();

          // Display the notifications
          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return NotificationCard(notification: notifications[index]);
            },
          );
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationMessage notification;

  NotificationCard({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.all(12),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'From: ${notification.name}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Message: ${notification.message}',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationMessage {
  final String name;
  final String message;

  NotificationMessage({
    required this.name,
    required this.message,
  });
}

void main() {
  runApp(MaterialApp(
    home: NotificationScreen(),
  ));
}
