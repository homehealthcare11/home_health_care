
import 'dart:convert';

ProfessionModel professionModelFromJson(String str) => ProfessionModel.fromJson(json.decode(str));

String professionModelToJson(ProfessionModel data) => json.encode(data.toJson());

class ProfessionModel {
  final Message message;
  final Data data;

  ProfessionModel({
    required this.message,
    required this.data,
  });

  factory ProfessionModel.fromJson(Map<String, dynamic> json) => ProfessionModel(
    message: Message.fromJson(json["message"]),
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message.toJson(),
    "data": data.toJson(),
  };
}

class Data {
  final String baseUrl;
  final List<String> age;
  final List<String> gender;
  final List<String> number;
  final List<String> petType;
  final List<String> wordCapability;
  final List<String> chargeType;
  final List<String> defaultCurrency;
  final String imagePath;
  final Nanny nanny;

  Data({
    required this.baseUrl,
    required this.age,
    required this.gender,
    required this.number,
    required this.petType,
    required this.wordCapability,
    required this.chargeType,
    required this.defaultCurrency,
    required this.imagePath,
    required this.nanny,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    baseUrl: json["base_url"],
    age: List<String>.from(json["age"].map((x) => x)),
    gender: List<String>.from(json["gender"].map((x) => x)),
    number: List<String>.from(json["number"].map((x) => x)),
    petType: List<String>.from(json["pet_type"].map((x) => x)),
    wordCapability: List<String>.from(json["word_capability"].map((x) => x)),
    chargeType: List<String>.from(json["charge_type"].map((x) => x)),
    defaultCurrency: List<String>.from(json["default_currency"].map((x) => x)),
    imagePath: json["image_path"],
    nanny: Nanny.fromJson(json["nanny"]),
  );

  Map<String, dynamic> toJson() => {
    "base_url": baseUrl,
    "age": List<dynamic>.from(age.map((x) => x)),
    "gender": List<dynamic>.from(gender.map((x) => x)),
    "number": List<dynamic>.from(number.map((x) => x)),
    "pet_type": List<dynamic>.from(petType.map((x) => x)),
    "word_capability": List<dynamic>.from(wordCapability.map((x) => x)),
    "charge_type": List<dynamic>.from(chargeType.map((x) => x)),
    "default_currency": List<dynamic>.from(defaultCurrency.map((x) => x)),
    "image_path": imagePath,
    "nanny": nanny.toJson(),
  };
}

class Nanny {
  final int id;
  final int nannyId;
  final int professionType;
  final ProfessionTypeDetails professionTypeDetails;
  final String workExperience;
  final String workCapability;
  final String serviceArea;
  final String charge;
  final int amount;
  final String bio;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Nanny({
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
    required this.createdAt,
    required this.updatedAt,
  });

  factory Nanny.fromJson(Map<String, dynamic> json) => Nanny(
    id: json["id"],
    nannyId: json["nanny_id"],
    professionType: json["profession_type"],
    professionTypeDetails: ProfessionTypeDetails.fromJson(json["profession_type_details"]),
    workExperience: json["work_experience"],
    workCapability: json["work_capability"],
    serviceArea: json["service_area"],
    charge: json["charge"],
    amount: json["amount"],
    bio: json["bio"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class ProfessionTypeDetails {
  final String babyGender;
  final String babyAge;
  final String babyNumber;

  ProfessionTypeDetails({
    required this.babyGender,
    required this.babyAge,
    required this.babyNumber,
  });

  factory ProfessionTypeDetails.fromJson(Map<String, dynamic> json) => ProfessionTypeDetails(
    babyGender: json["baby_gender"],
    babyAge: json["baby_age"],
    babyNumber: json["baby_number"],
  );

  Map<String, dynamic> toJson() => {
    "baby_gender": babyGender,
    "baby_age": babyAge,
    "baby_number": babyNumber,
  };
}

class Message {
  final List<String> success;

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
