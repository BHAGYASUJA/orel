
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Save Api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClassDetailsScreen(),
    );
  }
}


class ClassDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Details'),
      ),
      body: FutureBuilder<String>(
        future: fetchAcademicYearId(),
        builder: (context, academicYearSnapshot) {
          if (academicYearSnapshot.hasData) {
            final academicYearId = academicYearSnapshot.data!;
            return FutureBuilder<List<dynamic>>(
              future: fetchClassDetails(academicYearId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // Render the list of class details
                  final List<dynamic> classDetails = snapshot.data!;
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: classDetails.length,
                          itemBuilder: (context, index) {
                            final classDetail = classDetails[index];
                            return ListTile(
                              title: Text(classDetail['course']),
                              subtitle: Text(classDetail['courseType']),
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: ()
                        // {
                        //   saveData(context, academicYearId); // Pass the context
                        // },
                        => Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return UserDetailss ();
                          },
                        )),
                        child: Text('Save'),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  // Display an error message if the request fails
                  return Center(
                    child: Text('Failed to fetch class details'),
                  );
                }
                // Show a loading spinner while the request is in progress
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          } else if (academicYearSnapshot.hasError) {
            // Display an error message if the request fails
            return Center(
              child: Text('Failed to fetch academic year ID'),
            );
          }
          // Show a loading spinner while the request is in progress
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  // ... fetchClassDetails and fetchAcademicYearId functions remain the same ...

  void saveData(BuildContext context, String academicYearId) {
    final requestData = {
      'academicYearId': academicYearId,
      // Add your data to be saved here
    };

    // Perform the save operation using http.post or any other method
    // ...

    // Show a confirmation dialog
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return AlertDialog(
    //       title: Text('Data Saved'),
    //       content: Text('The data has been saved successfully.'),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //           child: Text('OK'),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }
}


Future<String> fetchAcademicYearId() async {
  final response = await http.get(
    Uri.parse('https://llabdemo.orell.com/api/masters/anonymous/getAcademicYear/32'),
  );

  if (response.statusCode == 200) {
    final List<dynamic> academicYears = jsonDecode(response.body);
    if (academicYears.isNotEmpty) {
      // Return the academic year ID from the first entry
      return academicYears[0]['academicYearId'].toString();
    }
  }
  throw Exception('Failed to fetch academic year ID');
}

Future<List<dynamic>> fetchClassDetails(String academicYearId) async {
  final Map<String, dynamic> requestData = {
    "institutionId": 32,
    "academicYearId": academicYearId,
  };

  final response = await http.post(
    Uri.parse('https://llabdemo.orell.com/api/masters/anonymous/getAllClassList'),
    body: jsonEncode(requestData),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    // If the request is successful, parse the response JSON
    final List<dynamic> data = jsonDecode(response.body);
    return data;
  } else {
    // If the request fails, throw an error
    throw Exception('Failed to fetch class details');
  }
}
