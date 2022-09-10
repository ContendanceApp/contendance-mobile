import 'dart:convert';

LoginModel loginFromJson(String str) => LoginModel.fromJson(json.decode(str));
String loginToJson(LoginModel data) => json.encode(data.toJson());

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));
String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.message,
  });

  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? message;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "message": message,
      };
}

class UserInfo {
  UserInfo({
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
    required this.studyGroup,
  });

  int userId;
  String fullname;
  String email;
  DateTime emailVerifiedAt;
  int sidEid;
  String gender;
  int roleId;
  int? studyGroupId;
  DateTime createdAt;
  DateTime updatedAt;
  StudyGroup? studyGroup;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        userId: json["user_id"],
        fullname: json["fullname"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        sidEid: json["sid_eid"],
        gender: json["gender"],
        roleId: json["role_id"],
        studyGroupId: json["study_group_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        studyGroup: json["study_group"] != null
            ? StudyGroup.fromJson(json["study_group"])
            : null,
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
        "study_group": studyGroup?.toJson(),
      };
}

class StudyGroup {
  StudyGroup({
    required this.studyGroupId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int studyGroupId;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory StudyGroup.fromJson(Map<String, dynamic> json) => StudyGroup(
        studyGroupId: json["study_group_id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "study_group_id": studyGroupId,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
