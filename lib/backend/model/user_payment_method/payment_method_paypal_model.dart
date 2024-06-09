import 'dart:convert';

PaymentMethodPaypalModel paymentMethodPaypalModelFromJson(String str) =>
    PaymentMethodPaypalModel.fromJson(json.decode(str));

String paymentMethodPaypalModelToJson(PaymentMethodPaypalModel data) =>
    json.encode(data.toJson());

class PaymentMethodPaypalModel {
  Message message;
  Data data;

  PaymentMethodPaypalModel({
    required this.message,
    required this.data,
  });

  factory PaymentMethodPaypalModel.fromJson(Map<String, dynamic> json) =>
      PaymentMethodPaypalModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  String gategayType;
  String gatewayCurrencyName;
  String alias;
  String identify;
  PaymentInformations paymentInformations;
  List<Url> url;
  String method;

  Data({
    required this.gategayType,
    required this.gatewayCurrencyName,
    required this.alias,
    required this.identify,
    required this.paymentInformations,
    required this.url,
    required this.method,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        gategayType: json["gategay_type"],
        gatewayCurrencyName: json["gateway_currency_name"],
        alias: json["alias"],
        identify: json["identify"],
        paymentInformations:
            PaymentInformations.fromJson(json["payment_informations"]),
        url: List<Url>.from(json["url"].map((x) => Url.fromJson(x))),
        method: json["method"],
      );

  Map<String, dynamic> toJson() => {
        "gategay_type": gategayType,
        "gateway_currency_name": gatewayCurrencyName,
        "alias": alias,
        "identify": identify,
        "payment_informations": paymentInformations.toJson(),
        "url": List<dynamic>.from(url.map((x) => x.toJson())),
        "method": method,
      };
}

class PaymentInformations {
  String trx;
  String gatewayCurrencyName;
  String requestAmount;
  String exchangeRate;
  String totalCharge;
  String payableAmount;

  PaymentInformations({
    required this.trx,
    required this.gatewayCurrencyName,
    required this.requestAmount,
    required this.exchangeRate,
    required this.totalCharge,
    required this.payableAmount,
  });

  factory PaymentInformations.fromJson(Map<String, dynamic> json) =>
      PaymentInformations(
        trx: json["trx"],
        gatewayCurrencyName: json["gateway_currency_name"],
        requestAmount: json["request_amount"],
        exchangeRate: json["exchange_rate"],
        totalCharge: json["total_charge"],
        payableAmount: json["payable_amount"],
      );

  Map<String, dynamic> toJson() => {
        "trx": trx,
        "gateway_currency_name": gatewayCurrencyName,
        "request_amount": requestAmount,
        "exchange_rate": exchangeRate,
        "total_charge": totalCharge,
        "payable_amount": payableAmount,
      };
}

class Url {
  String href;
  String rel;
  String method;

  Url({
    required this.href,
    required this.rel,
    required this.method,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        href: json["href"],
        rel: json["rel"],
        method: json["method"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "rel": rel,
        "method": method,
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
