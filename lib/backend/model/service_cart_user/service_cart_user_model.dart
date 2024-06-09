// To parse this JSON data, do
//
//     final serviceCartModel = serviceCartModelFromJson(jsonString);

import 'dart:convert';

ServiceCartModel serviceCartModelFromJson(String str) =>
    ServiceCartModel.fromJson(json.decode(str));

String serviceCartModelToJson(ServiceCartModel data) =>
    json.encode(data.toJson());

class ServiceCartModel {
  Message message;
  Data data;

  ServiceCartModel({
    required this.message,
    required this.data,
  });

  factory ServiceCartModel.fromJson(Map<String, dynamic> json) =>
      ServiceCartModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  String baseUrl;
  String defaultImage;
  String imagePath;
  List<UserRequestElement> userRequests;
  List<PaymentGateway> paymentGateway;

  Data({
    required this.baseUrl,
    required this.defaultImage,
    required this.imagePath,
    required this.userRequests,
    required this.paymentGateway,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        baseUrl: json["base_url"],
        defaultImage: json["default_image"],
        imagePath: json["image_path"],
        userRequests: List<UserRequestElement>.from(
            json["user_requests"].map((x) => UserRequestElement.fromJson(x))),
        paymentGateway: List<PaymentGateway>.from(
            json["payment_gateway"].map((x) => PaymentGateway.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "default_image": defaultImage,
        "image_path": imagePath,
        "user_requests":
            List<dynamic>.from(userRequests.map((x) => x.toJson())),
        "payment_gateway":
            List<dynamic>.from(paymentGateway.map((x) => x.toJson())),
      };
}

class PaymentGateway {
  String name;
  String alias;
  String currencyCode;
  String currencySymbol;
  dynamic image;
  String minLimit;
  String maxLimit;
  String percentCharge;
  String fixedCharge;
  String rate;
  String gatewayImage;

  PaymentGateway({
    required this.name,
    required this.alias,
    required this.currencyCode,
    required this.currencySymbol,
    required this.image,
    required this.minLimit,
    required this.maxLimit,
    required this.percentCharge,
    required this.fixedCharge,
    required this.rate,
    required this.gatewayImage,
  });

  factory PaymentGateway.fromJson(Map<String, dynamic> json) => PaymentGateway(
        name: json["name"],
        alias: json["alias"],
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
        image: json["image"] ?? '',
        minLimit: json["min_limit"],
        maxLimit: json["max_limit"],
        percentCharge: json["percent_charge"],
        fixedCharge: json["fixed_charge"],
        rate: json["rate"],
        gatewayImage: json["gateway_image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "alias": alias,
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
        "image": image,
        "min_limit": minLimit,
        "max_limit": maxLimit,
        "percent_charge": percentCharge,
        "fixed_charge": fixedCharge,
        "rate": rate,
        "gateway_image": gatewayImage,
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
  ProfessionTypeDetails professionTypeDetails;
  String workExperience;
  String workCapability;
  String serviceArea;
  String charge;
  int amount;
  String bio;
  int status;

  NannyProfession({
    required this.id,
    required this.nannyId,
    required this.professionType,
    required this.professionTypeDetails,
    required this.workExperience,
    required this.workCapability,
    required this.serviceArea,
    required this.charge,
    required this.amount,
    required this.bio,
    required this.status,
  });

  factory NannyProfession.fromJson(Map<String, dynamic> json) =>
      NannyProfession(
        id: json["id"],
        nannyId: json["nanny_id"],
        professionType: json["profession_type"],
        professionTypeDetails:
            ProfessionTypeDetails.fromJson(json["profession_type_details"]),
        workExperience: json["work_experience"],
        workCapability: json["work_capability"],
        serviceArea: json["service_area"],
        charge: json["charge"],
        amount: json["amount"],
        bio: json["bio"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nanny_id": nannyId,
        "profession_type": professionType,
        "profession_type_details": professionTypeDetails.toJson(),
        "work_experience": workExperience,
        "work_capability": workCapability,
        "service_area": serviceArea,
        "charge": charge,
        "amount": amount,
        "bio": bio,
        "status": status,
      };
}

class ProfessionTypeDetails {
  dynamic babyGender;
  dynamic babyAge;
  dynamic babyNumber;

  ProfessionTypeDetails({
    required this.babyGender,
    required this.babyAge,
    required this.babyNumber,
  });

  factory ProfessionTypeDetails.fromJson(Map<String, dynamic> json) =>
      ProfessionTypeDetails(
        babyGender: json["baby_gender"] ?? '',
        babyAge: json["baby_age"] ?? '',
        babyNumber: json["baby_number"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "baby_gender": babyGender,
        "baby_age": babyAge,
        "baby_number": babyNumber,
      };
}

class UserRequestUserRequest {
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
  int nannyCharge;
  String startedTime;
  int total;
  String serviceCharge;
  String payable;
  String currencyCode;
  String address;
  int status;

  Nanny nanny;

  UserRequestUserRequest({
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
    required this.nanny,
  });

  factory UserRequestUserRequest.fromJson(Map<String, dynamic> json) =>
      UserRequestUserRequest(
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
        startedTime: json["started_time"],
        total: json["total"],
        serviceCharge: json["service_charge"],
        payable: json["payable"],
        currencyCode: json["currency_code"],
        address: json["address"],
        status: json["status"],
        nanny: Nanny.fromJson(json["nanny"]),
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
  String mobile;
  dynamic fullMobile;
  dynamic refferalUserId;
  dynamic image;
  int status;
  Address address;
  int emailVerified;
  int smsVerified;
  int kycVerified;
  int professionSubmitted;
  dynamic verCode;
  dynamic verCodeSendAt;
  int twoFactorVerified;
  int twoFactorStatus;
  dynamic twoFactorSecret;
  dynamic deviceId;
  dynamic emailVerifiedAt;

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
    required this.status,
    required this.address,
    required this.emailVerified,
    required this.smsVerified,
    required this.kycVerified,
    required this.professionSubmitted,
    required this.verCode,
    required this.verCodeSendAt,
    required this.twoFactorVerified,
    required this.twoFactorStatus,
    required this.twoFactorSecret,
    required this.deviceId,
    required this.emailVerifiedAt,
    required this.nannyProfession,
  });

  factory Nanny.fromJson(Map<String, dynamic> json) => Nanny(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        username: json["username"],
        email: json["email"],
        mobileCode: json["mobile_code"],
        mobile: json["mobile"],
        fullMobile: json["full_mobile"],
        refferalUserId: json["refferal_user_id"],
        image: json["image"] ?? '',
        status: json["status"],
        address: Address.fromJson(json["address"]),
        emailVerified: json["email_verified"],
        smsVerified: json["sms_verified"],
        kycVerified: json["kyc_verified"],
        professionSubmitted: json["profession_submitted"],
        verCode: json["ver_code"],
        verCodeSendAt: json["ver_code_send_at"],
        twoFactorVerified: json["two_factor_verified"],
        twoFactorStatus: json["two_factor_status"],
        twoFactorSecret: json["two_factor_secret"],
        deviceId: json["device_id"],
        emailVerifiedAt: json["email_verified_at"],
        nannyProfession: NannyProfession.fromJson(json["nanny_profession"]),
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
        "status": status,
        "address": address.toJson(),
        "email_verified": emailVerified,
        "sms_verified": smsVerified,
        "kyc_verified": kycVerified,
        "profession_submitted": professionSubmitted,
        "ver_code": verCode,
        "ver_code_send_at": verCodeSendAt,
        "two_factor_verified": twoFactorVerified,
        "two_factor_status": twoFactorStatus,
        "two_factor_secret": twoFactorSecret,
        "device_id": deviceId,
        "email_verified_at": emailVerifiedAt,
        "nanny_profession": nannyProfession.toJson(),
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
