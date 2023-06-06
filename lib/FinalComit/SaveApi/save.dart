import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(SignUpApp());
}

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> signUpUser() async {
    final url = Uri.parse('https://llabdemo.orell.com/api/userService/anonymous/saveUser');
    final body = jsonEncode({
      "academicYearId": "93",
      "address": "ORELL SOFTWARE SOLUTIONS PVT LTD\nBCG TOWER 1ST FLOOR",
      "createdBy": "poonam.orell1",
      "emailId": _emailController.text,
      "image": "",
      "institutionId": 32,
      "mobileCode": "",
      "mobileNo": "1234567890",
      "modifiedBy": "poonam.orell1",
      "name": _nameController.text,
      "password": _passwordController.text,
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
      "userCode": _emailController.text,
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
      print('Failed to sign up.');
      // Handle error response here
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: signUpUser,
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
