// To parse this JSON data, do
//
//     final petStoreModel = petStoreModelFromJson(jsonString);

import 'dart:convert';

PetStoreModel petStoreModelFromJson(String str) =>
    PetStoreModel.fromJson(json.decode(str));

String petStoreModelToJson(PetStoreModel data) => json.encode(data.toJson());

class PetStoreModel {
  Message message;
  Data data;

  PetStoreModel({
    required this.message,
    required this.data,
  });

  factory PetStoreModel.fromJson(Map<String, dynamic> json) => PetStoreModel(
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
  int professionType;

  int id;

  Data({
    required this.image,
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
        professionType: json["profession_type"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "profession_type_details": professionTypeDetails.toJson(),
        "user_id": userId,
        "profession_type": professionType,
        "id": id,
      };
}

class ProfessionTypeDetails {
  dynamic petName;
  dynamic petType;
  dynamic petBreed;
  dynamic petGender;
  dynamic petAge;
  dynamic petWeight;
  dynamic petFood;

  ProfessionTypeDetails({
    required this.petName,
    required this.petType,
    required this.petBreed,
    required this.petGender,
    required this.petAge,
    required this.petWeight,
    required this.petFood,
  });

  factory ProfessionTypeDetails.fromJson(Map<String, dynamic> json) =>
      ProfessionTypeDetails(
        petName: json["pet_name"] ?? '',
        petType: json["pet_type"] ?? '',
        petBreed: json["pet_breed"] ?? '',
        petGender: json["pet_gender"] ?? '',
        petAge: json["pet_age"] ?? '',
        petWeight: json["pet_weight"] ?? '',
        petFood: json["pet_food"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "pet_name": petName,
        "pet_type": petType,
        "pet_breed": petBreed,
        "pet_gender": petGender,
        "pet_age": petAge,
        "pet_weight": petWeight,
        "pet_food": petFood,
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
