// To parse this JSON data, do
//
//     final serviceRequestModel = serviceRequestModelFromJson(jsonString);

import 'dart:convert';

ServiceRequestModel serviceRequestModelFromJson(String str) =>
    ServiceRequestModel.fromJson(json.decode(str));

String serviceRequestModelToJson(ServiceRequestModel data) =>
    json.encode(data.toJson());

class ServiceRequestModel {
  Message message;
  Data data;

  ServiceRequestModel({
    required this.message,
    required this.data,
  });

  factory ServiceRequestModel.fromJson(Map<String, dynamic> json) =>
      ServiceRequestModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  List<UserRequest> userRequest;

  Data({
    required this.userRequest,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userRequest: List<UserRequest>.from(
            json["user_request"].map((x) => UserRequest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user_request": List<dynamic>.from(userRequest.map((x) => x.toJson())),
      };
}

class UserRequest {
  int id;
  int userId;
  int nannyId;
  int addBabyPetId;
  DateTime startedDate;
  DateTime endDate;
  int serviceType;
  int serviceDay;
  int dailyWorkingHour;
  int totalHour;
  dynamic nannyCharge;
  dynamic startedTime;
  dynamic total;
  dynamic serviceCharge;
  dynamic payable;
  dynamic currencyCode;
  dynamic address;
  int status;

  User user;

  UserRequest({
    required this.id,
    required this.userId,
    required this.nannyId,
    required this.addBabyPetId,
    required this.startedDate,
    required this.endDate,
    required this.serviceType,
    required this.serviceDay,
    required this.dailyWorkingHour,
    required this.totalHour,
    required this.nannyCharge,
    required this.startedTime,
    required this.total,
    required this.serviceCharge,
    required this.payable,
    required this.currencyCode,
    required this.address,
    required this.status,
    required this.user,
  });

  factory UserRequest.fromJson(Map<String, dynamic> json) => UserRequest(
        id: json["id"],
        userId: json["user_id"],
        nannyId: json["nanny_id"],
        addBabyPetId: json["add_baby_pet_id"],
        startedDate: DateTime.parse(json["started_date"]),
        endDate: DateTime.parse(json["end_date"]),
        serviceType: json["service_type"],
        serviceDay: json["service_day"],
        dailyWorkingHour: json["daily_working_hour"],
        totalHour: json["total_hour"],
        nannyCharge: json["nanny_charge"],
        startedTime: json["started_time"] ?? '',
        total: json["total"],
        serviceCharge: json["service_charge"],
        payable: json["payable"],
        currencyCode: json["currency_code"] ?? '',
        address: json["address"] ?? '',
        status: json["status"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "nanny_id": nannyId,
        "add_baby_pet_id": addBabyPetId,
        "started_date":
            "${startedDate.year.toString().padLeft(4, '0')}-${startedDate.month.toString().padLeft(2, '0')}-${startedDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "service_type": serviceType,
        "service_day": serviceDay,
        "daily_working_hour": dailyWorkingHour,
        "total_hour": totalHour,
        "nanny_charge": nannyCharge,
        "started_time": startedTime,
        "total": total,
        "service_charge": serviceCharge,
        "payable": payable,
        "currency_code": currencyCode,
        "address": address,
        "status": status,
        "user": user.toJson(),
      };
}

class User {
  int? id;
  String? firstname;
  String? lastname;
  String? username;
  String email;
  String? mobileCode;
  String? mobile;
  String? fullMobile;

  String? image;
  int? status;
  Address address;
  int? emailVerified;
  int? smsVerified;
  int? kycVerified;

  int? twoFactorVerified;

  String? twoFactorSecret;

  String? fullname;
  String? userImage;
  StringStatus? stringStatus;
  String? lastLogin;
  StringStatus kycStringStatus;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.mobileCode,
    required this.mobile,
    required this.fullMobile,
    required this.image,
    required this.status,
    required this.address,
    required this.emailVerified,
    required this.smsVerified,
    required this.kycVerified,
    required this.twoFactorVerified,
    required this.twoFactorSecret,
    required this.fullname,
    required this.userImage,
    required this.stringStatus,
    required this.lastLogin,
    required this.kycStringStatus,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        firstname: json["firstname"] ?? "",
        lastname: json["lastname"] ?? "",
        username: json["username"] ?? "",
        email: json["email"] ?? "",
        mobileCode: json["mobile_code"] ?? "",
        mobile: json["mobile"] ?? "",
        fullMobile: json["full_mobile"] ?? "",
        image: json["image"] ?? "",
        status: json["status"] ?? 0,
        address: Address.fromJson(json["address"]),
        emailVerified: json["email_verified"] ?? 0,
        smsVerified: json["sms_verified"],
        kycVerified: json["kyc_verified"],
        twoFactorVerified: json["two_factor_verified"],
        twoFactorSecret: json["two_factor_secret"],
        fullname: json["fullname"] ?? "",
        userImage: json["userImage"] ?? "",
        stringStatus: StringStatus.fromJson(json["stringStatus"]),
        lastLogin: json["lastLogin"],
        kycStringStatus: StringStatus.fromJson(json["kycStringStatus"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "email": email,
        "mobile_code": mobileCode,
        "mobile": mobile,
        "full_mobile": fullMobile,
        "image": image,
        "status": status,
        "address": address.toJson(),
        "email_verified": emailVerified,
        "sms_verified": smsVerified,
        "kyc_verified": kycVerified,
        "two_factor_verified": twoFactorVerified,
        "two_factor_secret": twoFactorSecret,
        "fullname": fullname,
        "userImage": userImage,
        "stringStatus": stringStatus?.toJson(),
        "lastLogin": lastLogin,
        "kycStringStatus": kycStringStatus.toJson(),
      };
}

class Address {
  String? country;
  String? state;
  String? city;

  dynamic address;

  Address({
    required this.country,
    required this.state,
    required this.city,
    required this.address,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        country: json["country"] ?? '',
        state: json["state"] ?? '',
        city: json["city"] ?? '',
        address: json["address"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "state": state,
        "city": city,
        "address": address,
      };
}

class StringStatus {
  String stringStatusClass;
  String value;

  StringStatus({
    required this.stringStatusClass,
    required this.value,
  });

  factory StringStatus.fromJson(Map<String, dynamic> json) => StringStatus(
        stringStatusClass: json["class"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "class": stringStatusClass,
        "value": value,
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
