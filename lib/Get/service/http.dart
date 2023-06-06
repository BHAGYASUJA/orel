
import 'package:http/http.dart' as http;

import '../Modals/academicYear.dart';

class HttpService{
  static Future<List<Welcome>> fetchProducts() async{
    var response = await http.get(Uri.parse("https://llabdemo.orell.com/api/masters/anonymous/getAcademicYear/32"));
    if(response.statusCode == 200){
      var data = response.body;
      print(data);
      return welcomeFromJson(data);
    }else{
      throw Exception();
    }
  }
}