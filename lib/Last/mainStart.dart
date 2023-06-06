import 'package:flutter/material.dart';
import 'package:orel/Last/AcademicDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: AcademicYearScreen(), // Replace the home screen with the AcademicYearScreen widget
    );
  }
}
