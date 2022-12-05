import 'dart:convert';

ActivePresenceModel activePresenceModelFromJson(String str) =>
    ActivePresenceModel.fromJson(json.decode(str));

String activePresenceModelToJson(ActivePresenceModel data) =>
    json.encode(data.toJson());

class ActivePresenceModel {
  ActivePresenceModel({
    required this.message,
    required this.data,
  });

  String message;
  ActivePresenceData data;

  factory ActivePresenceModel.fromJson(Map<String, dynamic> json) =>
      ActivePresenceModel(
        message: json["message"],
        data: ActivePresenceData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class ActivePresenceData {
  ActivePresenceData({
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
    required this.subjectsSchedules,
    required this.rooms,
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
  String presenceDate;
  DateTime createdAt;
  DateTime updatedAt;
  ActivePresenceSubjectsSchedules subjectsSchedules;
  UsedRooms rooms;
  Lecturer users;

  factory ActivePresenceData.fromJson(Map<String, dynamic> json) =>
      ActivePresenceData(
        presenceId: json["presence_id"],
        subjectScheduleId: json["subject_schedule_id"],
        roomId: json["room_id"],
        userId: json["user_id"],
        isOpen: json["is_open"],
        waitingRoom: json["waiting_room"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        presenceDate: json["presence_date"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subjectsSchedules: ActivePresenceSubjectsSchedules.fromJson(
            json["subjects_schedules"]),
        rooms: UsedRooms.fromJson(json["rooms"]),
        users: Lecturer.fromJson(json["users"]),
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "subjects_schedules": subjectsSchedules.toJson(),
        "rooms": rooms.toJson(),
        "users": users.toJson(),
      };
}

class UsedRooms {
  UsedRooms({
    required this.name,
    required this.roomCode,
    required this.location,
  });

  String name;
  String roomCode;
  String location;

  factory UsedRooms.fromJson(Map<String, dynamic> json) => UsedRooms(
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

class ActivePresenceSubjectsSchedules {
  ActivePresenceSubjectsSchedules({
    required this.startTime,
    required this.finishTime,
    required this.subjects,
  });

  String startTime;
  String finishTime;
  ActivePresenceSubjects subjects;

  factory ActivePresenceSubjectsSchedules.fromJson(Map<String, dynamic> json) =>
      ActivePresenceSubjectsSchedules(
        startTime: json["start_time"],
        finishTime: json["finish_time"],
        subjects: ActivePresenceSubjects.fromJson(json["subjects"]),
      );

  Map<String, dynamic> toJson() => {
        "start_time": startTime,
        "finish_time": finishTime,
        "subjects": subjects.toJson(),
      };
}

class ActivePresenceSubjects {
  ActivePresenceSubjects({
    required this.name,
  });

  String name;

  factory ActivePresenceSubjects.fromJson(Map<String, dynamic> json) =>
      ActivePresenceSubjects(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Lecturer {
  Lecturer({
    required this.fullname,
  });

  String fullname;

  factory Lecturer.fromJson(Map<String, dynamic> json) => Lecturer(
        fullname: json["fullname"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
      };
}
