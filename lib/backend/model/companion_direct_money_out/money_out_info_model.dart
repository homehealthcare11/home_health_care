import 'dart:convert';

WithdrawInfoModel withdrawInfoModelFromJson(String str) =>
    WithdrawInfoModel.fromJson(json.decode(str));

String withdrawInfoModelToJson(WithdrawInfoModel data) =>
    json.encode(data.toJson());

class WithdrawInfoModel {
  final Message message;
  final Data data;

  WithdrawInfoModel({
    required this.message,
    required this.data,
  });

  factory WithdrawInfoModel.fromJson(Map<String, dynamic> json) =>
      WithdrawInfoModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  final dynamic baseCurr;
  final int baseCurrRate;
  final dynamic defaultImage;
  final dynamic imagePath;
  final NannyWallet nannyWallet;
  final List<Gateway> gateways;
  final List<Transactionss> transactionss;

  Data({
    required this.baseCurr,
    required this.baseCurrRate,
    required this.defaultImage,
    required this.imagePath,
    required this.nannyWallet,
    required this.gateways,
    required this.transactionss,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        baseCurr: json["base_curr"],
        baseCurrRate: json["base_curr_rate"],
        defaultImage: json["default_image"] ?? '',
        imagePath: json["image_path"] ?? '',
        nannyWallet: NannyWallet.fromJson(json["nannyWallet"]),
        gateways: List<Gateway>.from(
            json["gateways"].map((x) => Gateway.fromJson(x))),
        transactionss: List<Transactionss>.from(
            json["transactionss"].map((x) => Transactionss.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "base_curr": baseCurr,
        "base_curr_rate": baseCurrRate,
        "default_image": defaultImage,
        "image_path": imagePath,
        "nannyWallet": nannyWallet.toJson(),
        "gateways": List<dynamic>.from(gateways.map((x) => x.toJson())),
        "transactionss":
            List<dynamic>.from(transactionss.map((x) => x.toJson())),
      };
}

class Gateway {
  final int id;
  final dynamic image;
  final dynamic slug;
  final int code;
  final dynamic type;
  final dynamic alias;
  final List<String> supportedCurrencies;
  final List<InputField> inputFields;
  final int status;
  final List<Currency> currencies;

  Gateway({
    required this.id,
    required this.image,
    required this.slug,
    required this.code,
    required this.type,
    required this.alias,
    required this.supportedCurrencies,
    required this.inputFields,
    required this.status,
    required this.currencies,
  });

  factory Gateway.fromJson(Map<String, dynamic> json) => Gateway(
        id: json["id"],
        image: json["image"] ?? '',
        slug: json["slug"] ?? '',
        code: json["code"],
        type: json["type"] ?? '',
        alias: json["alias"] ?? '',
        supportedCurrencies:
            List<String>.from(json["supported_currencies"].map((x) => x)),
        inputFields: List<InputField>.from(
            json["input_fields"].map((x) => InputField.fromJson(x))),
        status: json["status"],
        currencies: List<Currency>.from(
            json["currencies"].map((x) => Currency.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "slug": slug,
        "code": code,
        "type": type,
        "alias": alias,
        "supported_currencies":
            List<dynamic>.from(supportedCurrencies.map((x) => x)),
        "input_fields": List<dynamic>.from(inputFields.map((x) => x.toJson())),
        "status": status,
        "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
      };
}

class Currency {
  final int id;
  final int paymentGatewayId;
  final dynamic type;
  final dynamic name;
  final dynamic alias;
  final dynamic currencyCode;
  final dynamic currencySymbol;
  final dynamic image;
  final int minLimit;
  final int maxLimit;
  final int percentCharge;
  final int fixedCharge;
  final double rate;

  Currency({
    required this.id,
    required this.paymentGatewayId,
    required this.type,
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
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        paymentGatewayId: json["payment_gateway_id"],
        type: json["type"] ?? '',
        name: json["name"] ?? '',
        alias: json["alias"] ?? '',
        currencyCode: json["currency_code"] ?? '',
        currencySymbol: json["currency_symbol"] ?? '',
        image: json["image"] ?? '',
        minLimit: json["min_limit"],
        maxLimit: json["max_limit"],
        percentCharge: json["percent_charge"],
        fixedCharge: json["fixed_charge"],
        rate: json["rate"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "payment_gateway_id": paymentGatewayId,
        "type": type,
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
      };
}

class InputField {
  final dynamic type;
  final dynamic label;
  final dynamic name;
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
  final dynamic max;
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
        max: json["max"] ?? '',
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

class NannyWallet {
  final dynamic balance;
  final dynamic currency;

  NannyWallet({
    required this.balance,
    required this.currency,
  });

  factory NannyWallet.fromJson(Map<String, dynamic> json) => NannyWallet(
        balance: json["balance"] ?? "0.0",
        currency: json["currency"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
        "currency": currency,
      };
}

class Transactionss {
  final int id;
  final dynamic trx;
  final dynamic gatewayName;
  final dynamic gatewayCurrencyName;
  final dynamic transactionType;
  final dynamic requestAmount;
  final dynamic payable;
  final dynamic exchangeRate;
  final dynamic totalCharge;
  final dynamic currentBalance;
  final dynamic status;
  final DateTime dateTime;
  final StatusInfo statusInfo;
  final dynamic rejectionReason;

  Transactionss({
    required this.id,
    required this.trx,
    required this.gatewayName,
    required this.gatewayCurrencyName,
    required this.transactionType,
    required this.requestAmount,
    required this.payable,
    required this.exchangeRate,
    required this.totalCharge,
    required this.currentBalance,
    required this.status,
    required this.dateTime,
    required this.statusInfo,
    required this.rejectionReason,
  });

  factory Transactionss.fromJson(Map<String, dynamic> json) => Transactionss(
        id: json["id"],
        trx: json["trx"] ?? '',
        gatewayName: json["gateway_name"] ?? '',
        gatewayCurrencyName: json["gateway_currency_name"] ?? '',
        transactionType: json["transaction_type"] ?? '',
        requestAmount: json["request_amount"] ?? '',
        payable: json["payable"] ?? '',
        exchangeRate: json["exchange_rate"] ?? '',
        totalCharge: json["total_charge"] ?? '',
        currentBalance: json["current_balance"] ?? '',
        status: json["status"] ?? '',
        dateTime: DateTime.parse(json["date_time"]),
        statusInfo: StatusInfo.fromJson(json["status_info"]),
        rejectionReason: json["rejection_reason"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "trx": trx,
        "gateway_name": gatewayName,
        "gateway_currency_name": gatewayCurrencyName,
        "transaction_type": transactionType,
        "request_amount": requestAmount,
        "payable": payable,
        "exchange_rate": exchangeRate,
        "total_charge": totalCharge,
        "current_balance": currentBalance,
        "status": status,
        "date_time": dateTime.toIso8601String(),
        "status_info": statusInfo.toJson(),
        "rejection_reason": rejectionReason,
      };
}

class StatusInfo {
  final int success;
  final int pending;
  final int rejected;

  StatusInfo({
    required this.success,
    required this.pending,
    required this.rejected,
  });

  factory StatusInfo.fromJson(Map<String, dynamic> json) => StatusInfo(
        success: json["success"],
        pending: json["pending"],
        rejected: json["rejected"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "pending": pending,
        "rejected": rejected,
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
