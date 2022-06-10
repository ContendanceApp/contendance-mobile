import 'dart:convert';

ClassPresence classPresenceFromJson(String str) =>
    ClassPresence.fromJson(json.decode(str));

String classPresenceToJson(ClassPresence data) => json.encode(data.toJson());

class ClassPresence {
  ClassPresence({
    required this.presenceId,
    required this.userId,
    required this.isOpen,
    required this.openTime,
    required this.closeTime,
    required this.createdAt,
    required this.updatedAt,
    required this.room,
    required this.subjectSchedule,
  });

  int presenceId;
  int userId;
  bool isOpen;
  String openTime;
  dynamic closeTime;
  DateTime createdAt;
  DateTime updatedAt;
  Room room;
  SubjectSchedule subjectSchedule;

  factory ClassPresence.fromJson(Map<String, dynamic> json) => ClassPresence(
        presenceId: json["presence_id"],
        userId: json["user_id"],
        isOpen: json["is_open"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        room: Room.fromJson(json["room"]),
        subjectSchedule: SubjectSchedule.fromJson(json["subject_schedule"]),
      );

  Map<String, dynamic> toJson() => {
        "presence_id": presenceId,
        "user_id": userId,
        "is_open": isOpen,
        "open_time": openTime,
        "close_time": closeTime,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "room": room.toJson(),
        "subject_schedule": subjectSchedule.toJson(),
      };
}

class Room {
  Room({
    required this.roomId,
    required this.beaconId,
    required this.name,
    required this.roomCode,
    required this.location,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  int roomId;
  int beaconId;
  String name;
  String roomCode;
  String location;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        roomId: json["room_id"],
        beaconId: json["beacon_id"],
        name: json["name"],
        roomCode: json["room_code"],
        location: json["location"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "beacon_id": beaconId,
        "name": name,
        "room_code": roomCode,
        "location": location,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class SubjectSchedule {
  SubjectSchedule({
    required this.subjectScheduleId,
    required this.subjectId,
    required this.userId,
    required this.studyGroupId,
    required this.roomId,
    required this.startTime,
    required this.finishTime,
    required this.createdAt,
    required this.updatedAt,
  });

  int subjectScheduleId;
  int subjectId;
  int userId;
  int studyGroupId;
  int roomId;
  String startTime;
  String finishTime;
  DateTime createdAt;
  DateTime updatedAt;

  factory SubjectSchedule.fromJson(Map<String, dynamic> json) =>
      SubjectSchedule(
        subjectScheduleId: json["subject_schedule_id"],
        subjectId: json["subject_id"],
        userId: json["user_id"],
        studyGroupId: json["study_group_id"],
        roomId: json["room_id"],
        startTime: json["start_time"],
        finishTime: json["finish_time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "subject_schedule_id": subjectScheduleId,
        "subject_id": subjectId,
        "user_id": userId,
        "study_group_id": studyGroupId,
        "room_id": roomId,
        "start_time": startTime,
        "finish_time": finishTime,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
