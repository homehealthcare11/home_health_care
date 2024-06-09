import 'dart:convert';

ResetOtpModel resetOtpModelFromJson(String str) =>
    ResetOtpModel.fromJson(json.decode(str));

String resetOtpModelToJson(ResetOtpModel data) => json.encode(data.toJson());

class ResetOtpModel {
  ResetOtpModel({
    required this.message,
    required this.data,
  });

  Message message;
  Data data;

  factory ResetOtpModel.fromJson(Map<String, dynamic> json) => ResetOtpModel(
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
    required this.passwordResetData,
  });

  PasswordResetData passwordResetData;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        passwordResetData:
            PasswordResetData.fromJson(json["password_reset_data"]),
      );

  Map<String, dynamic> toJson() => {
        "password_reset_data": passwordResetData.toJson(),
      };
}

class PasswordResetData {
  PasswordResetData({
    required this.id,
    this.email,
    required this.code,
    required this.token,
    required this.userId,
  });

  int id;
  dynamic email;
  int code;
  String token;
  int userId;

  factory PasswordResetData.fromJson(Map<String, dynamic> json) =>
      PasswordResetData(
        id: json["id"],
        email: json["email"],
        code: json["code"],
        token: json["token"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "code": code,
        "token": token,
        "user_id": userId,
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
