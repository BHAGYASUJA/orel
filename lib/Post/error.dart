import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(ClassDetailsApp());
}

class ClassDetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class Details App',
      home: ClassDetailsWidget(),
    );
  }
}

class ClassDetailsWidget extends StatefulWidget {
  @override
  _ClassDetailsWidgetState createState() => _ClassDetailsWidgetState();
}

class _ClassDetailsWidgetState extends State<ClassDetailsWidget> {
  List<dynamic> classDetails = [];
  String error = '';

  @override
  void initState() {
    super.initState();
    fetchClassDetails();
  }

  void fetchClassDetails() async {
    var url = Uri.parse('https://llabdemo.orell.com/api/masters/anonymous/getAllClassList');

    try {
      var response = await http.post(url);

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        setState(() {
          classDetails = responseData;
          error = ''; // Clear any previous errors
        });
      } else {
        setState(() {
          classDetails = [];
          error = 'Failed to get class details with status: ${response.statusCode}.';
        });
      }
    } catch (e) {
      setState(() {
        classDetails = [];
        error = 'An error occurred: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Details Widget'),
      ),
      body: Column(
        children: [
          if (error.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                error,
                style: TextStyle(color: Colors.red),
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: classDetails.length,
              itemBuilder: (context, index) {
                var className = classDetails[index]['className'];
                var classCode = classDetails[index]['classCode'];

                return ListTile(
                  title: Text('Name: $className, Code: $classCode'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



