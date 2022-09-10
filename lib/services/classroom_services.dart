import 'dart:convert';

import 'package:http/http.dart' as http;

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
