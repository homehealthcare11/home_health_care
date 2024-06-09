
import 'dart:convert';

NannyMoneyOutModel nannyMoneyOutModelFromJson(String str) => NannyMoneyOutModel.fromJson(json.decode(str));

String nannyMoneyOutModelToJson(NannyMoneyOutModel data) => json.encode(data.toJson());

class NannyMoneyOutModel {
  final Message message;
  final Data data;

  NannyMoneyOutModel({
    required this.message,
    required this.data,
  });

  factory NannyMoneyOutModel.fromJson(Map<String, dynamic> json) => NannyMoneyOutModel(
    message: Message.fromJson(json["message"]),
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message.toJson(),
    "data": data.toJson(),
  };
}

class Data {
  final PaymentInformations paymentInformations;
  final String gatewayType;
  final String gatewayCurrencyName;
  final String alias;
  final String details;
  final List<InputField> inputFields;
  final String url;
  final String method;

  Data({
    required this.paymentInformations,
    required this.gatewayType,
    required this.gatewayCurrencyName,
    required this.alias,
    required this.details,
    required this.inputFields,
    required this.url,
    required this.method,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    paymentInformations: PaymentInformations.fromJson(json["payment_informations"]),
    gatewayType: json["gateway_type"],
    gatewayCurrencyName: json["gateway_currency_name"],
    alias: json["alias"],
    details: json["details"],
    inputFields: List<InputField>.from(json["input_fields"].map((x) => InputField.fromJson(x))),
    url: json["url"],
    method: json["method"],
  );

  Map<String, dynamic> toJson() => {
    "payment_informations": paymentInformations.toJson(),
    "gateway_type": gatewayType,
    "gateway_currency_name": gatewayCurrencyName,
    "alias": alias,
    "details": details,
    "input_fields": List<dynamic>.from(inputFields.map((x) => x.toJson())),
    "url": url,
    "method": method,
  };
}

class InputField {
  final String type;
  final String label;
  final String name;
  final bool required;
  final Validation validation;

  InputField({
    required this.type,
    required this.label,
    required this.name,
    required this.required,
    required this.validation,
  });

  factory InputField.fromJson(Map<String, dynamic> json) => InputField(
    type: json["type"],
    label: json["label"],
    name: json["name"],
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
  final String max;
  final List<String> mimes;
  final dynamic min;
  final List<dynamic> options;
  final bool required;

  Validation({
    required this.max,
    required this.mimes,
    required this.min,
    required this.options,
    required this.required,
  });

  factory Validation.fromJson(Map<String, dynamic> json) => Validation(
    max: json["max"],
    mimes: List<String>.from(json["mimes"].map((x) => x)),
    min: json["min"],
    options: List<dynamic>.from(json["options"].map((x) => x)),
    required: json["required"],
  );

  Map<String, dynamic> toJson() => {
    "max": max,
    "mimes": List<dynamic>.from(mimes.map((x) => x)),
    "min": min,
    "options": List<dynamic>.from(options.map((x) => x)),
    "required": required,
  };
}

class PaymentInformations {
  final String trx;
  final String gatewayCurrencyName;
  final String requestAmount;
  final String exchangeRate;
  final String conversionAmount;
  final String totalCharge;
  final String willGet;
  final String payable;

  PaymentInformations({
    required this.trx,
    required this.gatewayCurrencyName,
    required this.requestAmount,
    required this.exchangeRate,
    required this.conversionAmount,
    required this.totalCharge,
    required this.willGet,
    required this.payable,
  });

  factory PaymentInformations.fromJson(Map<String, dynamic> json) => PaymentInformations(
    trx: json["trx"],
    gatewayCurrencyName: json["gateway_currency_name"],
    requestAmount: json["request_amount"],
    exchangeRate: json["exchange_rate"],
    conversionAmount: json["conversion_amount"],
    totalCharge: json["total_charge"],
    willGet: json["will_get"],
    payable: json["payable"],
  );

  Map<String, dynamic> toJson() => {
    "trx": trx,
    "gateway_currency_name": gatewayCurrencyName,
    "request_amount": requestAmount,
    "exchange_rate": exchangeRate,
    "conversion_amount": conversionAmount,
    "total_charge": totalCharge,
    "will_get": willGet,
    "payable": payable,
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
