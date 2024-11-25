// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

class CryptoEntity extends Equatable {
  List<Data> data;

  CryptoEntity({required this.data});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Data': data,
    };
  }

  String toJson() => json.encode(toMap());

  factory CryptoEntity.fromJson(Map<String, dynamic> map) {
    return CryptoEntity(
      data: map['Data'] as List<Data>,
    );
  }
  @override
  List<Object?> get props => [
        [data]
      ];
}

class Data extends Equatable {
  CoinInfo coinInfo;
  DISPLAY display;
  Data({
    required this.coinInfo,
    required this.display,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'CoinInfo': coinInfo, 'DISPLAY': display};
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(Map<String, dynamic> map) {
    return Data(
      coinInfo: map['CoinInfo'] as CoinInfo,
      display: map['DISPLAY'] as DISPLAY,
    );
  }

  @override
  List<Object?> get props => [coinInfo, display];
}

class CoinInfo extends Equatable {
  String Name;
  String FullName;
  String imageUrl;
  CoinInfo({
    required this.Name,
    required this.FullName,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Name': Name,
      'FullName': FullName,
      'ImageUrl': imageUrl,
    };
  }

  String toJson() => json.encode(toMap());

  factory CoinInfo.fromJson(Map<String, dynamic> map) {
    return CoinInfo(
      Name: map['Name'] as String? ?? "",
      FullName: map['FullName'] as String? ?? "",
      imageUrl: map['ImageUrl'] as String? ?? "",
    );
  }

  @override
  List<Object?> get props => [Name, FullName, imageUrl];
}

class DISPLAY extends Equatable {
  USD_DISPLAY? usd;
  DISPLAY({
    required this.usd,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'USD': usd};
  }

  String toJson() => json.encode(toMap());

  factory DISPLAY.fromJson(Map<String, dynamic> map) {
    return DISPLAY(usd: map['USD'] as USD_DISPLAY?);
  }

  @override
  List<Object?> get props => [usd];
}

class USD_DISPLAY extends Equatable {
  String PRICE;
  String CHANGEPCT24HOUR;

  USD_DISPLAY({
    required this.PRICE,
    required this.CHANGEPCT24HOUR,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'PRICE': PRICE,
      'CHANGEPCT24HOUR': CHANGEPCT24HOUR
    };
  }

  String toJson() => json.encode(toMap());

  factory USD_DISPLAY.fromJson(Map<String, dynamic> map) {
    return USD_DISPLAY(
        PRICE: map['PRICE'] as String,
        CHANGEPCT24HOUR: map['CHANGEPCT24HOUR'] as String);
  }

  @override
  List<Object?> get props => [PRICE, CHANGEPCT24HOUR];
}
