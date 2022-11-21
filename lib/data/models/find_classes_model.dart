import 'dart:convert';

FindClassesModel findClassesModelFromJson(String str) =>
    FindClassesModel.fromJson(json.decode(str));

String findClassesModelToJson(FindClassesModel data) =>
    json.encode(data.toJson());

class FindClassesModel {
  FindClassesModel({
    required this.message,
    required this.data,
  });

  String message;
  List<FindClassesData> data;

  factory FindClassesModel.fromJson(Map<String, dynamic> json) =>
      FindClassesModel(
        message: json["message"],
        data: List<FindClassesData>.from(
            json["data"].map((x) => FindClassesData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FindClassesData {
  FindClassesData({
    required this.subjectScheduleId,
    required this.subjectId,
    required this.userId,
    required this.studyGroupId,
    required this.roomId,
    required this.dayId,
    required this.startTime,
    required this.finishTime,
    required this.rooms,
    required this.studyGroups,
    required this.subjects,
    required this.users,
    required this.days,
  });

  int subjectScheduleId;
  int subjectId;
  int userId;
  int studyGroupId;
  int roomId;
  int dayId;
  String startTime;
  String finishTime;
  Rooms rooms;
  StudyGroups studyGroups;
  Subjects subjects;
  Users users;
  Days days;

  factory FindClassesData.fromJson(Map<String, dynamic> json) =>
      FindClassesData(
        subjectScheduleId: json["subject_schedule_id"],
        subjectId: json["subject_id"],
        userId: json["user_id"],
        studyGroupId: json["study_group_id"],
        roomId: json["room_id"],
        dayId: json["day_id"],
        startTime: json["start_time"],
        finishTime: json["finish_time"],
        rooms: Rooms.fromJson(json["rooms"]),
        studyGroups: StudyGroups.fromJson(json["study_groups"]),
        subjects: Subjects.fromJson(json["subjects"]),
        users: Users.fromJson(json["users"]),
        days: Days.fromJson(json["days"]),
      );

  Map<String, dynamic> toJson() => {
        "subject_schedule_id": subjectScheduleId,
        "subject_id": subjectId,
        "user_id": userId,
        "study_group_id": studyGroupId,
        "room_id": roomId,
        "day_id": dayId,
        "start_time": startTime,
        "finish_time": finishTime,
        "rooms": rooms.toJson(),
        "study_groups": studyGroups.toJson(),
        "subjects": subjects.toJson(),
        "users": users.toJson(),
        "days": days.toJson(),
      };
}

class Days {
  Days({
    required this.dayId,
    required this.day,
  });

  int dayId;
  String day;

  factory Days.fromJson(Map<String, dynamic> json) => Days(
        dayId: json["day_id"],
        day: json["day"],
      );

  Map<String, dynamic> toJson() => {
        "day_id": dayId,
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

class StudyGroups {
  StudyGroups({
    required this.name,
  });

  String name;

  factory StudyGroups.fromJson(Map<String, dynamic> json) => StudyGroups(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
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
  });

  String fullname;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        fullname: json["fullname"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
      };
}
