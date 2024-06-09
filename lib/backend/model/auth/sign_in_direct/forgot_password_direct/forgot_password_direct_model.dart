import 'dart:convert';

ForgotPasswordEmailDirectModel forgotPasswordEmailDirectModelFromJson(
        String str) =>
    ForgotPasswordEmailDirectModel.fromJson(json.decode(str));

String forgotPasswordEmailDirectModelToJson(
        ForgotPasswordEmailDirectModel data) =>
    json.encode(data.toJson());

class ForgotPasswordEmailDirectModel {
  Message message;
  Data data;

  ForgotPasswordEmailDirectModel({
    required this.message,
    required this.data,
  });

  factory ForgotPasswordEmailDirectModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordEmailDirectModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Nanny nanny;

  Data({
    required this.nanny,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nanny: Nanny.fromJson(json["nanny"]),
      );

  Map<String, dynamic> toJson() => {
        "nanny": nanny.toJson(),
      };
}

class Nanny {
  int nannyId;
  String token;
  int code;
  String email;

  int id;

  Nanny({
    required this.nannyId,
    required this.token,
    required this.code,
    required this.email,
    required this.id,
  });

  factory Nanny.fromJson(Map<String, dynamic> json) => Nanny(
        nannyId: json["nanny_id"],
        token: json["token"],
        code: json["code"],
        email: json["email"] ?? '',
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "nanny_id": nannyId,
        "token": token,
        "code": code,
        "email": email,
        "id": id,
      };
}

class Message {
  List<String> success;

  Message({
    required this.success,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        success: List<String>.from(json["success"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": List<dynamic>.from(success.map((x) => x)),
      };
}
