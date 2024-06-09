// To parse this JSON data, do
//
//     final userNotificationModel = userNotificationModelFromJson(jsonString);

import 'dart:convert';

UserNotificationModel userNotificationModelFromJson(String str) =>
    UserNotificationModel.fromJson(json.decode(str));

String userNotificationModelToJson(UserNotificationModel data) =>
    json.encode(data.toJson());

class UserNotificationModel {
  UserNotificationModelMessage message;
  Data data;

  UserNotificationModel({
    required this.message,
    required this.data,
  });

  factory UserNotificationModel.fromJson(Map<String, dynamic> json) =>
      UserNotificationModel(
        message: UserNotificationModelMessage.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  List<UserNotification> userNotification;

  Data({
    required this.userNotification,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userNotification: List<UserNotification>.from(
            json["user_notification"].map((x) => UserNotification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user_notification":
            List<dynamic>.from(userNotification.map((x) => x.toJson())),
      };
}

class UserNotification {
  int id;
  int userId;
  dynamic type;
  UserNotificationMessage message;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  UserNotification({
    required this.id,
    required this.userId,
    required this.type,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory UserNotification.fromJson(Map<String, dynamic> json) =>
      UserNotification(
        id: json["id"],
        userId: json["user_id"],
        type: json["type"] ?? '',
        message: UserNotificationMessage.fromJson(json["message"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "type": type,
        "message": message.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
      };
}

class UserNotificationMessage {
  dynamic title;
  dynamic message;
  dynamic time;
  dynamic image;

  UserNotificationMessage({
    required this.title,
    required this.message,
    required this.time,
    required this.image,
  });

  factory UserNotificationMessage.fromJson(Map<String, dynamic> json) =>
      UserNotificationMessage(
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

class User {
  int id;
  dynamic firstname;
  dynamic lastname;
  dynamic username;
  dynamic email;

  int status;
  Address address;


  dynamic fullname;

  StringStatus stringStatus;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.status,
    required this.address,


    required this.fullname,
    required this.stringStatus,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstname: json["firstname"] ?? '',
        lastname: json["lastname"] ?? '',
        username: json["username"] ?? '',
        email: json["email"] ?? '',
        status: json["status"],
        address: Address.fromJson(json["address"]),


        fullname: json["fullname"],
        stringStatus: StringStatus.fromJson(json["stringStatus"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "email": email,
        "status": status,
        "address": address.toJson(),


        "fullname": fullname,
        "stringStatus": stringStatus.toJson(),
      };
}

class Address {
  dynamic country;
  dynamic state;
  dynamic city;
  dynamic zip;
  dynamic address;

  Address({
    required this.country,
    required this.state,
    required this.city,
    required this.zip,
    required this.address,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        country: json["country"] ?? '',
        state: json["state"] ?? '',
        city: json["city"] ?? '',
        zip: json["zip"] ?? '',
        address: json["address"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "state": state,
        "city": city,
        "zip": zip,
        "address": address,
      };
}

class StringStatus {
  dynamic stringStatusClass;
  dynamic value;

  StringStatus({
    required this.stringStatusClass,
    required this.value,
  });

  factory StringStatus.fromJson(Map<String, dynamic> json) => StringStatus(
        stringStatusClass: json["class"] ?? '',
        value: json["value"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "class": stringStatusClass,
        "value": value,
      };
}

class UserNotificationModelMessage {
  List<String> success;

  UserNotificationModelMessage({
    required this.success,
  });

  factory UserNotificationModelMessage.fromJson(Map<String, dynamic> json) =>
      UserNotificationModelMessage(
        success: List<String>.from(json["success"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": List<dynamic>.from(success.map((x) => x)),
      };
}
