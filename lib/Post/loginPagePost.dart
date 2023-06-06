import 'package:flutter/foundation.dart';
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
      title: 'Login Example',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conformpasswordController =TextEditingController();

  Future<void> login() async {
    //var url = Uri.parse('https://api.example.com/login');

    //  var url = Uri.parse('https://llabdemo.orell.com/api/masters/anonymous/getAllClassList');
    var url = Uri.parse('https://llabdemo.orell.com/api/userService/anonymous/saveUser');

    var body = {
      'username': _usernameController.text,
      'password': _passwordController.text,
    };

    var response = await http.post(url, body: json.encode(body));

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      // Process the login response
      if (kDebugMode) {
        print(responseData);
      }
    } else {
      print('Login failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _conformpasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'conformPassword',
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
