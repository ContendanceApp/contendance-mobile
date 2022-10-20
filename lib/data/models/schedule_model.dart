import 'dart:convert';

ScheduleModel scheduleModelFromJson(String str) =>
    ScheduleModel.fromJson(json.decode(str));

String scheduleModelToJson(ScheduleModel data) => json.encode(data.toJson());

class ScheduleModel {
  ScheduleModel({
    required this.message,
    required this.data,
  });

  String message;
  List<ScheduleData> data;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        message: json["message"],
        data: List<ScheduleData>.from(
            json["data"].map((x) => ScheduleData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ScheduleData {
  ScheduleData({
    required this.subjectScheduleId,
    required this.subjectId,
    required this.userId,
    required this.studyGroupId,
    required this.roomId,
    required this.dayId,
    required this.startTime,
    required this.finishTime,
    required this.subjects,
    required this.users,
    required this.days,
    required this.studyGroups,
    required this.rooms,
  });

  int subjectScheduleId;
  int subjectId;
  int userId;
  int studyGroupId;
  int roomId;
  int dayId;
  String startTime;
  String finishTime;
  Subjects subjects;
  Users users;
  Days days;
  StudyGroups studyGroups;
  Rooms rooms;

  factory ScheduleData.fromJson(Map<String, dynamic> json) => ScheduleData(
        subjectScheduleId: json["subject_schedule_id"],
        subjectId: json["subject_id"],
        userId: json["user_id"],
        studyGroupId: json["study_group_id"],
        roomId: json["room_id"],
        dayId: json["day_id"],
        startTime: json["start_time"],
        finishTime: json["finish_time"],
        subjects: Subjects.fromJson(json["subjects"]),
        users: Users.fromJson(json["users"]),
        days: Days.fromJson(json["days"]),
        studyGroups: StudyGroups.fromJson(json["study_groups"]),
        rooms: Rooms.fromJson(json["rooms"]),
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
        "subjects": subjects.toJson(),
        "users": users.toJson(),
        "days": days.toJson(),
        "study_groups": studyGroups.toJson(),
        "rooms": rooms.toJson(),
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
    required this.roomId,
    required this.beaconId,
    required this.name,
    required this.roomCode,
    required this.location,
    required this.description,
  });

  int roomId;
  int beaconId;
  String name;
  String roomCode;
  String location;
  String description;

  factory Rooms.fromJson(Map<String, dynamic> json) => Rooms(
        roomId: json["room_id"],
        beaconId: json["beacon_id"],
        name: json["name"],
        roomCode: json["room_code"],
        location: json["location"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "beacon_id": beaconId,
        "name": name,
        "room_code": roomCode,
        "location": location,
        "description": description,
      };
}

class StudyGroups {
  StudyGroups({
    required this.studyGroupId,
    required this.name,
    required this.year,
  });

  int studyGroupId;
  String name;
  int year;

  factory StudyGroups.fromJson(Map<String, dynamic> json) => StudyGroups(
        studyGroupId: json["study_group_id"],
        name: json["name"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "study_group_id": studyGroupId,
        "name": name,
        "year": year,
      };
}

class Subjects {
  Subjects({
    required this.subjectId,
    required this.name,
    required this.acronym,
  });

  int subjectId;
  String name;
  String acronym;

  factory Subjects.fromJson(Map<String, dynamic> json) => Subjects(
        subjectId: json["subject_id"],
        name: json["name"],
        acronym: json["acronym"],
      );

  Map<String, dynamic> toJson() => {
        "subject_id": subjectId,
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
