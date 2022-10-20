import 'dart:convert';

PresenceHistoryModel presenceHistoryFromJson(String str) =>
    PresenceHistoryModel.fromJson(json.decode(str));

String presenceHistoryToJson(PresenceHistoryModel data) =>
    json.encode(data.toJson());

class PresenceHistoryModel {
  PresenceHistoryModel({
    required this.subject,
    required this.acronym,
    required this.lab,
    required this.presenceTime,
    this.isExpanded = false,
  });

  String subject;
  String acronym;
  String lab;
  String presenceTime;
  bool isExpanded;

  factory PresenceHistoryModel.fromJson(Map<String, dynamic> json) =>
      PresenceHistoryModel(
        subject: json["subject"],
        acronym: json["acronym"],
        lab: json["lab"],
        presenceTime: json["presenceTime"],
        isExpanded: json["isExpanded"],
      );

  Map<String, dynamic> toJson() => {
        "subject": subject,
        "acronym": acronym,
        "lab": lab,
        "presenceTime": presenceTime,
        "isExpanded": isExpanded,
      };
}
