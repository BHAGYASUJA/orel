import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(AcademicYearApp());
}

class AcademicYearApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Academic Year List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AcademicYearListScreen(),
    );
  }
}

class AcademicYearListScreen extends StatefulWidget {
  @override
  _AcademicYearListScreenState createState() => _AcademicYearListScreenState();
}

class _AcademicYearListScreenState extends State<AcademicYearListScreen> {
  List<Map<String, dynamic>> academicYears = [];

  TextEditingController _selectedAcademicYearController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchAcademicYears();
  }

  // Future<void> fetchAcademicYears() async {
  //   final response = await http.get(
  //     'https://llabdemo.orell.com/api/masters/anonymous/getAcademicYear/32',
  //   );

  Future<void> fetchAcademicYears() async {
    final response = await http.get(
      Uri.parse('https://llabdemo.orell.com/api/masters/anonymous/getAcademicYear/32'),
    );


    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        academicYears = List<Map<String, dynamic>>.from(data);
        if (academicYears.isNotEmpty) {
          _selectedAcademicYearController.text =
          academicYears[0]['academicYear'];
        }
      });
    }
  }

  void printSuccessMessage() {
    print('Success!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academic Year List'),
      ),
      body: ListView.builder(
        itemCount: academicYears.length,
        itemBuilder: (context, index) {
          final academicYear = academicYears[index];
          return ListTile(
            leading: Text(academicYear['academicYearId']),
            title: Text(academicYear['academicYear']),
            subtitle: Text(
                'Start: ${academicYear['academicStart']}, End: ${academicYear['academicEnd']}'),
            onTap: () {
              setState(() {
                _selectedAcademicYearController.text =
                academicYear['academicYear'];
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        //printSuccessMessage,
        child: Icon(Icons.print),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          controller: _selectedAcademicYearController,
          decoration: InputDecoration(
            labelText: 'Selected Academic Year',
          ),
          readOnly: true,
        ),
      ),
    );
  }
}
