import 'dart:convert';

import 'package:flutter_course/api_service/person_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyPrefs{


  static Future<void> saveUser(Person person) async {
    final prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(person.toJson());
    prefs.setString('person_data', jsonString);
  }

  static Future<Person?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('person_data');
    print("object $jsonString");
    if (jsonString == null) return null;

    Map<String, dynamic> userMap = jsonDecode(jsonString);
    return Person.fromJson(userMap);
  }


}