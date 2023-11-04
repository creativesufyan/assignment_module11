import 'dart:convert';
import 'package:assignment_module11/screen/photo_class.dart';
import 'package:assignment_module11/screen/photo_list_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhotoListScreen(),
    );
  }
}



