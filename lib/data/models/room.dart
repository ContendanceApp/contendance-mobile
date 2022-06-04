import 'dart:convert';

Room roomFromJson(String str) => Room.fromJson(json.decode(str));

String roomToJson(Room data) => json.encode(data.toJson());

class Room {
  Room({
    required this.name,
    required this.roomCode,
    required this.location,
    required this.description,
  });

  String name;
  String roomCode;
  String location;
  String description;

  factory Room.fromJson(Map<String, dynamic> json) => Room(
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
