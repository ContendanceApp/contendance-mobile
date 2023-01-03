import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/detail_class_model.dart';
import '../data/models/classroom_model.dart';
import '../constant/string.dart';

class ClassroomService {
  Future<ClassroomModel> getDetailActiveClass(int idClass) async {
    final response = await http.post(
      Uri.parse("$baseUrl/class/detail/$idClass"),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return ClassroomModel.fromJson(jsonDecode(response.body));
    } else {
      return ClassroomModel.fromJson(jsonDecode(response.body));
    }
  }

  Future<DetailClassModel> getDetailClass(int presenceId) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    final response = await http.get(
      Uri.parse("$baseUrl/presences/detail/$presenceId"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token,
      },
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return DetailClassModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to retrieve data!');
    }
  }

  Future<http.Response> toggleAdmitClass(int idClass) async {
    try {
      final response =
          await http.get(Uri.parse("$baseUrl/class/toggle-admit/$idClass"));
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
