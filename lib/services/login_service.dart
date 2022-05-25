import 'dart:convert';
import 'package:contendance_app/constant/string.dart';
import 'package:contendance_app/data/models/login.dart';
import 'package:http/http.dart' as http;

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
      return Login.fromJson(jsonDecode(response.body));
    } else {
      // throw Exception('Failed to login!');
      return Login.fromJson(jsonDecode(response.body));
    }
  }
}
