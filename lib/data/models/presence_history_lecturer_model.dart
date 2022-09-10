import 'dart:convert';

PresenceHistoryLecturerModel presenceHistoryLecturerFromJson(String str) =>
    PresenceHistoryLecturerModel.fromJson(json.decode(str));

String presenceHistoryLecturerToJson(PresenceHistoryLecturerModel data) =>
    json.encode(data.toJson());

class PresenceHistoryLecturerModel {
  PresenceHistoryLecturerModel({
    required this.data,
  });

  List<PresenceHistoryLecturerData> data;

  factory PresenceHistoryLecturerModel.fromJson(Map<String, dynamic> json) =>
      PresenceHistoryLecturerModel(
        data: List<PresenceHistoryLecturerData>.from(
            json["data"].map((x) => PresenceHistoryLecturerData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PresenceHistoryLecturerData {
  PresenceHistoryLecturerData({
    required this.presenceId,
    required this.userId,
    required this.isOpen,
    required this.openTime,
    required this.closeTime,
    required this.presenceDate,
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
  DateTime presenceDate;
  DateTime createdAt;
  DateTime updatedAt;
  RoomModel room;
  SubjectSchedule subjectSchedule;

  factory PresenceHistoryLecturerData.fromJson(Map<String, dynamic> json) =>
      PresenceHistoryLecturerData(
        presenceId: json["presence_id"],
        userId: json["user_id"],
        isOpen: json["is_open"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        presenceDate: DateTime.parse(json["presence_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        room: RoomModel.fromJson(json["room"]),
        subjectSchedule: SubjectSchedule.fromJson(json["subject_schedule"]),
      );

  Map<String, dynamic> toJson() => {
        "presence_id": presenceId,
        "user_id": userId,
        "is_open": isOpen,
        "open_time": openTime,
        "close_time": closeTime,
        "presence_date":
            "${presenceDate.year.toString().padLeft(4, '0')}-${presenceDate.month.toString().padLeft(2, '0')}-${presenceDate.day.toString().padLeft(2, '0')}",
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "room": room.toJson(),
        "subject_schedule": subjectSchedule.toJson(),
      };
}

class RoomModel {
  RoomModel({
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

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
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
    required this.subject,
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
  Subject subject;

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
        subject: Subject.fromJson(json["subject"]),
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
        "subject": subject.toJson(),
      };
}

class Subject {
  Subject({
    required this.subjectId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int subjectId;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        subjectId: json["subject_id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "subject_id": subjectId,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
