import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/string.dart';
import '../data/models/login.dart';

class LoginService {
  Future<Login> authLogin(Map<String, String> body) async {
    final response = await http.post(
      Uri.parse("$baseUrl/auth/login"),
      headers: headers,
      body: jsonEncode(
        <String, String>{
          'email': body['email']!,
          'password': body['password']!,
        },
      ),
    );

    if (response.statusCode == 200) {
      Map<dynamic, dynamic> temp = jsonDecode(response.body);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', temp['access_token'] ?? "");
      return Login.fromJson(jsonDecode(response.body));
    } else {
      return Login.fromJson(jsonDecode(response.body));
    }
  }

  Future<http.Response> loggedUser(String token) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/auth/me"), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "bearer $token",
      });
      return response;
    } catch (e) {
      // throw e;
      throw Exception(e);
    }
  }
}
