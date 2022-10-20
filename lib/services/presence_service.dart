import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/string.dart';
import '../data/models/active_presence_model.dart';
import '../data/models/find_classes_model.dart';
import '../data/models/open_presence_model.dart';
import '../data/models/success_presence_model.dart';

class PresenceService {
  Future<SuccessPresenceModel> createPresence(Map<String, String> body) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await http.post(
      Uri.parse("$baseUrl/presences/create"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token,
      },
      body: jsonEncode(<String, String>{
        'proximity_uuid': body["proximity_uuid"]!,
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return SuccessPresenceModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('No class opened');
    }
  }

  Future<OpenPresenceModel> openPresence(Map<String, int> body) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await http.post(
      Uri.parse("$baseUrl/presences/open"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token,
      },
      body: jsonEncode(<String, int>{
        'subject_schedule_id': body["subject_schedule_id"]!,
        'room_id': body["room_id"]!,
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return OpenPresenceModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to presence.');
    }
  }

  Future<FindClassesModel> findClasses(Map<String, String> body) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await http.post(
      Uri.parse("$baseUrl/presences/find"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token,
      },
      body: jsonEncode(<String, String>{
        'proximity_uuid': body["proximity_uuid"]!,
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return FindClassesModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to presence.');
    }
  }

  Future<dynamic> closePresence(Map<String, String> body) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await http.put(
      Uri.parse("$baseUrl/presences/close"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token,
      },
      body: jsonEncode(<String, String>{
        'presence_id': body["presence_id"]!,
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to close class.');
    }
  }

  Future<ActivePresenceModel> activeClass(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/presences/active"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token,
      },
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return ActivePresenceModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('No active class.');
    }
  }
}
