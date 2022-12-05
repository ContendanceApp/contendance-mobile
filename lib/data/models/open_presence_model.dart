import 'dart:convert';

OpenPresenceModel openPresenceModelFromJson(String str) =>
    OpenPresenceModel.fromJson(json.decode(str));

String openPresenceModelToJson(OpenPresenceModel data) =>
    json.encode(data.toJson());

class OpenPresenceModel {
  OpenPresenceModel({
    required this.message,
    required this.data,
  });

  String message;
  OpenPresenceData data;

  factory OpenPresenceModel.fromJson(Map<String, dynamic> json) =>
      OpenPresenceModel(
        message: json["message"],
        data: OpenPresenceData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class OpenPresenceData {
  OpenPresenceData({
    required this.presenceId,
    required this.subjectScheduleId,
    required this.roomId,
    required this.userId,
    required this.isOpen,
    required this.waitingRoom,
    required this.openTime,
    required this.closeTime,
    required this.presenceDate,
    required this.createdAt,
    required this.updatedAt,
    required this.users,
    required this.rooms,
    required this.subjectsSchedules,
  });

  int presenceId;
  int subjectScheduleId;
  int roomId;
  int userId;
  bool isOpen;
  bool waitingRoom;
  String openTime;
  dynamic closeTime;
  String presenceDate;
  DateTime createdAt;
  DateTime updatedAt;
  Users users;
  Rooms rooms;
  SubjectsSchedules subjectsSchedules;

  factory OpenPresenceData.fromJson(Map<String, dynamic> json) =>
      OpenPresenceData(
        presenceId: json["presence_id"],
        subjectScheduleId: json["subject_schedule_id"],
        roomId: json["room_id"],
        userId: json["user_id"],
        isOpen: json["is_open"],
        waitingRoom: json["waiting_room"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        presenceDate: json["presence_date"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        users: Users.fromJson(json["users"]),
        rooms: Rooms.fromJson(json["rooms"]),
        subjectsSchedules:
            SubjectsSchedules.fromJson(json["subjects_schedules"]),
      );

  Map<String, dynamic> toJson() => {
        "presence_id": presenceId,
        "subject_schedule_id": subjectScheduleId,
        "room_id": roomId,
        "user_id": userId,
        "is_open": isOpen,
        "waiting_room": waitingRoom,
        "open_time": openTime,
        "close_time": closeTime,
        "presence_date": presenceDate,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "users": users.toJson(),
        "rooms": rooms.toJson(),
        "subjects_schedules": subjectsSchedules.toJson(),
      };
}

class Rooms {
  Rooms({
    required this.name,
    required this.roomCode,
    required this.location,
  });

  String name;
  String roomCode;
  String location;

  factory Rooms.fromJson(Map<String, dynamic> json) => Rooms(
        name: json["name"],
        roomCode: json["room_code"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "room_code": roomCode,
        "location": location,
      };
}

class SubjectsSchedules {
  SubjectsSchedules({
    required this.startTime,
    required this.finishTime,
    required this.subjects,
    required this.studyGroups,
  });

  String startTime;
  String finishTime;
  Subjects subjects;
  StudyGroups studyGroups;

  factory SubjectsSchedules.fromJson(Map<String, dynamic> json) =>
      SubjectsSchedules(
        startTime: json["start_time"],
        finishTime: json["finish_time"],
        subjects: Subjects.fromJson(json["subjects"]),
        studyGroups: StudyGroups.fromJson(json["study_groups"]),
      );

  Map<String, dynamic> toJson() => {
        "start_time": startTime,
        "finish_time": finishTime,
        "subjects": subjects.toJson(),
        "study_groups": studyGroups.toJson(),
      };
}

class StudyGroups {
  StudyGroups({
    required this.studyGroupId,
    required this.name,
    required this.year,
    required this.createdAt,
    required this.updatedAt,
  });

  int studyGroupId;
  String name;
  int year;
  DateTime createdAt;
  DateTime updatedAt;

  factory StudyGroups.fromJson(Map<String, dynamic> json) => StudyGroups(
        studyGroupId: json["study_group_id"],
        name: json["name"],
        year: json["year"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "study_group_id": studyGroupId,
        "name": name,
        "year": year,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Subjects {
  Subjects({
    required this.subjectId,
    required this.name,
    required this.acronym,
    required this.createdAt,
    required this.updatedAt,
  });

  int subjectId;
  String name;
  String acronym;
  DateTime createdAt;
  DateTime updatedAt;

  factory Subjects.fromJson(Map<String, dynamic> json) => Subjects(
        subjectId: json["subject_id"],
        name: json["name"],
        acronym: json["acronym"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "subject_id": subjectId,
        "name": name,
        "acronym": acronym,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Users {
  Users({
    required this.fullname,
    required this.sidEid,
  });

  String fullname;
  String sidEid;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        fullname: json["fullname"],
        sidEid: json["sid_eid"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "sid_eid": sidEid,
      };
}
