import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/string.dart';
import '../data/models/presence_history_lecturer_model.dart';
import '../data/models/presence_history_student_model.dart';

class PresenceHistoryService {
  Future<PresenceHistoryLecturerModel> getPresenceHistoryLecturer() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await http
        .get(Uri.parse("$baseUrl/presences/history"), headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
    });

    if (response.statusCode == 201 || response.statusCode == 200) {
      return PresenceHistoryLecturerModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('No presence history.');
    }
  }

  Future<PresenceHistoryStudentModel> getPresenceHistoryStudent() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await http
        .get(Uri.parse("$baseUrl/presences/history"), headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
    });

    if (response.statusCode == 201 || response.statusCode == 200) {
      return PresenceHistoryStudentModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('No presence history.');
    }
  }
}
