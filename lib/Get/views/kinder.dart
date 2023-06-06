import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'KindaCode.com',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const KindaCodeDemo(),
    );
  }
}

class KindaCodeDemo extends StatefulWidget {
  const KindaCodeDemo({Key? key}) : super(key: key);

  @override
  State<KindaCodeDemo> createState() => _KindaCodeDemoState();
}

class _KindaCodeDemoState extends State<KindaCodeDemo> {
  // Initialize an instance of GetConnect
  final _connect = GetConnect();

  // send Get request
  // and get the response
  void _sendGetRequest() async {
    final response =
    await _connect.get('https://jsonplaceholder.typicode.com/posts/1');

    if (kDebugMode) {
      print(response.body);
    }
  }

  // send Post request
  // You can somehow trigger this function, for example, when the user clicks on a button
  void _sendPostRequest() async {
    final response = await _connect.post(
      'https://jsonplaceholder.typicode.com/posts',
      {
        'title': 'one two three',
        'body': 'four five six seven',
        'userId': 1,
      },
    );

    if (kDebugMode) {
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KindaCode.com')),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
                onPressed: _sendGetRequest,
                child: const Text('Send GET Request')),
            ElevatedButton(
                onPressed: _sendPostRequest,
                child: const Text('Send POST Request')),
          ],
        ),
      ),
    );
  }
}