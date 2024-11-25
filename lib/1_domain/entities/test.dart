import 'dart:convert';

ModelClass modelClassFromJson(String str) =>
    ModelClass.fromJson(json.decode(str));

String modelClassToJson(ModelClass data) => json.encode(data.toJson());

class ModelClass {
  List<Data> data;

  ModelClass({
    required this.data,
  });

  factory ModelClass.fromJson(Map<String, dynamic> json) => ModelClass(
        data: List<Data>.from(json["Data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  CoinInfo coinInfo;
  RAW raw;
  DISPLAY display;
  Data({
    required this.coinInfo,
    required this.raw,
    required this.display,
  });
  factory Data.fromJson(Map<String, dynamic> json) => Data(
        coinInfo: json["CoinInfo"],
        raw: json["RAW"],
        display: json["DISPLAY"],
      );
  Map<String, dynamic> toJson() => {
        "CoinInfo": coinInfo,
        "RAW": raw,
        "DISPLAY": display,
      };
}

class CoinInfo {
  String Id;
  String Name;
  String FullName;
  String ImageUrl;
  CoinInfo({
    required this.Id,
    required this.Name,
    required this.FullName,
    required this.ImageUrl,
  });
  factory CoinInfo.fromJson(Map<String, dynamic> json) => CoinInfo(
        Id: json["Id"],
        Name: json["Name"],
        FullName: json["FullName"],
        ImageUrl: json["ImageUrl"],
      );
  Map<String, dynamic> toJson() => {
        "Id": Id,
        "Name": Name,
        "FullName": FullName,
        "ImageUrl": ImageUrl,
      };
}

class RAW {
  RAW usd;
  RAW({
    required this.usd,
  });
  factory RAW.fromJson(Map<String, dynamic> json) => RAW(
        usd: json["usd"],
      );
  Map<String, dynamic> toJson() => {
        "usd": usd,
      };
}

class DISPLAY {
  USD usd;
  DISPLAY({
    required this.usd,
  });
  factory DISPLAY.fromJson(Map<String, dynamic> json) => DISPLAY(
        usd: json["usd"],
      );
  Map<String, dynamic> toJson() => {
        "usd": usd,
      };
}

class USD {
  String MARKET;
  String FROMSYMBOL;
  String PRICE;
  String IMAGEURL;

  USD({
    required this.MARKET,
    required this.FROMSYMBOL,
    required this.PRICE,
    required this.IMAGEURL,
  });

  factory USD.fromJson(Map<String, dynamic> json) => USD(
        MARKET: json["MARKET"],
        FROMSYMBOL: json["FROMSYMBOL"],
        PRICE: json["PRICE"],
        IMAGEURL: json["IMAGEURL"],
      );

  Map<String, dynamic> toJson() => {
        "MARKET": MARKET,
        "FROMSYMBOL": FROMSYMBOL,
        "PRICE": PRICE,
        "IMAGEURL": IMAGEURL,
      };
}
