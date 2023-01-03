import 'dart:convert';

PresenceHistoryStudentModel presenceHistoryStudentModelFromJson(String str) =>
    PresenceHistoryStudentModel.fromJson(json.decode(str));

String presenceHistoryStudentModelToJson(PresenceHistoryStudentModel data) =>
    json.encode(data.toJson());

class PresenceHistoryStudentModel {
  PresenceHistoryStudentModel({
    required this.message,
    required this.data,
  });

  String message;
  Map<String, List<PresenceHistoryStudentData>> data;

  factory PresenceHistoryStudentModel.fromJson(Map<String, dynamic> json) =>
      PresenceHistoryStudentModel(
        message: json["message"],
        data: Map.from(json["data"]).map((k, v) =>
            MapEntry<String, List<PresenceHistoryStudentData>>(
                k,
                List<PresenceHistoryStudentData>.from(
                    v.map((x) => PresenceHistoryStudentData.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(
            k, List<dynamic>.from(v.map((x) => x.toJson())))),
      };
}

class PresenceHistoryStudentData {
  PresenceHistoryStudentData({
    required this.presenceDetailId,
    required this.presenceId,
    required this.userId,
    required this.presenceTime,
    required this.presenceDate,
    required this.isInclass,
    required this.isAdmited,
    required this.presences,
  });

  int presenceDetailId;
  int presenceId;
  int userId;
  DateTime presenceTime;
  DateTime presenceDate;
  bool isInclass;
  bool isAdmited;
  Presences presences;

  factory PresenceHistoryStudentData.fromJson(Map<String, dynamic> json) =>
      PresenceHistoryStudentData(
        presenceDetailId: json["presence_detail_id"],
        presenceId: json["presence_id"],
        userId: json["user_id"],
        presenceTime: DateTime.parse(json["presence_time"]),
        presenceDate: DateTime.parse(json["presence_date"]),
        isInclass: json["is_inclass"],
        isAdmited: json["is_admited"],
        presences: Presences.fromJson(json["presences"]),
      );

  Map<String, dynamic> toJson() => {
        "presence_detail_id": presenceDetailId,
        "presence_id": presenceId,
        "user_id": userId,
        "presence_time": presenceTime.toIso8601String(),
        "presence_date":
            "${presenceDate.year.toString().padLeft(4, '0')}-${presenceDate.month.toString().padLeft(2, '0')}-${presenceDate.day.toString().padLeft(2, '0')}",
        "is_inclass": isInclass,
        "is_admited": isAdmited,
        "presences": presences.toJson(),
      };
}

class Presences {
  Presences({
    required this.presenceId,
    required this.isOpen,
    required this.waitingRoom,
    required this.openTime,
    required this.closeTime,
    required this.rooms,
    required this.subjectsSchedules,
  });

  int presenceId;
  bool isOpen;
  bool waitingRoom;
  String openTime;
  String? closeTime;
  Rooms rooms;
  SubjectsSchedules subjectsSchedules;

  factory Presences.fromJson(Map<String, dynamic> json) => Presences(
        presenceId: json["presence_id"],
        isOpen: json["is_open"],
        waitingRoom: json["waiting_room"],
        openTime: json["open_time"],
        closeTime: json["close_time"] ?? null,
        rooms: Rooms.fromJson(json["rooms"]),
        subjectsSchedules:
            SubjectsSchedules.fromJson(json["subjects_schedules"]),
      );

  Map<String, dynamic> toJson() => {
        "presence_id": presenceId,
        "is_open": isOpen,
        "waiting_room": waitingRoom,
        "open_time": openTime,
        "close_time": closeTime ?? null,
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
    required this.startTime,
    required this.finishTime,
    required this.subjects,
    required this.studyGroups,
  });

  int subjectScheduleId;
  String startTime;
  String finishTime;
  Subjects subjects;
  StudyGroups studyGroups;

  factory SubjectsSchedules.fromJson(Map<String, dynamic> json) =>
      SubjectsSchedules(
        subjectScheduleId: json["subject_schedule_id"],
        startTime: json["start_time"],
        finishTime: json["finish_time"],
        subjects: Subjects.fromJson(json["subjects"]),
        studyGroups: StudyGroups.fromJson(json["study_groups"]),
      );

  Map<String, dynamic> toJson() => {
        "subject_schedule_id": subjectScheduleId,
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
