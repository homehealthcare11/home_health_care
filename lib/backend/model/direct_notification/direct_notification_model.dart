// To parse this JSON data, do
//
//     final directNotificationModel = directNotificationModelFromJson(jsonString);

import 'dart:convert';

DirectNotificationModel directNotificationModelFromJson(String str) =>
    DirectNotificationModel.fromJson(json.decode(str));

String directNotificationModelToJson(DirectNotificationModel data) =>
    json.encode(data.toJson());

class DirectNotificationModel {
  DirectNotificationModelMessage message;
  Data data;

  DirectNotificationModel({
    required this.message,
    required this.data,
  });

  factory DirectNotificationModel.fromJson(Map<String, dynamic> json) =>
      DirectNotificationModel(
        message: DirectNotificationModelMessage.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  List<NannyNotification> nannyNotification;

  Data({
    required this.nannyNotification,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nannyNotification: List<NannyNotification>.from(
            json["nanny_notification"]
                .map((x) => NannyNotification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nanny_notification":
            List<dynamic>.from(nannyNotification.map((x) => x.toJson())),
      };
}

class NannyNotification {
  int id;
  int nannyId;
  dynamic type;
  NannyNotificationMessage message;

  NannyNotification({
    required this.id,
    required this.nannyId,
    required this.type,
    required this.message,
  });

  factory NannyNotification.fromJson(Map<String, dynamic> json) =>
      NannyNotification(
        id: json["id"],
        nannyId: json["nanny_id"],
        type: json["type"] ?? '',
        message: NannyNotificationMessage.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nanny_id": nannyId,
        "type": type,
        "message": message.toJson(),
      };
}

class NannyNotificationMessage {
  dynamic title;
  dynamic message;
  dynamic time;
  dynamic image;

  NannyNotificationMessage({
    required this.title,
    required this.message,
    required this.time,
    required this.image,
  });

  factory NannyNotificationMessage.fromJson(Map<String, dynamic> json) =>
      NannyNotificationMessage(
        title: json["title"] ?? '',
        message: json["message"] ?? '',
        time: json["time"] ?? '',
        image: json["image"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "message": message,
        "time": time,
        "image": image,
      };
}

class DirectNotificationModelMessage {
  List<String> success;

  DirectNotificationModelMessage({
    required this.success,
  });

  factory DirectNotificationModelMessage.fromJson(Map<String, dynamic> json) =>
      DirectNotificationModelMessage(
        success: List<String>.from(json["success"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": List<dynamic>.from(success.map((x) => x)),
      };
}
