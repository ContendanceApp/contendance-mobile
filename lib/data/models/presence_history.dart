import 'dart:convert';

PresenceHistory presenceHistoryFromJson(String str) =>
    PresenceHistory.fromJson(json.decode(str));

String presenceHistoryToJson(PresenceHistory data) =>
    json.encode(data.toJson());

class PresenceHistory {
  PresenceHistory({
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

  factory PresenceHistory.fromJson(Map<String, dynamic> json) =>
      PresenceHistory(
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
