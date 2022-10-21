import 'dart:convert';

SubjectsScheduleModel subjectsScheduleModelFromJson(String str) =>
    SubjectsScheduleModel.fromJson(json.decode(str));

String subjectsScheduleModelToJson(SubjectsScheduleModel data) =>
    json.encode(data.toJson());

class SubjectsScheduleModel {
  SubjectsScheduleModel({
    required this.message,
    required this.data,
  });

  String message;
  List<SubjectsSchedulesData> data;

  factory SubjectsScheduleModel.fromJson(Map<String, dynamic> json) =>
      SubjectsScheduleModel(
        message: json["message"],
        data: List<SubjectsSchedulesData>.from(
            json["data"].map((x) => SubjectsSchedulesData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SubjectsSchedulesData {
  SubjectsSchedulesData({
    required this.day,
    required this.subjectsSchedules,
  });

  String day;
  List<SubjectsScheduleDataGroup> subjectsSchedules;

  factory SubjectsSchedulesData.fromJson(Map<String, dynamic> json) =>
      SubjectsSchedulesData(
        day: json["day"],
        subjectsSchedules: List<SubjectsScheduleDataGroup>.from(
            json["subjects_schedules"]
                .map((x) => SubjectsScheduleDataGroup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "subjects_schedules":
            List<dynamic>.from(subjectsSchedules.map((x) => x.toJson())),
      };
}

class SubjectsScheduleDataGroup {
  SubjectsScheduleDataGroup({
    required this.subjectScheduleId,
    required this.subjectId,
    required this.userId,
    required this.studyGroupId,
    required this.roomId,
    required this.dayId,
    required this.startTime,
    required this.finishTime,
    required this.createdAt,
    required this.updatedAt,
    required this.rooms,
    required this.subjects,
    required this.users,
  });

  int subjectScheduleId;
  int subjectId;
  int userId;
  int studyGroupId;
  int roomId;
  int dayId;
  DateTime startTime;
  DateTime finishTime;
  DateTime createdAt;
  DateTime updatedAt;
  Rooms rooms;
  Subjects subjects;
  Users users;

  factory SubjectsScheduleDataGroup.fromJson(Map<String, dynamic> json) =>
      SubjectsScheduleDataGroup(
        subjectScheduleId: json["subject_schedule_id"],
        subjectId: json["subject_id"],
        userId: json["user_id"],
        studyGroupId: json["study_group_id"],
        roomId: json["room_id"],
        dayId: json["day_id"],
        startTime: DateTime.parse(json["start_time"]),
        finishTime: DateTime.parse(json["finish_time"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        rooms: Rooms.fromJson(json["rooms"]),
        subjects: Subjects.fromJson(json["subjects"]),
        users: Users.fromJson(json["users"]),
      );

  Map<String, dynamic> toJson() => {
        "subject_schedule_id": subjectScheduleId,
        "subject_id": subjectId,
        "user_id": userId,
        "study_group_id": studyGroupId,
        "room_id": roomId,
        "day_id": dayId,
        "start_time": startTime.toIso8601String(),
        "finish_time": finishTime.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "rooms": rooms.toJson(),
        "subjects": subjects.toJson(),
        "users": users.toJson(),
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

class Subjects {
  Subjects({
    required this.name,
    required this.acronym,
  });

  String name;
  String acronym;

  factory Subjects.fromJson(Map<String, dynamic> json) => Subjects(
        name: json["name"],
        acronym: json["acronym"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "acronym": acronym,
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
