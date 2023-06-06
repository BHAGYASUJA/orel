import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<void> getNumberFact ({required int number}) async {
  final response = await http.get(Uri.parse("http://numbersapi.com/29?json"));

    if (kDebugMode) {
      print(response);
    }

}