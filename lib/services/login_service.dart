import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/string.dart';
import '../data/models/login_model.dart';

class LoginService {
  Future<LoginModel> authLogin(Map<String, String> body) async {
    final response = await http.post(
      Uri.parse("$baseUrl/users/login"),
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
      await prefs.setString('token', "bearer " + temp['data']['token']);
    }
    return LoginModel.fromJson(jsonDecode(response.body));
  }

  Future<http.Response> loggedUser(String token) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/users/me"), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token,
      });

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> changePassword(Map<String, String> body) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token')!;
      final response = await http.post(
        Uri.parse("$baseUrl/users/change-password"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
        body: jsonEncode(
          <String, String>{
            'old_password': body['old_password']!,
            'new_password': body['new_password']!,
          },
        ),
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
