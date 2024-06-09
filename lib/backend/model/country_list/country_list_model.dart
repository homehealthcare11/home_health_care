import 'dart:convert';

CountryListModel countryListModelFromJson(String str) =>
    CountryListModel.fromJson(json.decode(str));

String countryListModelToJson(CountryListModel data) =>
    json.encode(data.toJson());

class CountryListModel {
  Message message;
  Data data;

  CountryListModel({
    required this.message,
    required this.data,
  });

  factory CountryListModel.fromJson(Map<String, dynamic> json) =>
      CountryListModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  List<String> success;

  Data({
    required this.success,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        success: List<String>.from(json["success"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": List<dynamic>.from(success.map((x) => x)),
      };
}

class Message {
  List<Country> countries;

  Message({
    required this.countries,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        countries: List<Country>.from(
            json["countries"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
      };
}

class Country {
  int id;
  String name;
  String mobileCode;
  String currencyName;
  String currencyCode;
  String currencySymbol;

  Country({
    required this.id,
    required this.name,
    required this.mobileCode,
    required this.currencyName,
    required this.currencyCode,
    required this.currencySymbol,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        mobileCode: json["mobile_code"],
        currencyName: json["currency_name"],
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile_code": mobileCode,
        "currency_name": currencyName,
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
      };
}
