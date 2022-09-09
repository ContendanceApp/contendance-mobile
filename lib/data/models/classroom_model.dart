import 'dart:convert';

ClassroomModel classroomModelFromJson(String str) =>
    ClassroomModel.fromJson(json.decode(str));

String classroomModelToJson(ClassroomModel data) => json.encode(data.toJson());

class ClassroomModel {
  ClassroomModel({
    required this.data,
  });

  Data data;

  factory ClassroomModel.fromJson(Map<String, dynamic> json) => ClassroomModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.roomCode,
    required this.roomName,
    required this.hasWaitingRoom,
    required this.isOpen,
    required this.loggedInAt,
    required this.users,
  });

  String roomCode;
  String roomName;
  String hasWaitingRoom;
  String isOpen;
  DateTime loggedInAt;
  List<User> users;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        roomCode: json["room_code"],
        roomName: json["room_name"],
        hasWaitingRoom: json["has_waiting_room"],
        isOpen: json["is_open"],
        loggedInAt: DateTime.parse(json["logged_in_at"]),
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "room_code": roomCode,
        "room_name": roomName,
        "has_waiting_room": hasWaitingRoom,
        "is_open": isOpen,
        "logged_in_at": loggedInAt.toIso8601String(),
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class User {
  User({
    required this.userId,
    required this.name,
    required this.nrp,
    required this.loggedInAt,
  });

  int userId;
  String name;
  String nrp;
  DateTime loggedInAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        name: json["name"],
        nrp: json["nrp"],
        loggedInAt: DateTime.parse(json["logged_in_at"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "nrp": nrp,
        "logged_in_at": loggedInAt.toIso8601String(),
      };
}
