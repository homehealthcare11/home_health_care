import 'dart:convert';

BabyPetStoreModel babyStoreModelFromJson(String str) =>
    BabyPetStoreModel.fromJson(json.decode(str));

String babyStoreModelToJson(BabyPetStoreModel data) =>
    json.encode(data.toJson());

class BabyPetStoreModel {
  Message message;
  Data data;

  BabyPetStoreModel({
    required this.message,
    required this.data,
  });

  factory BabyPetStoreModel.fromJson(Map<String, dynamic> json) =>
      BabyPetStoreModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  dynamic image;
  ProfessionTypeDetails professionTypeDetails;
  int userId;
  dynamic professionType;
  int id;

  Data({
    this.image,
    required this.professionTypeDetails,
    required this.userId,
    required this.professionType,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        image: json["image"] ?? '',
        professionTypeDetails:
            ProfessionTypeDetails.fromJson(json["profession_type_details"]),
        userId: json["user_id"],
        professionType: json["profession_type"] ?? '',
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "profession_type_details": professionTypeDetails.toJson(),
        "user_id": userId,
        "profession_type": professionType ?? '',
        "id": id,
      };
}

class ProfessionTypeDetails {
  dynamic babyName;
  dynamic babyGender;
  dynamic babyAge;
  dynamic babyFood;

  ProfessionTypeDetails({
    required this.babyName,
    required this.babyGender,
    required this.babyAge,
    required this.babyFood,
  });

  factory ProfessionTypeDetails.fromJson(Map<String, dynamic> json) =>
      ProfessionTypeDetails(
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
