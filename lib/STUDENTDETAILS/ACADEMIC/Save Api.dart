import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class UserClassDetails {
  final int userClassId;
  final String userId;
  final String classId;

  UserClassDetails({
    required this.userClassId,
    required this.userId,
    required this.classId,
  });

  Map<String, dynamic> toJson() {
    return {
      'userClassId': userClassId,
      'userId': userId,
      'classId': classId,
    };
  }
}

class UserDetails {
  final String academicYearId;
  final String address;
  final String createdBy;
  final String emailId;
  final String image;
  final int institutionId;
  final String mobileCode;
  final String mobileNo;
  final String modifiedBy;
  final String name;
  final String password;
  final String status;
  final List<UserClassDetails> userClassDetailsList;
  final String classId;
  final int userClassId;
  final String userType;
  final String userCode;
  final String whatsappCode;
  final String whatsappNo;

  UserDetails({
    required this.academicYearId,
    required this.address,
    required this.createdBy,
    required this.emailId,
    required this.image,
    required this.institutionId,
    required this.mobileCode,
    required this.mobileNo,
    required this.modifiedBy,
    required this.name,
    required this.password,
    required this.status,
    required this.userClassDetailsList,
    required this.classId,
    required this.userClassId,
    required this.userType,
    required this.userCode,
    required this.whatsappCode,
    required this.whatsappNo,
  });

  Map<String, dynamic> toJson() {
    return {
      'academicYearId': academicYearId,
      'address': address,
      'createdBy': createdBy,
      'emailId': emailId,
      'image': image,
      'institutionId': institutionId,
      'mobileCode': mobileCode,
      'mobileNo': mobileNo,
      'modifiedBy': modifiedBy,
      'name': name,
      'password': password,
      'status': status,
      'userClassDetailsList': userClassDetailsList.map((item) => item.toJson()).toList(),
      'classId': classId,
      'userClassId': userClassId,
      'userCode': userCode,
      'userId': '0', // userId value is ignored since it's present twice in the original data
      'userType': userType,
      'whatsappCode': whatsappCode,
      'whatsappNo': whatsappNo,
    };
  }
}


class UserDetailss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Save User'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              saveUser();
            },
            child: Text('Save User'),
          ),
        ),
      ),
    );
  }
  Future<void> saveUser() async {
    final url = 'https://llabdemo.orell.com/api/userService/anonymous/saveUser';

    final userDetails = UserDetails(
      academicYearId: '93',
      address: 'ORELL SOFTWARE SOLUTIONS PVT LTD\nBCG TOWER 1ST FLOOR',
      createdBy: 'poonam.orell1',
      emailId: 'sarish@orell.in',
      image: '',
      institutionId: 32,
      mobileCode: '',
      mobileNo: '1234567890',
      modifiedBy: 'poonam.orell1',
      name: 'Orell Test',
      password: '123456',
      status: 'N',
      userClassDetailsList: [
        UserClassDetails(userClassId: 0, userId: '0', classId: '793'),
      ],
      classId: '793',
      userClassId: 0,
      userType: 'STUDENT',
      userCode: 'sarish.orell1',
      whatsappCode: '',
      whatsappNo: '1234567890',
    );
    final response = await http.post(Uri.parse(url), body: json.encode(userDetails.toJson()));

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print('Save user response: $responseData');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  }

