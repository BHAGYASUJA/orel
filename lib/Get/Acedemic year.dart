import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(AcademicYearApp());
}

class AcademicYearApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Academic Year App',
      home: AcademicYearWidget(),
    );
  }
}

class AcademicYearWidget extends StatefulWidget {
  @override
  _AcademicYearWidgetState createState() => _AcademicYearWidgetState();
}

class _AcademicYearWidgetState extends State<AcademicYearWidget> {
  List<String> academicYears = [];

  @override
  void initState() {
    super.initState();
    fetchAcademicYears();
  }

  void fetchAcademicYears() async {
    var url = Uri.parse('https://llabdemo.orell.com/api/masters/anonymous/getAcademicYear/32');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        List<String> years = [];

        for (var year in responseData) {
          years.add(year.toString());
        }

        setState(() {
          academicYears = years;
        });
      } else {
        print('Failed to get academic years with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academic Year Widget'),
      ),
      body: ListView.builder(
        itemCount: academicYears.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(academicYears[index]),
          );
        },
      ),
    );
  }
}
