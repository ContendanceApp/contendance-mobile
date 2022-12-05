import 'dart:convert';

RoomModel roomFromJson(String str) => RoomModel.fromJson(json.decode(str));

String roomToJson(RoomModel data) => json.encode(data.toJson());

class RoomModel {
  RoomModel({
    required this.name,
    required this.roomCode,
    required this.location,
    required this.description,
  });

  String name;
  String roomCode;
  String location;
  String description;

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        name: json["name"],
        roomCode: json["roomCode"],
        location: json["location"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "roomCode": roomCode,
        "location": location,
        "description": description,
      };
}
