import 'dart:convert';

import 'package:assignment_module11/screen/photo_class.dart';
import 'package:assignment_module11/screen/photo_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class PhotoListScreen extends StatefulWidget {
  @override
  _PhotoListScreenState createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  late List<Photo> photos;

  @override
  void initState() {
    super.initState();
    fetchPhotos();
  }

  Future<void> fetchPhotos() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      final List<dynamic> parsedJson = json.decode(response.body);
      setState(() {
        photos = parsedJson.map((json) => Photo.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
      ),
      body: photos == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(photos[index].title),
            leading: Image.network(
              photos[index].thumbnailUrl,
              width: 50,
              height: 50,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoDetailScreen(photo: photos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
