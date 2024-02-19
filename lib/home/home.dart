import 'package:flutter/material.dart';
import 'package:kaleidoscope_fp/screens/events.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OptionCard(
              title: 'Achievements',
              icon: Icons.emoji_events,
              color: Colors.blue,
              onTap: () {
                // Navigate to the achievements screen
               
              },
            ),
            SizedBox(height: 20),
            OptionCard(
              title: 'Events',
              icon: Icons.event,
              color: Colors.green,
              onTap: () {
                // Navigate to the events screen
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventsTab()),
                );
              },
            ),
            SizedBox(height: 20),
            OptionCard(
              title: 'Memories',
              icon: Icons.collections,
              color: Colors.orange,
              onTap: () {
                // Navigate to the memories screen
                Navigator.pushNamed(context, '/memories');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const OptionCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
