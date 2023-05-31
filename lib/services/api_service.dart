import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class ApiService {
  Future<List<Users>> getApi() async {
    try {
      print("api called");
      final url = Uri.parse("https://jsonplaceholder.typicode.com/todos");
      final response = await http.get(Uri.parse(url.toString()));
      if (response.statusCode == 200) {
        print("status 200");
        print(response.body);
        final List<dynamic> json = jsonDecode(response.body);
List<Users> users = json.map((jsonMap) => Users.fromJson(jsonMap)).toList();
        print("jsondata${users}");
         return users;
      }
    } catch (e) {
      print("cache error${e}");
    }
    return [];
  }
}
