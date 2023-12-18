import 'package:flutter/material.dart';
import 'package:kaleidoscope_fp/screens/art.dart';
import 'package:kaleidoscope_fp/screens/design.dart';
import 'package:kaleidoscope_fp/screens/literary.dart';
import 'package:kaleidoscope_fp/screens/photography.dart';

class ArtWorksTab extends StatelessWidget {

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('ArtWorks'),
        //centerTitle: true,
      ),
      body: Column(
        children: [
         
          const SizedBox(height: 90),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildGridItem(
                    context,
                    'Literary',
                       Literary(),
                    Icons.book_outlined,
                    Colors.blue,
                  ),
                  _buildGridItem(
                    context,
                    'Art',
                    Art(),
                    Icons.brush_outlined,
                    Colors.green,
                  ),
                  _buildGridItem(
                    context,
                    'Photography',
                   Photography(),
                    Icons.camera,
                    Colors.orange,
                  ),
                  _buildGridItem(
                    context,
                    'Design',
                    Design(),
                    Icons.design_services_outlined,
                    const Color.fromARGB(247, 234, 102, 102),
                  ),
                ],
              ),
            ),
          )
                  ],
      ),
    );
  }
}

Widget _buildGridItem(
  BuildContext context,
  String text,
  Widget destination,
  IconData icon,
  Color color,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => destination));
    },
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}


