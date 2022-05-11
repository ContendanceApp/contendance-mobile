import 'dart:convert';

Presences presencesFromJson(String str) => Presences.fromJson(json.decode(str));

String presencesToJson(Presences data) => json.encode(data.toJson());

class Presences {
  Presences({
    required this.data,
  });

  Presence data;

  factory Presences.fromJson(Map<String, dynamic> json) => Presences(
        data: Presence.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Presence {
  Presence({
    required this.id,
    required this.userId,
    required this.ruanganId,
    required this.createdAt,
    required this.updatedAt,
    required this.ruangan,
  });

  int id;
  int userId;
  int ruanganId;
  DateTime createdAt;
  DateTime updatedAt;
  Ruangan ruangan;

  factory Presence.fromJson(Map<String, dynamic> json) => Presence(
        id: json["id"],
        userId: json["user_id"],
        ruanganId: json["ruangan_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        ruangan: Ruangan.fromJson(json["ruangan"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "ruangan_id": ruanganId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "ruangan": ruangan.toJson(),
      };
}

class Ruangan {
  Ruangan({
    required this.id,
    required this.name,
    required this.beaconId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  int beaconId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Ruangan.fromJson(Map<String, dynamic> json) => Ruangan(
        id: json["id"],
        name: json["name"],
        beaconId: json["beacon_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "beacon_id": beaconId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
