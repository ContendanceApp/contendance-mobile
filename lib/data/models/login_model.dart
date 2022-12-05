import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.message,
    required this.data,
  });

  String message;
  Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.user,
    required this.token,
  });

  UserInfo user;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: UserInfo.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class UserInfo {
  UserInfo({
    required this.userId,
    required this.fullname,
    required this.email,
    required this.sidEid,
    required this.gender,
    required this.roleId,
    required this.studyGroupId,
    required this.createdAt,
    required this.updatedAt,
    required this.roles,
    this.studyGroups,
  });

  int userId;
  String fullname;
  String email;
  String sidEid;
  String gender;
  int roleId;
  int? studyGroupId;
  DateTime createdAt;
  DateTime updatedAt;
  Roles roles;
  StudyGroups? studyGroups;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        userId: json["user_id"],
        fullname: json["fullname"],
        email: json["email"],
        sidEid: json["sid_eid"],
        gender: json["gender"],
        roleId: json["role_id"],
        studyGroupId: json["study_group_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        roles: Roles.fromJson(json["roles"]),
        studyGroups: json["study_groups"] != null
            ? StudyGroups.fromJson(json["study_groups"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "fullname": fullname,
        "email": email,
        "sid_eid": sidEid,
        "gender": gender,
        "role_id": roleId,
        "study_group_id": studyGroupId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "roles": roles.toJson(),
        "study_groups": studyGroups?.toJson(),
      };
}

class Roles {
  Roles({
    required this.roleId,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  int roleId;
  String role;
  DateTime createdAt;
  DateTime updatedAt;

  factory Roles.fromJson(Map<String, dynamic> json) => Roles(
        roleId: json["role_id"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "role_id": roleId,
        "role": role,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class StudyGroups {
  StudyGroups({
    required this.studyGroupId,
    required this.name,
    required this.year,
    required this.createdAt,
    required this.updatedAt,
  });

  int studyGroupId;
  String name;
  int year;
  DateTime createdAt;
  DateTime updatedAt;

  factory StudyGroups.fromJson(Map<String, dynamic> json) => StudyGroups(
        studyGroupId: json["study_group_id"],
        name: json["name"],
        year: json["year"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "study_group_id": studyGroupId,
        "name": name,
        "year": year,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
