import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Save Data Example',
      home: SaveDataPage(),
    );
  }
}

class SaveDataPage extends StatefulWidget {
  @override
  _SaveDataPageState createState() => _SaveDataPageState();
}

class _SaveDataPageState extends State<SaveDataPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> saveData() async {
    var url = Uri.parse('https://api.example.com/save-data');
    var body = {
      'name': _nameController.text,
      'email': _emailController.text,
    };

    try {
      var response = await http.post(url, body: json.encode(body));

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        // Process the save data response
        print(responseData);
      } else {
        print('Save data failed with status: ${response.statusCode}.');
      }
    } on SocketException catch (e) {
      print('Failed to connect to the server: $e');
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save Data Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: saveData,
              child: Text('Save Data'),
            ),
          ],
        ),
      ),
    );
  }
}
