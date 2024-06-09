import 'dart:convert';

SignUpModelDirect signUpModelDirectFromJson(String str) =>
    SignUpModelDirect.fromJson(json.decode(str));

String signUpModelDirectToJson(SignUpModelDirect data) =>
    json.encode(data.toJson());

class SignUpModelDirect {
  Message message;
  Data data;

  SignUpModelDirect({
    required this.message,
    required this.data,
  });

  factory SignUpModelDirect.fromJson(Map<String, dynamic> json) =>
      SignUpModelDirect(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  String token;
  String baseUrl;
  String imagePath;
  String defaultImage;
  Nanny nanny;

  Data({
    required this.token,
    required this.baseUrl,
    required this.imagePath,
    required this.defaultImage,
    required this.nanny,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        baseUrl: json["base_url"],
        imagePath: json["image_path"],
        defaultImage: json["default_image"],
        nanny: Nanny.fromJson(json["nanny"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "base_url": baseUrl,
        "image_path": imagePath,
        "default_image": defaultImage,
        "nanny": nanny.toJson(),
      };
}

class Nanny {
  int id;
  String firstName;
  String lastName;
  String username;
  int status;
  String email;
  String mobileCode;
  String mobile;
  Address? address;
  String fullMobile;
  String image;
  int emailVerified;
  int smsVerified;
  int twoFactorVerified;

  Nanny({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.status,
    required this.email,
    required this.mobileCode,
    required this.mobile,
    required this.address,
    required this.fullMobile,
    required this.image,
    required this.emailVerified,
    required this.smsVerified,
    required this.twoFactorVerified,
  });

  factory Nanny.fromJson(Map<String, dynamic> json) => Nanny(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        status: json["status"],
        email: json["email"],
        mobileCode: json["mobile_code"],
        mobile: json["mobile"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        fullMobile: json["full_mobile"],
        image: json["image"],
        emailVerified: json["email_verified"],
        smsVerified: json["sms_verified"],
        twoFactorVerified: json["two_factor_verified"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "status": status,
        "email": email,
        "mobile_code": mobileCode,
        "mobile": mobile,
        "address": address!.toJson(),
        "full_mobile": fullMobile,
        "image": image,
      };
}

class Address {
  String country;

  Address({
    required this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
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
