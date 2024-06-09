// To parse this JSON data, do
//
//     final userProfileModerl = userProfileModerlFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModerlFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModerlToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  Message message;
  Data data;

  UserProfileModel({
    required this.message,
    required this.data,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  String defaultImage;
  String imagePath;
  User user;

  Data({
    required this.defaultImage,
    required this.imagePath,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        defaultImage: json["default_image"],
        imagePath: json["image_path"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "default_image": defaultImage,
        "image_path": imagePath,
        "user": user.toJson(),
      };
}

class User {
  int id;
  dynamic firstname;
  dynamic lastname;
  int status;
  dynamic email;
  Address address;
  dynamic mobileCode;
  dynamic mobile;
  dynamic username;
  dynamic image;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.status,
    required this.email,
    required this.address,
    required this.mobileCode,
    required this.mobile,
    required this.username,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstname: json["firstname"] ?? '',
        lastname: json["lastname"] ?? '',
        status: json["status"],
        email: json["email"] ?? '',
        address: Address.fromJson(json["address"]),
        mobileCode: json["mobile_code"] ?? '',
        mobile: json["mobile"] ?? '',
        username: json["username"],
        image: json["image"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "status": status,
        "email": email,
        "address": address.toJson(),
        "mobile_code": mobileCode ?? '',
        "mobile": mobile ?? '',
        "username": username,
        "image": image ?? '',
      };
}

class Address {
  dynamic country;
  dynamic city;
  dynamic state;
  dynamic zip;
  dynamic address;

  Address({
    required this.country,
    required this.city,
    required this.state,
    required this.zip,
    required this.address,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        country: json["country"] ?? '',
        city: json["city"] ?? '',
        state: json["state"] ?? '',
        zip: json["zip"] ?? '',
        address: json["address"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "city": city,
        "state": state,
        "zip": zip,
        "address": address,
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
