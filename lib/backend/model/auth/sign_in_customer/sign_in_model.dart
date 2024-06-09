import 'dart:convert';

SignInModel signInModelFromJson(String str) =>
    SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  Message message;
  Data data;

  SignInModel({
    required this.message,
    required this.data,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  dynamic token;
  dynamic imagePath;
  dynamic defaultImage;
  User user;

  Data({
    required this.token,
    required this.imagePath,
    required this.defaultImage,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"] ?? '',
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
  int id;
  dynamic firstName;
  dynamic lastName;
  dynamic username;
  int status;
  dynamic email;
  dynamic mobileCode;
  dynamic mobile;
  Address address;
  dynamic fullMobile;
  dynamic image;

  int emailVerified;
  int smsVerified;
  int twoFactorVerified;
  dynamic twoFactorStatus;
  int kycVerified;
  int professionSubmitted;

  User({
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
    required this.twoFactorStatus,
    required this.kycVerified,
    required this.professionSubmitted,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        username: json["username"] ?? '',
        status: json["status"],
        email: json["email"] ?? '',
        mobileCode: json["mobile_code"] ?? '',
        mobile: json["mobile"] ?? '',
        address: Address.fromJson(json["address"]),
        fullMobile: json["full_mobile"] ?? '',
        image: json["image"] ?? '',
        emailVerified: json["email_verified"],
        smsVerified: json["sms_verified"],
        twoFactorVerified: json["two_factor_verified"],
        twoFactorStatus: json["two_factor_status"] ?? '',
        kycVerified: json["kyc_verified"],
        professionSubmitted: json["profession_submitted"],
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
        "address": address.toJson(),
        "full_mobile": fullMobile,
        "image": image,
        "email_verified": emailVerified,
        "sms_verified": smsVerified,
        "two_factor_verified": twoFactorVerified,
        "two_factor_status": twoFactorStatus,
        "kyc_verified": kycVerified,
        "profession_submitted": professionSubmitted,
      };
}

class Address {
  dynamic country;
  dynamic state;
  dynamic city;
  dynamic town;
  dynamic address;

  Address({
    required this.country,
    required this.state,
    required this.city,
    required this.town,
    required this.address,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        country: json["country"] ?? '',
        state: json["state"] ?? '',
        city: json["city"] ?? '',
        town: json["town"] ?? '',
        address: json["address"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "state": state,
        "city": city,
        "town": town,
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
