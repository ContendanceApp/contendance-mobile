import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/subjects_schedules_model.dart';
import '../data/models/schedule_model.dart';
import '../constant/string.dart';

class ScheduleService {
  Future<ScheduleModel> getTodaySchedule(String token) async {
    final response =
        await http.get(Uri.parse("$baseUrl/schedules/today"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': token,
    });

    if (response.statusCode == 200) {
      return ScheduleModel.fromJson(jsonDecode(response.body));
    } else {
      throw ("Error: ${response.statusCode}");
    }
  }

  Future<SubjectsScheduleModel> getSubjectsScheduleByStudyGroup() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await http
        .get(Uri.parse("$baseUrl/subject-schedules/study-group"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': token,
    });

    if (response.statusCode == 200) {
      return SubjectsScheduleModel.fromJson(jsonDecode(response.body));
    } else {
      throw ("Error: ${response.statusCode}");
    }
  }
}
