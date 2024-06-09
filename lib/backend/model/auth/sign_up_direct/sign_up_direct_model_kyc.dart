import 'dart:convert';

KycInfoModel kycModelPostFromJson(String str) =>
    KycInfoModel.fromJson(json.decode(str));

String kycModelPostToJson(KycInfoModel data) => json.encode(data.toJson());

class KycInfoModel {
  Message message;
  Data data;

  KycInfoModel({
    required this.message,
    required this.data,
  });

  factory KycInfoModel.fromJson(Map<String, dynamic> json) => KycInfoModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  String statusInfo;
  int kycStatus;
  List<NannyKyc> nannyKyc;

  Data({
    required this.statusInfo,
    required this.kycStatus,
    required this.nannyKyc,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        statusInfo: json["status_info"],
        kycStatus: json["kyc_status"],
        nannyKyc: List<NannyKyc>.from(
            json["nannyKyc"].map((x) => NannyKyc.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status_info": statusInfo,
        "kyc_status": kycStatus,
        "nannyKyc": List<dynamic>.from(nannyKyc.map((x) => x.toJson())),
      };
}

class NannyKyc {
  dynamic type;
  dynamic label;
  dynamic name;
  bool required;
  Validation validation;

  NannyKyc({
    required this.type,
    required this.label,
    required this.name,
    required this.required,
    required this.validation,
  });

  factory NannyKyc.fromJson(Map<String, dynamic> json) => NannyKyc(
        type: json["type"] ?? '',
        label: json["label"] ?? '',
        name: json["name"] ?? '',
        required: json["required"],
        validation: Validation.fromJson(json["validation"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "label": label,
        "name": name,
        "required": required,
        "validation": validation.toJson(),
      };
}

class Validation {
  dynamic max;

  int min;
  List<String> options;
  bool required;

  Validation({
    required this.max,
    required this.min,
    required this.options,
    required this.required,
  });

  factory Validation.fromJson(Map<String, dynamic> json) => Validation(
        max: json["max"],
        min: json["min"],
        options: List<String>.from(json["options"].map((x) => x)),
        required: json["required"],
      );

  Map<String, dynamic> toJson() => {
        "max": max,
        "min": min,
        "options": List<dynamic>.from(options.map((x) => x)),
        "required": required,
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
