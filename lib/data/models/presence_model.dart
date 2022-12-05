import 'dart:convert';

PresenceModel presencesFromJson(String str) =>
    PresenceModel.fromJson(json.decode(str));

String presencesToJson(PresenceModel data) => json.encode(data.toJson());

class PresenceModel {
  PresenceModel({
    required this.data,
  });

  PresenceData data;

  factory PresenceModel.fromJson(Map<String, dynamic> json) => PresenceModel(
        data: PresenceData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

PresenceData presenceFromJson(String str) =>
    PresenceData.fromJson(json.decode(str));

String presenceToJson(PresenceData data) => json.encode(data.toJson());

class PresenceData {
  PresenceData({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory PresenceData.fromJson(Map<String, dynamic> json) => PresenceData(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Schedule {
  Schedule({
    required this.data,
  });

  Data data;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.subjectSchedule,
    required this.subject,
    required this.lecturer,
    required this.room,
  });

  SubjectSchedule subjectSchedule;
  Subject subject;
  Lecturer lecturer;
  RoomModel room;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        subjectSchedule: SubjectSchedule.fromJson(json["subject_schedule"]),
        subject: Subject.fromJson(json["subject"]),
        lecturer: Lecturer.fromJson(json["lecturer"]),
        room: RoomModel.fromJson(json["room"]),
      );

  Map<String, dynamic> toJson() => {
        "subject_schedule": subjectSchedule.toJson(),
        "subject": subject.toJson(),
        "lecturer": lecturer.toJson(),
        "room": room.toJson(),
      };
}

class Lecturer {
  Lecturer({
    required this.userId,
    required this.fullname,
    required this.email,
    required this.emailVerifiedAt,
    required this.sidEid,
    required this.gender,
    required this.roleId,
    required this.studyGroupId,
    required this.createdAt,
    required this.updatedAt,
  });

  int userId;
  String fullname;
  String email;
  DateTime emailVerifiedAt;
  double sidEid;
  String gender;
  int roleId;
  dynamic studyGroupId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Lecturer.fromJson(Map<String, dynamic> json) => Lecturer(
        userId: json["user_id"],
        fullname: json["fullname"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        sidEid: json["sid_eid"].toDouble(),
        gender: json["gender"],
        roleId: json["role_id"],
        studyGroupId: json["study_group_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "fullname": fullname,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "sid_eid": sidEid,
        "gender": gender,
        "role_id": roleId,
        "study_group_id": studyGroupId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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

class PresenceDetail {
  PresenceDetail({
    required this.presenceId,
    required this.userId,
    required this.isOpen,
    required this.openTime,
    required this.closeTime,
    required this.createdAt,
    required this.updatedAt,
  });

  int presenceId;
  int userId;
  bool isOpen;
  String openTime;
  String closeTime;
  DateTime createdAt;
  DateTime updatedAt;

  factory PresenceDetail.fromJson(Map<String, dynamic> json) => PresenceDetail(
        presenceId: json["presence_id"],
        userId: json["user_id"],
        isOpen: json["is_open"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "presence_id": presenceId,
        "user_id": userId,
        "is_open": isOpen,
        "open_time": openTime,
        "close_time": closeTime,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
