import 'dart:convert';

ResetOtpDirectModel resetOtpModelFromJson(String str) =>
    ResetOtpDirectModel.fromJson(json.decode(str));

String resetOtpModelToJson(ResetOtpDirectModel data) =>
    json.encode(data.toJson());

class ResetOtpDirectModel {
  ResetOtpDirectModel({
    required this.message,
    required this.data,
  });

  Message message;
  Data data;

  factory ResetOtpDirectModel.fromJson(Map<String, dynamic> json) =>
      ResetOtpDirectModel(
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
    required this.nannyId,
  });

  int id;
  dynamic email;
  int code;
  String token;
  int nannyId;

  factory PasswordResetData.fromJson(Map<String, dynamic> json) =>
      PasswordResetData(
        id: json["id"],
        email: json["email"] ?? '',
        code: json["code"],
        token: json["token"],
        nannyId: json["nanny_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "code": code,
        "token": token,
        "nanny_id": nannyId,
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
