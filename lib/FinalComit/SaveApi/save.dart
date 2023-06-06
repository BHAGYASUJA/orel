import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// void main() {
//   runApp(SaveUserApp());
// }

// class SaveUserApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Save User',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SaveUserScreen(),
//     );
//   }
// }

class SaveUserScreen extends StatefulWidget {
  @override
  _SaveUserScreenState createState() => _SaveUserScreenState();
}

class _SaveUserScreenState extends State<SaveUserScreen> {
  Future<void> saveUser() async {
    final url = Uri.parse('https://llabdemo.orell.com/api/userService/anonymous/saveUser');
    final body = jsonEncode({
      "academicYearId": "93",
      "address": "ORELL SOFTWARE SOLUTIONS PVT LTD\nBCG TOWER 1ST FLOOR",
      "createdBy": "poonam.orell1",
      "emailId": "sarish@orell.in",
      "image": "",
      "institutionId": 32,
      "mobileCode": "",
      "mobileNo": "1234567890",
      "modifiedBy": "poonam.orell1",
      "name": "Orell Test",
      "password": "123456",
      "status": "N",
      "userClassDetailsList": [
        {
          "userClassId": 0,
          "userId": "0",
          "classId": "793"
        }
      ],
      "classId": "793",
      "userClassId": 0,
      "userId": "0",
      "userCode": "sarish.orell1",
      "userType": "STUDENT",
      "whatsappCode": "",
      "whatsappNo": "1234567890"
    });

    final response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print(responseData);
      // Handle success response here
    } else {
      print('Failed to save user.');
      // Handle error response here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save User'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: saveUser,
          child: Text('Save User'),
        ),
      ),
    );
  }
}
