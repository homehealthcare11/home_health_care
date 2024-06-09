import 'dart:convert';

ForgotPasswordEmailModel forgotPasswordEmailModelFromJson(String str) =>
    ForgotPasswordEmailModel.fromJson(json.decode(str));

String forgotPasswordEmailModelToJson(ForgotPasswordEmailModel data) =>
    json.encode(data.toJson());

class ForgotPasswordEmailModel {
  ForgotPasswordEmailModel({
    required this.message,
    required this.data,
  });

  Message message;
  Data data;

  factory ForgotPasswordEmailModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordEmailModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.user,
  });

  User user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.userId,
    required this.token,
    required this.code,
    required this.id,
  });

  int userId;
  String token;
  int code;

  int id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        token: json["token"],
        code: json["code"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "token": token,
        "code": code,
        "id": id,
      };
}

class Message {
  Message({
    required this.success,
  });

  List<String> success;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        success: List<String>.from(json["success"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": List<dynamic>.from(success.map((x) => x)),
      };
}
