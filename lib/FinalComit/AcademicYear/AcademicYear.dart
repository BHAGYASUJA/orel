import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'dart:convert';
import 'package:orel/FinalComit/ClassDetails/ClassDetails.dart';
void main() {
  runApp(StudentRegistrationApp());
}

class StudentRegistrationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: AcademicYearList(),
      // routes: '/ClassDetails',
      initialRoute: '/',
      routes: {
        '/': (context) => AcademicYearList(),
        '/login': (context) => ClassDetailsScreen(),
      }
    );
  }
}

class AcademicYearList extends StatefulWidget {
  @override
  _AcademicYearListState createState() => _AcademicYearListState();
}

class _AcademicYearListState extends State<AcademicYearList> {
  late Future<List<AcademicYear>> futureAcademicYears;

  @override
  void initState() {
    super.initState();
    futureAcademicYears = fetchAcademicYears();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academic Years'),
      ),
      body: Center(
        child:GestureDetector(child:
        FutureBuilder<List<AcademicYear>>(
          future: futureAcademicYears,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<AcademicYear> academicYears = snapshot.data!;
              return ListView.builder(
                itemCount: academicYears.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(academicYears[index].academicYearId.toString()),
                    title: Text(academicYears[index].academicYear),
                    subtitle: Text(
                      'Start: ${academicYears[index].academicStart}  End: ${academicYears[index].academicEnd}',
                    ),
                  );
                },
              );

            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            return CircularProgressIndicator(
              backgroundColor: Colors.blue,
            );
          },
        ),
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
      ),)
    );
  }
}
class AcademicYear {
  final int academicYearId;
  final String academicYear;
  final String academicStart;
  final String academicEnd;

  AcademicYear({
    required this.academicYearId,
    required this.academicYear,
    required this.academicStart,
    required this.academicEnd,
  });

  factory AcademicYear.fromJson(Map<String, dynamic> json) {
    return AcademicYear(
      academicYearId: json['academicYearId'],
      academicYear: json['academicYear'],
      academicStart: json['academicStart'],
      academicEnd: json['academicEnd'],
    );
  }
}

Future<List<AcademicYear>> fetchAcademicYears() async {
  final response = await http.get(
      Uri.parse('https://llabdemo.orell.com/api/masters/anonymous/getAcademicYear/32'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    List<AcademicYear> academicYears = data.map((json) => AcademicYear.fromJson(json)).toList();
    return academicYears;
  } else {
    throw Exception('Failed to fetch academic years');
  }
}
