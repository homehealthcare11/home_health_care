import 'dart:convert';

on(String str) => SignInDirectModel.fromJson(json.decode(str));

String signInDirectModelToJson(SignInDirectModel data) =>
    json.encode(data.toJson());

class SignInDirectModel {
  Message message;
  Data data;

  SignInDirectModel({
    required this.message,
    required this.data,
  });

  factory SignInDirectModel.fromJson(Map<String, dynamic> json) =>
      SignInDirectModel(
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
  Nanny nanny;

  Data({
    required this.token,
    required this.imagePath,
    required this.defaultImage,
    required this.nanny,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"] ?? '',
        imagePath: json["image_path"] ?? '',
        defaultImage: json["default_image"] ?? '',
        nanny: Nanny.fromJson(json["nanny"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "image_path": imagePath,
        "default_image": defaultImage,
        "nanny": nanny.toJson(),
      };
}

class Nanny {
  int id;
  dynamic firstName;
  dynamic lastName;
  dynamic username;
  int status;
  dynamic email;
  dynamic mobileCode;
  dynamic mobile;
  dynamic address;
  dynamic fullMobile;
  dynamic image;
  dynamic verCode;
  dynamic verCodeSendAt;
  dynamic emailVerifiedAt;
  int emailVerified;
  int smsVerified;
  int twoFactorVerified;
  dynamic twoFactorStatus;
  int kycVerified;
  dynamic professionSubmitted;

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
    required this.verCode,
    required this.verCodeSendAt,
    required this.emailVerifiedAt,
    required this.emailVerified,
    required this.smsVerified,
    required this.twoFactorVerified,
    required this.twoFactorStatus,
    required this.kycVerified,
    required this.professionSubmitted,
  });

  factory Nanny.fromJson(Map<String, dynamic> json) => Nanny(
        id: json["id"],
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        username: json["username"] ?? '',
        status: json["status"],
        email: json["email"] ?? '',
        mobileCode: json["mobile_code"] ?? '',
        mobile: json["mobile"] ?? '',
        address: json["address"] ?? '',
        fullMobile: json["full_mobile"] ?? '',
        image: json["image"] ?? '',
        verCode: json["ver_code"] ?? '',
        verCodeSendAt: json["ver_code_send_at"] ?? '',
        emailVerifiedAt: json["email_verified_at"] ?? '',
        emailVerified: json["email_verified"],
        smsVerified: json["sms_verified"],
        twoFactorVerified: json["two_factor_verified"],
        twoFactorStatus: json["two_factor_status"] ?? '',
        kycVerified: json["kyc_verified"],
        professionSubmitted: json["profession_submitted"] ?? '',
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
        "address": address,
        "full_mobile": fullMobile,
        "image": image,
        "ver_code": verCode,
        "ver_code_send_at": verCodeSendAt,
        "email_verified_at": emailVerifiedAt,
        "email_verified": emailVerified,
        "sms_verified": smsVerified,
        "two_factor_verified": twoFactorVerified,
        "two_factor_status": twoFactorStatus,
        "kyc_verified": kycVerified,
        "profession_submitted": professionSubmitted,
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
