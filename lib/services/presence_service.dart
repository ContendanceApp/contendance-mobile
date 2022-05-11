import 'dart:convert';
import 'package:contendance_app/data/models/presence.dart';
import 'package:http/http.dart' as http;

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
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Presences.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to presence.');
    }
  }
}
