import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Examples/COLLEGE/CLASSDETAILS.dart';
import 'ACADEMICDETAILS.dart';
import 'Save Api.dart';

void main() {
  runApp(firstPage());
}

class firstPage extends StatefulWidget {


  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: ()  => Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return AcademicYearListScreen();
                },
              )),
              child: Text('Academic Details'),
            ),

            // SizedBox(height: 10), // Add spacing between buttons
            ElevatedButton(
              onPressed: ()  => Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MyApp();
                },
              )),
              child: Text('Class Details'),
            ),
            SizedBox(height: 10), // Add spacing between buttons
            ElevatedButton(
              onPressed: ()  => Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return UserDetailss();
                },
              )),
              child: Text('Class Details'),
            ),
          ],
        ),
      ),
    );
  }
}
