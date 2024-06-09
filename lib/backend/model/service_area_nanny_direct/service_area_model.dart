// To parse this JSON data, do
//
//     final serviceAreaModel = serviceAreaModelFromJson(jsonString);

import 'dart:convert';

ServiceAreaModel serviceAreaModelFromJson(String str) =>
    ServiceAreaModel.fromJson(json.decode(str));

String serviceAreaModelToJson(ServiceAreaModel data) =>
    json.encode(data.toJson());

class ServiceAreaModel {
  Message message;
  List<Datum> data;

  ServiceAreaModel({
    required this.message,
    required this.data,
  });

  factory ServiceAreaModel.fromJson(Map<String, dynamic> json) =>
      ServiceAreaModel(
        message: Message.fromJson(json["message"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String serviceArea;
  String slug;

  Datum({
    required this.id,
    required this.serviceArea,
    required this.slug,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        serviceArea: json["service_area"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "service_area": serviceArea,
        "slug": slug,
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
