import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.message,
  });

  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? message;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
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
