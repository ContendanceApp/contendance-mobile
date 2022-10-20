import 'dart:convert';

PresenceHistoryLecturerModel presenceHistoryLecturerModelFromJson(String str) =>
    PresenceHistoryLecturerModel.fromJson(json.decode(str));

String presenceHistoryLecturerModelToJson(PresenceHistoryLecturerModel data) =>
    json.encode(data.toJson());

class PresenceHistoryLecturerModel {
  PresenceHistoryLecturerModel({
    required this.message,
    required this.data,
  });

  String message;
  List<PresenceHistoryLecturerData> data;

  factory PresenceHistoryLecturerModel.fromJson(Map<String, dynamic> json) =>
      PresenceHistoryLecturerModel(
        message: json["message"],
        data: List<PresenceHistoryLecturerData>.from(
            json["data"].map((x) => PresenceHistoryLecturerData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PresenceHistoryLecturerData {
  PresenceHistoryLecturerData({
    required this.presenceId,
    required this.subjectScheduleId,
    required this.roomId,
    required this.userId,
    required this.isOpen,
    required this.waitingRoom,
    required this.openTime,
    required this.closeTime,
    required this.presenceDate,
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
  String? closeTime;
  String presenceDate;
  Rooms rooms;
  SubjectsSchedules subjectsSchedules;

  factory PresenceHistoryLecturerData.fromJson(Map<String, dynamic> json) =>
      PresenceHistoryLecturerData(
        presenceId: json["presence_id"],
        subjectScheduleId: json["subject_schedule_id"],
        roomId: json["room_id"],
        userId: json["user_id"],
        isOpen: json["is_open"],
        waitingRoom: json["waiting_room"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        presenceDate: json["presence_date"],
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
    required this.subjectScheduleId,
    required this.subjectId,
    required this.userId,
    required this.studyGroupId,
    required this.roomId,
    required this.dayId,
    required this.startTime,
    required this.finishTime,
    required this.subjects,
    required this.studyGroups,
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
  StudyGroups studyGroups;

  factory SubjectsSchedules.fromJson(Map<String, dynamic> json) =>
      SubjectsSchedules(
        subjectScheduleId: json["subject_schedule_id"],
        subjectId: json["subject_id"],
        userId: json["user_id"],
        studyGroupId: json["study_group_id"],
        roomId: json["room_id"],
        dayId: json["day_id"],
        startTime: json["start_time"],
        finishTime: json["finish_time"],
        subjects: Subjects.fromJson(json["subjects"]),
        studyGroups: StudyGroups.fromJson(json["study_groups"]),
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
        "study_groups": studyGroups.toJson(),
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
