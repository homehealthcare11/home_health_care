import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    required this.message,
    required this.data,
  });

  Message message;
  Data data;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
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
    required this.token,
    required this.imagePath,
    required this.defaultImage,
    required this.user,
  });

  String token;
  String imagePath;
  String defaultImage;
  User user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        imagePath: json["image_path"] ?? '',
        defaultImage: json["default_image"] ?? '',
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "image_path": imagePath,
        "default_image": defaultImage,
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.status,
    required this.email,
    this.image,
    required this.emailVerified,
    required this.smsVerified,
    required this.kycVerified,
  });

  int id;
  dynamic firstName;
  dynamic lastName;
  dynamic username;
  int status;
  dynamic email;
  dynamic image;

  int emailVerified;
  int smsVerified;
  int kycVerified;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        username: json["username"] ?? '',
        status: json["status"],
        email: json["email"] ?? '',
        image: json["image"] ?? '',
        emailVerified: json["email_verified"] ?? "",
        smsVerified: json["sms_verified"],
        kycVerified: json["kyc_verified"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "status": status,
        "email": email,
        "image": image,
        "email_verified": emailVerified,
        "sms_verified": smsVerified,
        "kyc_verified": kycVerified,
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
