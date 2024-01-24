import 'package:flutter/material.dart';
import 'package:kaleidoscope_fp/auth/notification.dart';
import 'package:kaleidoscope_fp/drawer/piquestions.dart';
import 'package:kaleidoscope_fp/drawer/uploadartwork.dart';
import 'package:kaleidoscope_fp/screens/artworks.dart';
import 'package:kaleidoscope_fp/screens/events.dart';
import 'package:kaleidoscope_fp/screens/member.dart';

class HomeScreenPage extends StatefulWidget {
  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    MembersTab(),
    EventsTab(),
    ArtWorksTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
        title: const Text('Kaleidoscope'),
       
        actions: [
          IconButton(
            icon: const Icon(Icons.notification_add),
            onPressed: () {
              Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationScreen()),
          ); // Close the drawer
            },
          ),
          
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,

        child: ListView(
          children: [
           const SizedBox(
              height: 30,
            ),
            const  Text(
              'Kaleidoscope',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              )
            ),
             const SizedBox(
              height: 30,
            ),
            ListTile(
              title: const Text('Upload Artwork'),
              onTap: () {
                Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ImageUploadScreen()),
          ); 
              },
            ),
            ListTile(
              title: const Text('Secrets ? '),
              onTap: () {
                  Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecretScreen()),
          ); // Close the drawer
                // Navigate to the settings page or perform other actions
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Members',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.art_track),
            label: 'Art Works',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          // Handle tab selection
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}


