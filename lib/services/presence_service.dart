import 'dart:convert';
import 'package:contendance_app/constant/string.dart';
import 'package:contendance_app/data/models/presence.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PresenceService {
  Future<Presences> createPresence(Map<String, String> body) async {
    final response = await http.post(
      Uri.parse('https://contendance-api.herokuapp.com/api/presensi'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'user_id': body["userId"]!,
        'ruangan_id': body["ruanganId"]!,
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return Presences.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to presence.');
    }
  }

  Future<Schedule> validateSchedule(Map<String, String> body) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    final response = await http.post(
      Uri.parse("$baseUrl/beacon/validate-schedule"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "bearer $token",
      },
      body: jsonEncode(<String, String>{
        'proximity_uuid': body["proximity_uuid"]!,
        'major': body["major"]!,
        'minor': body["minor"]!,
        'user_id': body["user_id"]!,
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return Schedule.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to presence.');
    }
  }

  Future<Presence> openPresence(Map<String, String> body) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    final response = await http.post(
      Uri.parse("$baseUrl/presence/open"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "bearer $token",
      },
      body: jsonEncode(<String, String>{
        'proximity_uuid': body["proximity_uuid"]!,
        'major': body["major"]!,
        'minor': body["minor"]!,
        'user_id': body["user_id"]!,
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return Presence.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to presence.');
    }
  }
}
