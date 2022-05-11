// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:contendance_app/data/models/presence.dart';

// class PresenceAPI {
//   static const String _baseUrl =
//       'https://contendance-api.herokuapp.com/api/presensi';

//   static final Map<String, String> httpHeaders = {
//     HttpHeaders.contentTypeHeader: "application/json",
//     "Connection": "Keep-Alive",
//     "Keep-Alive": "timeout=5, max=5000"
//   };

//   Future<Presences> topHeadlines() async {
//     final response =
//         await http.get(Uri.parse(_baseUrl), headers: PresenceAPI.httpHeaders);
//     if (response.statusCode == 200) {
//       return Presences.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load top headlines');
//     }
//   }
// }
