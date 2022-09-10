import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/string.dart';
import '../data/models/presence_history_lecturer.dart';
import '../data/models/presence_history_student.dart';

class PresenceHistoryService {
  Future<PresenceHistoryLecturers> getPresenceHistoryLecturer() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    final response = await http.get(
        Uri.parse("$baseUrl/presence/history/lecturer"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "bearer $token",
        });

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 201 || response.statusCode == 200) {
      return PresenceHistoryLecturers.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('No presence history.');
    }
  }

  Future<PresenceHistoryStudents> getPresenceHistoryStudent() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    final response = await http.get(
        Uri.parse("$baseUrl/presence/history/student"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "bearer $token",
        });

    print(response.body);

    if (response.statusCode == 201 || response.statusCode == 200) {
      return PresenceHistoryStudents.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('No presence history.');
    }
  }
}
