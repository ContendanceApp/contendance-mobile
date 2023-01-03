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
  Map<String, List<PresenceHistoryLecturerData>> data;

  factory PresenceHistoryLecturerModel.fromJson(Map<String, dynamic> json) =>
      PresenceHistoryLecturerModel(
        message: json["message"],
        data: Map.from(json["data"]).map((k, v) =>
            MapEntry<String, List<PresenceHistoryLecturerData>>(
                k,
                List<PresenceHistoryLecturerData>.from(
                    v.map((x) => PresenceHistoryLecturerData.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(
            k, List<dynamic>.from(v.map((x) => x.toJson())))),
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
  DateTime openTime;
  dynamic closeTime;
  DateTime presenceDate;
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
        openTime: DateTime.parse(json["open_time"]),
        closeTime: json["close_time"],
        presenceDate: DateTime.parse(json["presence_date"]),
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
        "open_time": openTime.toIso8601String(),
        "close_time": closeTime,
        "presence_date":
            "${presenceDate.year.toString().padLeft(4, '0')}-${presenceDate.month.toString().padLeft(2, '0')}-${presenceDate.day.toString().padLeft(2, '0')}",
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
