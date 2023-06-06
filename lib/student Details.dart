

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
      title: 'User Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Set the splash screen as the home screen
      routes: {
        '/signup': (context) => SignupPage(),
        '/login': (context) => LoginPage(),
        '/details': (context) => DetailPage(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  Future<void> fetchAcademicYears(BuildContext context) async {
    final response = await http.get(
      Uri.parse('https://llabdemo.orell.com/api/masters/anonymous/getAcademicYear/32'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      // Assuming the response is a list of academic years
      List<dynamic> academicYears = List.from(jsonData);

      // Pass the fetched academic years to the next page and navigate to the signup page
      Navigator.pushReplacementNamed(context, '/signup', arguments: academicYears);
    } else {
      // Handle error case
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to fetch academic years.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchAcademicYears(context); // Fetch academic years on splash screen
    return Scaffold(
      body: Center(
        child:
        CircularProgressIndicator(),

      ),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signup() async {
    final data = {
      "academicYearId": "93",
      "address": "ORELL SOFTWARE SOLUTIONS PVT LTD\nBCG TOWER 1ST FLOOR",
      "createdBy": "poonam.orell1",
      "emailId": emailController.text,
      "image": "",
      "institutionId": 32,
      "mobileCode": "",
      "mobileNo": "1234567890",
      "modifiedBy": "poonam.orell1",
      "name": nameController.text,
      "password": passwordController.text,
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
      "userCode": "${nameController.text}.orell1",
      "userType": "STUDENT",
      "whatsappCode": "",
      "whatsappNo": "1234567890"
    };

    final response = await http.post(
      Uri.parse('https://llabdemo.orell.com/api/userService/anonymous/saveUser'),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      Navigator.pushNamed(context, '/login');
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to register user.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
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
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: signup,
              child: Text('Sign Up'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Rest of the code remains the same
  // ...

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    // Perform login logic here
    Navigator.pushNamed(context, '/details');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: login,
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text('Create an account'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  // Rest of the code remains the same
  // ...
  Future<List<dynamic>> fetchAcademicYears() async {
    final response = await http.get(
      Uri.parse('https://llabdemo.orell.com/api/masters/anonymous/getAcademicYear/32'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return List.from(jsonData);
    } else {
      throw Exception('Failed to fetch academic years');
    }
  }

  Future<List<dynamic>> fetchClassDetails() async {
    final academicYears = await fetchAcademicYears();
    final academicYearId = academicYears[0]['academicYearId'].toString();

    final data = {
      "institutionId": 32,
      "academicYearId": academicYearId,
    };

    final response = await http.post(
      Uri.parse('https://llabdemo.orell.com/api/masters/anonymous/getAllClassList'),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return List.from(jsonData);
    } else {
      throw Exception('Failed to fetch class details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchClassDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Loading...'),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Error'),
            ),
            body: Center(
              child: Text('Failed to fetch data'),
            ),
          );
        } else {
          final classDetails = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: Text('User Details'),
            ),
            body: ListView.builder(
              itemCount: classDetails.length,
              itemBuilder: (context, index) {
                final classDetail = classDetails[index];
                return ListTile(
                  title: Text(classDetail['course']),
                  subtitle: Text('Course Type: ${classDetail['courseType']}'),
                );
              },
            ),
          );
        }
      },
    );
  }

}





// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'User Registration',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => SignupPage(),
//         '/login': (context) => LoginPage(),
//         '/details': (context) => DetailPage(),
//       },
//     );
//   }
// }
//
// class SignupPage extends StatefulWidget {
//   @override
//   _SignupPageState createState() => _SignupPageState();
// }
//
// class _SignupPageState extends State<SignupPage> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   Future<void> signup() async {
//     final data = {
//       "academicYearId": "93",
//       "address": "ORELL SOFTWARE SOLUTIONS PVT LTD\nBCG TOWER 1ST FLOOR",
//       "createdBy": "poonam.orell1",
//       "emailId": emailController.text,
//       "image": "",
//       "institutionId": 32,
//       "mobileCode": "",
//       "mobileNo": "1234567890",
//       "modifiedBy": "poonam.orell1",
//       "name": nameController.text,
//       "password": passwordController.text,
//       "status": "N",
//       "userClassDetailsList": [
//         {
//           "userClassId": 0,
//           "userId": "0",
//           "classId": "793"
//         }
//       ],
//       "classId": "793",
//       "userClassId": 0,
//       "userId": "0",
//       "userCode": "${nameController.text}.orell1",
//       "userType": "STUDENT",
//       "whatsappCode": "",
//       "whatsappNo": "1234567890"
//     };
//
//     final response = await http.post(
//       Uri.parse('https://llabdemo.orell.com/api/userService/anonymous/saveUser'),
//       body: json.encode(data),
//       headers: {'Content-Type': 'application/json'},
//     );
//
//     if (response.statusCode == 200) {
//       Navigator.pushNamed(context, '/login');
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Error'),
//             content: Text('Failed to register user.'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign Up'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: signup,
//               child: Text('Sign Up'),
//             ),
//             SizedBox(height: 16.0),
//             TextButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/login');
//               },
//               child: Text('Already have an account? Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   Future<void> login() async {
//     // Perform login logic here
//     Navigator.pushNamed(context, '/details');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: login,
//               child: Text('Login'),
//             ),
//             SizedBox(height: 16.0),
//             TextButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/');
//               },
//               child: Text('Create an account'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class DetailPage extends StatelessWidget {
//   Future<List<dynamic>> fetchAcademicYears() async {
//     final response = await http.get(
//       Uri.parse('https://llabdemo.orell.com/api/masters/anonymous/getAcademicYear/32'),
//     );
//
//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       return List.from(jsonData);
//     } else {
//       throw Exception('Failed to fetch academic years');
//     }
//   }
//
//   Future<List<dynamic>> fetchClassDetails() async {
//     final academicYears = await fetchAcademicYears();
//     final academicYearId = academicYears[0]['academicYearId'].toString();
//
//     final data = {
//       "institutionId": 32,
//       "academicYearId": academicYearId,
//     };
//
//     final response = await http.post(
//       Uri.parse('https://llabdemo.orell.com/api/masters/anonymous/getAllClassList'),
//       body: json.encode(data),
//       headers: {'Content-Type': 'application/json'},
//     );
//
//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       return List.from(jsonData);
//     } else {
//       throw Exception('Failed to fetch class details');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<dynamic>>(
//       future: fetchClassDetails(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('Loading...'),
//             ),
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         } else if (snapshot.hasError) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('Error'),
//             ),
//             body: Center(
//               child: Text('Failed to fetch data'),
//             ),
//           );
//         } else {
//           final classDetails = snapshot.data!;
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('User Details'),
//             ),
//             body: ListView.builder(
//               itemCount: classDetails.length,
//               itemBuilder: (context, index) {
//                 final classDetail = classDetails[index];
//                 return ListTile(
//                   title: Text(classDetail['course']),
//                   subtitle: Text('Course Type: ${classDetail['courseType']}'),
//                 );
//               },
//             ),
//           );
//         }
//       },
//     );
//   }
// }
