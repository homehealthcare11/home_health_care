import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) =>
    DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  Message message;
  Data data;

  DashboardModel({
    required this.message,
    required this.data,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  List<UserRequestElement> userRequest;

  Data({
    required this.userRequest,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userRequest: List<UserRequestElement>.from(
            json["user_request"].map((x) => UserRequestElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user_request": List<dynamic>.from(userRequest.map((x) => x.toJson())),
      };
}

class UserRequestElement {
  UserRequestUserRequest userRequest;
  NannyProfession nannyProfession;

  UserRequestElement({
    required this.userRequest,
    required this.nannyProfession,
  });

  factory UserRequestElement.fromJson(Map<String, dynamic> json) =>
      UserRequestElement(
        userRequest: UserRequestUserRequest.fromJson(json["user_request"]),
        nannyProfession: NannyProfession.fromJson(json["nanny_profession"]),
      );

  Map<String, dynamic> toJson() => {
        "user_request": userRequest.toJson(),
        "nanny_profession": nannyProfession.toJson(),
      };
}

class NannyProfession {
  int id;
  int nannyId;
  int professionType;

  dynamic workExperience;
  dynamic workCapability;
  dynamic serviceArea;
  dynamic charge;

  NannyProfession({
    required this.id,
    required this.nannyId,
    required this.professionType,
    required this.workExperience,
    required this.workCapability,
    required this.serviceArea,
    required this.charge,
  });

  factory NannyProfession.fromJson(Map<String, dynamic> json) =>
      NannyProfession(
        id: json["id"],
        nannyId: json["nanny_id"],
        professionType: json["profession_type"],
        workExperience: json["work_experience"] ?? '',
        workCapability: json["work_capability"] ?? '',
        serviceArea: json["service_area"] ?? '',
        charge: json["charge"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nanny_id": nannyId,
        "profession_type": professionType,
        "work_experience": workExperience,
        "work_capability": workCapability,
        "service_area": serviceArea,
        "charge": charge,
        // "amount": amount,
      };
}

class UserRequestUserRequest {
  int id;
  int userId;
  int nannyId;
  int addBabyPetId;

  int serviceType;
  int serviceDay;
  int dailyWorkingHour;
  int totalHour;
  int nannyCharge;
  dynamic startedTime;
  int total;
  dynamic serviceCharge;
  dynamic payable;
  dynamic currencyCode;
  dynamic address;

  Nanny nanny;

  UserRequestUserRequest({
    required this.id,
    required this.userId,
    required this.nannyId,
    required this.addBabyPetId,
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
    required this.nanny,
  });

  factory UserRequestUserRequest.fromJson(Map<String, dynamic> json) =>
      UserRequestUserRequest(
        id: json["id"],
        userId: json["user_id"],
        nannyId: json["nanny_id"],
        addBabyPetId: json["add_baby_pet_id"],
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
        nanny: Nanny.fromJson(json["nanny"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "nanny_id": nannyId,
        "add_baby_pet_id": addBabyPetId,
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
        "nanny": nanny.toJson(),
      };
}

class Nanny {
  int id;
  String firstname;
  String lastname;
  String username;
  String email;
  dynamic mobileCode;
  dynamic mobile;
  dynamic fullMobile;
  dynamic refferalUserId;
  dynamic image;

  dynamic address;
  int emailVerified;
  int smsVerified;
  int kycVerified;
  int professionSubmitted;

  int twoFactorVerified;
  dynamic twoFactorStatus;

  dynamic emailVerifiedAt;
  dynamic deletedAt;

  NannyProfession nannyProfession;

  Nanny({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.mobileCode,
    required this.mobile,
    required this.fullMobile,
    required this.refferalUserId,
    required this.image,
    required this.address,
    required this.emailVerified,
    required this.smsVerified,
    required this.kycVerified,
    required this.professionSubmitted,
    required this.twoFactorVerified,
    required this.twoFactorStatus,
    required this.emailVerifiedAt,
    required this.deletedAt,
    required this.nannyProfession,
  });

  factory Nanny.fromJson(Map<String, dynamic> json) => Nanny(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        username: json["username"],
        email: json["email"],
        mobileCode: json["mobile_code"] ?? '',
        mobile: json["mobile"] ?? '',
        fullMobile: json["full_mobile"] ?? '',
        refferalUserId: json["refferal_user_id"] ?? '',
        image: json["image"] ?? '',
        address: json["address"] ?? '',
        emailVerified: json["email_verified"],
        smsVerified: json["sms_verified"],
        kycVerified: json["kyc_verified"],
        professionSubmitted: json["profession_submitted"],
        twoFactorVerified: json["two_factor_verified"],
        twoFactorStatus: json["two_factor_status"],
        emailVerifiedAt: json["email_verified_at"] ?? '',
        deletedAt: json["deleted_at"] ?? '',
        nannyProfession:
            NannyProfession.fromJson(json["nanny_profession"] ?? ''),
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
        "refferal_user_id": refferalUserId,
        "image": image,
        "address": address,
        "email_verified": emailVerified,
        "sms_verified": smsVerified,
        "kyc_verified": kycVerified,
        "profession_submitted": professionSubmitted,
        "two_factor_verified": twoFactorVerified,
        "two_factor_status": twoFactorStatus,
        "email_verified_at": emailVerifiedAt,
        "deleted_at": deletedAt,
        "nanny_profession": nannyProfession.toJson(),
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
