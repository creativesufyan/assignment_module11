import 'package:assignment_module11/screen/photo_class.dart';
import 'package:flutter/material.dart';

class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;

  PhotoDetailScreen({required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(photo.imageUrl),
          const SizedBox(height: 20),
          Text('ID: ${photo.id}'),
          const SizedBox(height: 10),
          Text('Title: ${photo.title}'),
        ],
      ),
    );
  }
}
