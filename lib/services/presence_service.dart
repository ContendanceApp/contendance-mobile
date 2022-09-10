import 'dart:convert';
import '../constant/string.dart';
import '../data/models/class_presence.dart';
import '../data/models/presence.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PresenceService {
  Future<Presence> createPresence(Map<String, String> body) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    final response = await http.post(
      Uri.parse("$baseUrl/presence/create"),
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
        'study_group_id': body["study_group_id"]!,
      }),
    );

    // print(response.body);

    if (response.statusCode == 201 || response.statusCode == 200) {
      return Presence.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('No class opened');
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

  Future<dynamic> closePresence(Map<String, String> body) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    final response = await http.post(
      Uri.parse("$baseUrl/presence/close"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "bearer $token",
      },
      body: jsonEncode(<String, String>{
        'presence_id': body["presence_id"]!,
      }),
    );

    print(response.body);

    if (response.statusCode == 201 || response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to close class.');
    }
  }

  Future<ClassPresence> activeClass(Map<String, String> body) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    int? userId = prefs.getInt("userId");
    final response = await http.get(
      Uri.parse("$baseUrl/presence/active/$userId"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "bearer $token",
      },
    );

    print(response.body);

    await prefs.remove('classStatus');
    if (response.statusCode == 201 || response.statusCode == 200) {
      return ClassPresence.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('No active class.');
    }
  }
}
