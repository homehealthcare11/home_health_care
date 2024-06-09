import 'dart:convert';

BabyPetGetModel babyPetGetModelFromJson(String str) =>
    BabyPetGetModel.fromJson(json.decode(str));

String babyPetGetModelToJson(BabyPetGetModel data) =>
    json.encode(data.toJson());

class BabyPetGetModel {
  Message message;
  Data data;

  BabyPetGetModel({
    required this.message,
    required this.data,
  });

  factory BabyPetGetModel.fromJson(Map<String, dynamic> json) =>
      BabyPetGetModel(
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
  List<MyBaby> myBaby;
  List<MyPet> myPet;
  Map<String, String> gender;
  Map<String, String> petType;

  Data({
    required this.baseUrl,
    required this.defaultImage,
    required this.imagePath,
    required this.myBaby,
    required this.myPet,
    required this.gender,
    required this.petType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        baseUrl: json["base_url"],
        defaultImage: json["default_image"],
        imagePath: json["image_path"],
        myBaby:
            List<MyBaby>.from(json["my_baby"].map((x) => MyBaby.fromJson(x))),
        myPet: List<MyPet>.from(json["my_pet"].map((x) => MyPet.fromJson(x))),
        gender: Map.from(json["gender"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        petType: Map.from(json["petType"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "default_image": defaultImage,
        "image_path": imagePath,
        "my_baby": List<dynamic>.from(myBaby.map((x) => x.toJson())),
        "my_pet": List<dynamic>.from(myPet.map((x) => x.toJson())),
        "gender":
            Map.from(gender).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "petType":
            Map.from(petType).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class MyBaby {
  int id;
  int userId;
  String image;
  int professionType;
  MyBabyProfessionTypeDetails professionTypeDetails;

  MyBaby({
    required this.id,
    required this.userId,
    required this.image,
    required this.professionType,
    required this.professionTypeDetails,
  });

  factory MyBaby.fromJson(Map<String, dynamic> json) => MyBaby(
        id: json["id"],
        userId: json["user_id"],
        image: json["image"],
        professionType: json["profession_type"],
        professionTypeDetails: MyBabyProfessionTypeDetails.fromJson(
            json["profession_type_details"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "image": image,
        "profession_type": professionType,
        "profession_type_details": professionTypeDetails.toJson(),
      };
}

class MyBabyProfessionTypeDetails {
  String babyName;
  String babyGender;
  String babyAge;
  String babyFood;

  MyBabyProfessionTypeDetails({
    required this.babyName,
    required this.babyGender,
    required this.babyAge,
    required this.babyFood,
  });

  factory MyBabyProfessionTypeDetails.fromJson(Map<String, dynamic> json) =>
      MyBabyProfessionTypeDetails(
        babyName: json["baby_name"],
        babyGender: json["baby_gender"],
        babyAge: json["baby_age"],
        babyFood: json["baby_food"],
      );

  Map<String, dynamic> toJson() => {
        "baby_name": babyName,
        "baby_gender": babyGender,
        "baby_age": babyAge,
        "baby_food": babyFood,
      };
}

class MyPet {
  int id;
  int userId;
  String image;
  int professionType;
  MyPetProfessionTypeDetails professionTypeDetails;

  MyPet({
    required this.id,
    required this.userId,
    required this.image,
    required this.professionType,
    required this.professionTypeDetails,
  });

  factory MyPet.fromJson(Map<String, dynamic> json) => MyPet(
        id: json["id"],
        userId: json["user_id"],
        image: json["image"],
        professionType: json["profession_type"],
        professionTypeDetails: MyPetProfessionTypeDetails.fromJson(
            json["profession_type_details"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "image": image,
        "profession_type": professionType,
        "profession_type_details": professionTypeDetails.toJson(),
      };
}

class MyPetProfessionTypeDetails {
  String petName;
  String petType;
  String petBreed;
  String petAge;
  String petWeight;
  String petGender;
  String petFood;

  MyPetProfessionTypeDetails({
    required this.petName,
    required this.petType,
    required this.petBreed,
    required this.petAge,
    required this.petWeight,
    required this.petGender,
    required this.petFood,
  });

  factory MyPetProfessionTypeDetails.fromJson(Map<String, dynamic> json) =>
      MyPetProfessionTypeDetails(
        petName: json["pet_name"],
        petType: json["pet_type"],
        petBreed: json["pet_breed"],
        petAge: json["pet_age"],
        petWeight: json["pet_weight"],
        petGender: json["pet_gender"],
        petFood: json["pet_food"],
      );

  Map<String, dynamic> toJson() => {
        "pet_name": petName,
        "pet_type": petType,
        "pet_breed": petBreed,
        "pet_age": petAge,
        "pet_weight": petWeight,
        "pet_gender": petGender,
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
