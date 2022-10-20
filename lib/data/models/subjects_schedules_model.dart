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
    required this.subjectScheduleId,
    required this.startTime,
    required this.finishTime,
    required this.days,
    required this.rooms,
    required this.subjects,
    required this.users,
  });

  int subjectScheduleId;
  String startTime;
  String finishTime;
  Days days;
  Rooms rooms;
  Subjects subjects;
  Users users;

  factory SubjectsSchedulesData.fromJson(Map<String, dynamic> json) =>
      SubjectsSchedulesData(
        subjectScheduleId: json["subject_schedule_id"],
        startTime: json["start_time"],
        finishTime: json["finish_time"],
        days: Days.fromJson(json["days"]),
        rooms: Rooms.fromJson(json["rooms"]),
        subjects: Subjects.fromJson(json["subjects"]),
        users: Users.fromJson(json["users"]),
      );

  Map<String, dynamic> toJson() => {
        "subject_schedule_id": subjectScheduleId,
        "start_time": startTime,
        "finish_time": finishTime,
        "days": days.toJson(),
        "rooms": rooms.toJson(),
        "subjects": subjects.toJson(),
        "users": users.toJson(),
      };
}

class Days {
  Days({
    required this.day,
  });

  String day;

  factory Days.fromJson(Map<String, dynamic> json) => Days(
        day: json["day"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
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
