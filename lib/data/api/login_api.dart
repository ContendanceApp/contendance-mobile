import 'dart:convert';
import 'dart:io';
import 'package:contendance_app/constant/string.dart';
import 'package:contendance_app/data/models/login.dart';
import 'package:http/http.dart' as http;

class LoginAPI {
  static final Map<String, String> httpHeaders = {
    HttpHeaders.contentTypeHeader: "application/json",
    "Connection": "Keep-Alive",
    "Keep-Alive": "timeout=5, max=5000"
  };

  Future<Login> topHeadlines() async {
    final response = await http.get(Uri.parse("$baseUrl/auth/login"),
        headers: LoginAPI.httpHeaders);

    if (response.statusCode == 200) {
      return Login.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
