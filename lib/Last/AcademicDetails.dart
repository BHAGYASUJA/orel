import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class AcademicYearScreen extends StatefulWidget {
  @override
  _AcademicYearScreenState createState() => _AcademicYearScreenState();
}

class _AcademicYearScreenState extends State<AcademicYearScreen> {
  List<Map<String, dynamic>> academicYears = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final response = await http.get(
      Uri.parse('https://llabdemo.orell.com/api/masters/anonymous/getAcademicYear/32'),
    );

    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> data = jsonDecode(response.body);
      setState(() {
        academicYears = data;
      });
    } else {
      Fluttertoast.showToast(msg: 'Failed to fetch academic years.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academic Years'),
      ),
      body: ListView.builder(
        itemCount: academicYears.length,
        itemBuilder: (context, index) {
          final academicYear = academicYears[index];
          return ListTile(
            title: Text(academicYear['academicYear']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text('Academic Year Id :${academicYear['academicYearId']}'),
                SizedBox(height: 10,),

                Text('Start Date: ${academicYear['academicStart']}'),
                SizedBox(height: 10,),

                Text('End Date: ${academicYear['academicEnd']}'),
vz              ],
            ),
          );
        },
      ),
    );
  }
}
