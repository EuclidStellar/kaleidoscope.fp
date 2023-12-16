
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Design extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('design Images'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('design')
            .orderBy('timestamp', descending: true) // Sort by timestamp in descending order
            .snapshots(),
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
              child: Text('No image data available.'),
            );
          }

          // Map each document to an ImageData object
          List<ImageData> images = snapshot.data!.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return ImageData(
              name: data['name'] ?? '',
              description: data['description'] ?? '',
              imageUrl: data['image_url'] ?? '',
            );
          }).toList();

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  _showImageDetailsDialog(context, images[index]);
                },
                child: Image.network(
                  images[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showImageDetailsDialog(BuildContext context, ImageData imageData) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(imageData.name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Description: ${imageData.description}'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _showFullScreenImage(context, imageData.imageUrl);
                },
                child: Text('Show Image'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showFullScreenImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}

class ImageData {
  final String name;
  final String description;
  final String imageUrl;

  ImageData({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

