import 'dart:convert';

SuccessPresenceModel successPresenceModelFromJson(String str) =>
    SuccessPresenceModel.fromJson(json.decode(str));

String successPresenceModelToJson(SuccessPresenceModel data) =>
    json.encode(data.toJson());

class SuccessPresenceModel {
  SuccessPresenceModel({
    required this.message,
    required this.data,
  });

  String message;
  SuccessPresenceData data;

  factory SuccessPresenceModel.fromJson(Map<String, dynamic> json) =>
      SuccessPresenceModel(
        message: json["message"],
        data: SuccessPresenceData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class SuccessPresenceData {
  SuccessPresenceData({
    required this.presenceDetailId,
    required this.presenceId,
    required this.userId,
    required this.presenceTime,
    required this.presenceDate,
    required this.isInclass,
    required this.isAdmited,
    required this.createdAt,
    required this.updatedAt,
    required this.presences,
  });

  int presenceDetailId;
  int presenceId;
  int userId;
  DateTime presenceTime;
  String presenceDate;
  bool isInclass;
  bool isAdmited;
  DateTime createdAt;
  DateTime updatedAt;
  Presences presences;

  factory SuccessPresenceData.fromJson(Map<String, dynamic> json) =>
      SuccessPresenceData(
        presenceDetailId: json["presence_detail_id"],
        presenceId: json["presence_id"],
        userId: json["user_id"],
        presenceTime: DateTime.parse(json["presence_time"]),
        presenceDate: json["presence_date"],
        isInclass: json["is_inclass"],
        isAdmited: json["is_admited"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        presences: Presences.fromJson(json["presences"]),
      );

  Map<String, dynamic> toJson() => {
        "presence_detail_id": presenceDetailId,
        "presence_id": presenceId,
        "user_id": userId,
        "presence_time": presenceTime.toIso8601String(),
        "presence_date": presenceDate,
        "is_inclass": isInclass,
        "is_admited": isAdmited,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "presences": presences.toJson(),
      };
}

class Presences {
  Presences({
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
    required this.rooms,
    required this.subjectsSchedules,
    required this.users,
  });

  int presenceId;
  int subjectScheduleId;
  int roomId;
  int userId;
  bool isOpen;
  bool waitingRoom;
  String openTime;
  dynamic closeTime;
  DateTime presenceDate;
  DateTime createdAt;
  DateTime updatedAt;
  Rooms rooms;
  SubjectsSchedules subjectsSchedules;
  Users users;

  factory Presences.fromJson(Map<String, dynamic> json) => Presences(
        presenceId: json["presence_id"],
        subjectScheduleId: json["subject_schedule_id"],
        roomId: json["room_id"],
        userId: json["user_id"],
        isOpen: json["is_open"],
        waitingRoom: json["waiting_room"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        presenceDate: DateTime.parse(json["presence_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        rooms: Rooms.fromJson(json["rooms"]),
        subjectsSchedules:
            SubjectsSchedules.fromJson(json["subjects_schedules"]),
        users: Users.fromJson(json["users"]),
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
        "presence_date": presenceDate.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "rooms": rooms.toJson(),
        "subjects_schedules": subjectsSchedules.toJson(),
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

class SubjectsSchedules {
  SubjectsSchedules({
    required this.startTime,
    required this.finishTime,
    required this.subjects,
  });

  String startTime;
  String finishTime;
  Subjects subjects;

  factory SubjectsSchedules.fromJson(Map<String, dynamic> json) =>
      SubjectsSchedules(
        startTime: json["start_time"],
        finishTime: json["finish_time"],
        subjects: Subjects.fromJson(json["subjects"]),
      );

  Map<String, dynamic> toJson() => {
        "start_time": startTime,
        "finish_time": finishTime,
        "subjects": subjects.toJson(),
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
    required this.roleId,
  });

  String fullname;
  String sidEid;
  int roleId;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        fullname: json["fullname"],
        sidEid: json["sid_eid"],
        roleId: json["role_id"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "sid_eid": sidEid,
        "role_id": roleId,
      };
}
