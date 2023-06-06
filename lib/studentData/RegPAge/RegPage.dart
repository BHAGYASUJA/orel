import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Regpage extends StatefulWidget {
  const Regpage({super.key});

  @override
  State<Regpage> createState() => _RegpageState();
}

class _RegpageState extends State<Regpage> {
  List photos = [];
  Future<void> fetchdata() async {
    final response = await http.get(Uri.parse(
        'https://llabdemo.orell.com/api/masters/anonymous/getAcademicYear/32'));
    final data = json.decode(response.body);
    setState(() {
      photos = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: photos.isEmpty
            ? Center(
            child: ElevatedButton(
                onPressed: () {
                  fetchdata();
                },
                child: Text('load')))
            : ListView.builder(
          itemCount: photos.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Text(photos[index]['academicYearId'].toString()),
               title: Text(photos[index]['title']),
             // subtitle: Text('photo id:${photos[index]['id']}'),
            );
          },
        ),
      ),
    );
  }
}