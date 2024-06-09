import 'dart:convert';

NannyListModel nannyListModelFromJson(String str) =>
    NannyListModel.fromJson(json.decode(str));

String nannyListModelToJson(NannyListModel data) => json.encode(data.toJson());

class NannyListModel {
  Message message;
  Data data;

  NannyListModel({
    required this.message,
    required this.data,
  });

  factory NannyListModel.fromJson(Map<String, dynamic> json) => NannyListModel(
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
  List<Nanny> companions;
  List<Area> area;
  List<ProfessionType> professionType;
  List<String> workExperience;
  List<String> workCapability;
  List<String> charge;

  Data({
    required this.baseUrl,
    required this.defaultImage,
    required this.imagePath,
    required this.companions,
    required this.area,
    required this.professionType,
    required this.workExperience,
    required this.workCapability,
    required this.charge,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        baseUrl: json["base_url"],
        defaultImage: json["default_image"],
        imagePath: json["image_path"],
        companions:
            List<Nanny>.from(json["nannies"].map((x) => Nanny.fromJson(x))),
        area: List<Area>.from(json["area"].map((x) => Area.fromJson(x))),
        professionType: List<ProfessionType>.from(
            json["profession_type"].map((x) => ProfessionType.fromJson(x))),
        workExperience:
            List<String>.from(json["work_experience"].map((x) => x)),
        workCapability:
            List<String>.from(json["work_capability"].map((x) => x)),
        charge: List<String>.from(json["charge"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "default_image": defaultImage,
        "image_path": imagePath,
        "nannies": List<dynamic>.from(companions.map((x) => x.toJson())),
        "area": List<dynamic>.from(area.map((x) => x.toJson())),
        "profession_type":
            List<dynamic>.from(professionType.map((x) => x.toJson())),
        "work_experience": List<dynamic>.from(workExperience.map((x) => x)),
        "work_capability": List<dynamic>.from(workCapability.map((x) => x)),
        "charge": List<dynamic>.from(charge.map((x) => x)),
      };
}

class Area {
  int id;
  dynamic serviceArea;
  dynamic slug;

  Area({
    required this.id,
    required this.serviceArea,
    required this.slug,
  });

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        serviceArea: json["service_area"] ?? '',
        slug: json["slug"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "service_area": serviceArea,
        "slug": slug,
      };
}

class Nanny {
  int id;
  dynamic firstname;
  dynamic lastname;
  dynamic username;
  dynamic email;

  dynamic mobile;

  dynamic image;
  int status;
  dynamic address;

  // List<Review> review;
  List<UserRequest> userRequests;
  NannyProfession nannyProfession;

  Nanny({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.mobile,
    required this.image,
    required this.status,
    required this.address,
    // required this.review,
    required this.userRequests,
    required this.nannyProfession,
  });

  factory Nanny.fromJson(Map<String, dynamic> json) => Nanny(
        id: json["id"],
        firstname: json["firstname"] ?? '',
        lastname: json["lastname"] ?? '',
        username: json["username"] ?? '',
        email: json["email"] ?? '',
        mobile: json["mobile"] ?? '',
        image: json["image"] ?? '',
        status: json["status"],
        address: json["address"] ?? '',
        // review:
        //     List<Review>.from(json["review"].map((x) => Review.fromJson(x))),
        userRequests: List<UserRequest>.from(
            json["user_requests"].map((x) => UserRequest.fromJson(x))),
        nannyProfession: NannyProfession.fromJson(json["nanny_profession"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "email": email,
        "mobile": mobile,
        "image": image,
        "status": status,
        "address": address,
        // "review": List<dynamic>.from(review.map((x) => x.toJson())),
        "user_requests":
            List<dynamic>.from(userRequests.map((x) => x.toJson())),
        "nanny_profession": nannyProfession.toJson(),
      };
}

class NannyProfession {
  int id;
  int nannyId;
  int professionType;
  ProfessionTypeDetails professionTypeDetails;
  dynamic workExperience;
  dynamic workCapability;
  dynamic serviceArea;
  dynamic charge;
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
        workExperience: json["work_experience"] ?? '',
        workCapability: json["work_capability"] ?? '',
        serviceArea: json["service_area"] ?? '',
        charge: json["charge"] ?? '',
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

class Review {
  int id;
  int nannyId;
  int userId;
  int userRequestId;
  int rating;
  dynamic comment;

  Review({
    required this.id,
    required this.nannyId,
    required this.userId,
    required this.userRequestId,
    required this.rating,
    required this.comment,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        nannyId: json["nanny_id"],
        userId: json["user_id"],
        userRequestId: json["user_request_id"],
        rating: json["rating"],
        comment: json["comment"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nanny_id": nannyId,
        "user_id": userId,
        "user_request_id": userRequestId,
        "rating": rating,
        "comment": comment,
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
  int nannyCharge;
  dynamic startedTime;
  int total;
  dynamic serviceCharge;
  dynamic payable;
  dynamic currencyCode;
  dynamic address;
  int status;

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
        serviceCharge: json["service_charge"] ?? "",
        payable: json["payable"],
        currencyCode: json["currency_code"] ?? '',
        address: json["address"] ?? '',
        status: json["status"],
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
      };
}

class ProfessionType {
  int value;
  dynamic label;

  ProfessionType({
    required this.value,
    required this.label,
  });

  factory ProfessionType.fromJson(Map<String, dynamic> json) => ProfessionType(
        value: json["value"],
        label: json["label"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "label": label,
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
