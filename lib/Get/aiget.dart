import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Academic Years',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AcademicYearsScreen(),
    );
  }
}

class AcademicYearsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academic Years'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchAcademicYears(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Render the list of academic years
            final List<dynamic> academicYears = snapshot.data!;
            return ListView.builder(
              itemCount: academicYears.length,
              itemBuilder: (context, index) {
                final academicYear = academicYears[index];
                return ListTile(
                  title: Text(academicYear['academicYear']),
                  subtitle: Text('Start: ${academicYear['academicStart']}'),
                );
              },
            );
          } else if (snapshot.hasError) {
            // Display an error message if the request fails
            return Center(
              child: Text('Failed to fetch academic years'),
            );
          }
          // Show a loading spinner while the request is in progress
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

Future<List<dynamic>> fetchAcademicYears() async {
  final response = await http.get(
    Uri.parse('https://llabdemo.orell.com/api/masters/anonymous/getAcademicYear/32'),
  );

  if (response.statusCode == 200) {
    // If the request is successful, parse the response JSON
    final List<dynamic> data = jsonDecode(response.body);
    return data;
  } else {
    // If the request fails, throw an error
    throw Exception('Failed to fetch academic years');
  }
}
