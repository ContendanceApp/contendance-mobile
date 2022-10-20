import 'dart:convert';

DetailClassModel detailClassModelFromJson(String str) =>
    DetailClassModel.fromJson(json.decode(str));

String detailClassModelToJson(DetailClassModel data) =>
    json.encode(data.toJson());

class DetailClassModel {
  DetailClassModel({
    required this.message,
    required this.data,
  });

  String message;
  DetailClassData data;

  factory DetailClassModel.fromJson(Map<String, dynamic> json) =>
      DetailClassModel(
        message: json["message"],
        data: DetailClassData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class DetailClassData {
  DetailClassData({
    required this.presenceId,
    required this.isOpen,
    required this.waitingRoom,
    required this.openTime,
    required this.closeTime,
    required this.presenceDate,
    required this.rooms,
    required this.subjectsSchedules,
    required this.users,
  });

  int presenceId;
  bool isOpen;
  bool waitingRoom;
  String openTime;
  dynamic closeTime;
  String presenceDate;
  Rooms rooms;
  SubjectsSchedules subjectsSchedules;
  List<User> users;

  factory DetailClassData.fromJson(Map<String, dynamic> json) =>
      DetailClassData(
        presenceId: json["presence_id"],
        isOpen: json["is_open"],
        waitingRoom: json["waiting_room"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        presenceDate: json["presence_date"],
        rooms: Rooms.fromJson(json["rooms"]),
        subjectsSchedules:
            SubjectsSchedules.fromJson(json["subjects_schedules"]),
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "presence_id": presenceId,
        "is_open": isOpen,
        "waiting_room": waitingRoom,
        "open_time": openTime,
        "close_time": closeTime,
        "presence_date": presenceDate,
        "rooms": rooms.toJson(),
        "subjects_schedules": subjectsSchedules.toJson(),
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
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
    required this.subjectScheduleId,
    required this.startTime,
    required this.finishTime,
    required this.subjects,
  });

  int subjectScheduleId;
  String startTime;
  String finishTime;
  Subjects subjects;

  factory SubjectsSchedules.fromJson(Map<String, dynamic> json) =>
      SubjectsSchedules(
        subjectScheduleId: json["subject_schedule_id"],
        startTime: json["start_time"],
        finishTime: json["finish_time"],
        subjects: Subjects.fromJson(json["subjects"]),
      );

  Map<String, dynamic> toJson() => {
        "subject_schedule_id": subjectScheduleId,
        "start_time": startTime,
        "finish_time": finishTime,
        "subjects": subjects.toJson(),
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

class User {
  User({
    required this.presenceDetailId,
    required this.presenceId,
    required this.userId,
    required this.presenceTime,
    required this.presenceDate,
    required this.isInclass,
    required this.isAdmited,
    required this.users,
  });

  int presenceDetailId;
  int presenceId;
  int userId;
  String presenceTime;
  String presenceDate;
  bool isInclass;
  bool isAdmited;
  Users users;

  factory User.fromJson(Map<String, dynamic> json) => User(
        presenceDetailId: json["presence_detail_id"],
        presenceId: json["presence_id"],
        userId: json["user_id"],
        presenceTime: json["presence_time"],
        presenceDate: json["presence_date"],
        isInclass: json["is_inclass"],
        isAdmited: json["is_admited"],
        users: Users.fromJson(json["users"]),
      );

  Map<String, dynamic> toJson() => {
        "presence_detail_id": presenceDetailId,
        "presence_id": presenceId,
        "user_id": userId,
        "presence_time": presenceTime,
        "presence_date": presenceDate,
        "is_inclass": isInclass,
        "is_admited": isAdmited,
        "users": users.toJson(),
      };
}

class Users {
  Users({
    required this.fullname,
    required this.gender,
    required this.sidEid,
    required this.studyGroups,
  });

  String fullname;
  String gender;
  String sidEid;
  StudyGroups studyGroups;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        fullname: json["fullname"],
        gender: json["gender"],
        sidEid: json["sid_eid"],
        studyGroups: StudyGroups.fromJson(json["study_groups"]),
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "gender": gender,
        "sid_eid": sidEid,
        "study_groups": studyGroups.toJson(),
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
