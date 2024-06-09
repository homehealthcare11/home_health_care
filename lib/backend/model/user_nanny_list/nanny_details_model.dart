import 'dart:convert';

NannyDetailsModel nannyDetailsModelFromJson(String str) =>
    NannyDetailsModel.fromJson(json.decode(str));

String nannyDetailsModelToJson(NannyDetailsModel data) =>
    json.encode(data.toJson());

class NannyDetailsModel {
  Message message;
  Data data;

  NannyDetailsModel({
    required this.message,
    required this.data,
  });

  factory NannyDetailsModel.fromJson(Map<String, dynamic> json) =>
      NannyDetailsModel(
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
  String imagePath;
  String dataDefault;
  Nanny nanny;
  int totalNannyService;
  int totalNannyTaskComplate;
  List<Review> reviews;
  List<MyBabyPetList> myBabyPetList;

  Data({
    required this.baseUrl,
    required this.imagePath,
    required this.dataDefault,
    required this.nanny,
    required this.totalNannyService,
    required this.totalNannyTaskComplate,
    required this.reviews,
    required this.myBabyPetList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        baseUrl: json["base_url"],
        imagePath: json["image_path"],
        dataDefault: json["default"],
        nanny: Nanny.fromJson(json["nanny"]),
        totalNannyService: json["total_nanny_service"],
        totalNannyTaskComplate: json["total_nanny_task_complate"],
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        myBabyPetList: List<MyBabyPetList>.from(
            json["my_baby_pet_list"].map((x) => MyBabyPetList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "image_path": imagePath,
        "default": dataDefault,
        "nanny": nanny.toJson(),
        "total_nanny_service": totalNannyService,
        "total_nanny_task_complate": totalNannyTaskComplate,
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "my_baby_pet_list":
            List<dynamic>.from(myBabyPetList.map((x) => x.toJson())),
      };
}

class MyBabyPetList {
  int id;
  int userId;
  int professionType;
  MyBabyPetListProfessionTypeDetails professionTypeDetails;
  dynamic image;
  dynamic status;

  MyBabyPetList({
    required this.id,
    required this.userId,
    required this.professionType,
    required this.professionTypeDetails,
    required this.image,
    required this.status,
  });

  factory MyBabyPetList.fromJson(Map<String, dynamic> json) => MyBabyPetList(
        id: json["id"],
        userId: json["user_id"],
        professionType: json["profession_type"],
        professionTypeDetails: MyBabyPetListProfessionTypeDetails.fromJson(
            json["profession_type_details"]),
        image: json["image"] ?? '',
        status: json["status"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "profession_type": professionType,
        "profession_type_details": professionTypeDetails.toJson(),
        "image": image,
        "status": status,
      };
}

class MyBabyPetListProfessionTypeDetails {
  dynamic babyName;
  dynamic babyGender;
  dynamic babyAge;
  dynamic babyFood;

  MyBabyPetListProfessionTypeDetails({
    required this.babyName,
    required this.babyGender,
    required this.babyAge,
    required this.babyFood,
  });

  factory MyBabyPetListProfessionTypeDetails.fromJson(
          Map<String, dynamic> json) =>
      MyBabyPetListProfessionTypeDetails(
        babyName: json["baby_name"] ?? '',
        babyGender: json["baby_gender"] ?? '',
        babyAge: json["baby_age"] ?? '',
        babyFood: json["baby_food"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "baby_name": babyName,
        "baby_gender": babyGender,
        "baby_age": babyAge,
        "baby_food": babyFood,
      };
}

class Nanny {
  int id;
  dynamic firstname;
  dynamic lastname;
  dynamic username;
  dynamic email;

  dynamic image;
  int status;
  Address address;
  int emailVerified;

  int professionSubmitted;

  List<Review> review;
  List<UserRequest> userRequests;
  NannyProfession nannyProfession;

  Nanny({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.image,
    required this.status,
    required this.address,
    required this.emailVerified,
    required this.professionSubmitted,
    required this.review,
    required this.userRequests,
    required this.nannyProfession,
  });

  factory Nanny.fromJson(Map<String, dynamic> json) => Nanny(
        id: json["id"],
        firstname: json["firstname"] ?? '',
        lastname: json["lastname"] ?? '',
        username: json["username"] ?? '',
        email: json["email"] ?? '',
        image: json["image"] ?? '',
        status: json["status"],
        address: Address.fromJson(json["address"]),
        emailVerified: json["email_verified"],
        professionSubmitted: json["profession_submitted"],
        review:
            List<Review>.from(json["review"].map((x) => Review.fromJson(x))),
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
        "image": image,
        "status": status,
        "address": address.toJson(),
        "email_verified": emailVerified,
        "profession_submitted": professionSubmitted,
        "review": List<dynamic>.from(review.map((x) => x.toJson())),
        "user_requests":
            List<dynamic>.from(userRequests.map((x) => x.toJson())),
        "nanny_profession": nannyProfession.toJson(),
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

class NannyProfession {
  int id;
  int nannyId;
  int professionType;
  NannyProfessionProfessionTypeDetails professionTypeDetails;
  dynamic workExperience;
  dynamic workCapability;
  dynamic serviceArea;
  dynamic charge;
  int amount;
  dynamic bio;
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
        professionTypeDetails: NannyProfessionProfessionTypeDetails.fromJson(
            json["profession_type_details"]),
        workExperience: json["work_experience"] ?? '',
        workCapability: json["work_capability"] ?? '',
        serviceArea: json["service_area"] ?? '',
        charge: json["charge"] ?? '',
        amount: json["amount"] ?? '',
        bio: json["bio"],
        status: json["status"] ?? '',
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

class NannyProfessionProfessionTypeDetails {
  dynamic petType;
  dynamic gender;
  dynamic age;
  dynamic number;

  NannyProfessionProfessionTypeDetails({
    required this.petType,
    required this.gender,
    required this.age,
    required this.number,
  });

  factory NannyProfessionProfessionTypeDetails.fromJson(
          Map<String, dynamic> json) =>
      NannyProfessionProfessionTypeDetails(
        petType: json["pet_type"],
        gender: json["gender"],
        age: json["age"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "pet_type": petType,
        "gender": gender,
        "age": age,
        "number": number,
      };
}

class Review {
  int id;
  dynamic nannyId;
  dynamic userId;
  dynamic userRequestId;
  dynamic rating;
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
        nannyId: json["nanny_id"] ?? '',
        userId: json["user_id"] ?? '',
        userRequestId: json["user_request_id"] ?? '',
        rating: json["rating"] ?? '',
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
        serviceCharge: json["service_charge"] ?? '',
        payable: json["payable"] ?? '',
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
