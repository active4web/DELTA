

// To parse this JSON data, do
//
//     final profileInfoM = profileInfoMFromMap(jsonString);

import 'dart:convert';

class ProfileInfoM {
  ProfileInfoM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory ProfileInfoM.fromJson(String str) => ProfileInfoM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfileInfoM.fromMap(Map<String, dynamic> json) => ProfileInfoM(
    message: json["message"],
    codenum: json["codenum"],
    status: json["status"],
    result: Result.fromMap(json["result"]),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "codenum": codenum,
    "status": status,
    "result": result.toMap(),
  };
}

class Result {
  Result({
    this.customerInfo,
  });

  CustomerInfo customerInfo;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    customerInfo: CustomerInfo.fromMap(json["customer_info"]),
  );

  Map<String, dynamic> toMap() => {
    "customer_info": customerInfo.toMap(),
  };
}

class CustomerInfo {
  CustomerInfo({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.countryName,
    this.countryId,
    this.token,
    this.email
  });

  int id;
  String name;
  String phone;
  String address;
  String countryName;
  String countryId;
  String email;
  String token;

  factory CustomerInfo.fromJson(String str) => CustomerInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomerInfo.fromMap(Map<String, dynamic> json) => CustomerInfo(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    address: json["address"],
    countryName: json["country_name"],
    countryId: json["country_id"],
    token: json["token"],
    email:json["email"],
  );

  Map<String, dynamic> toMap() => {
    "email":email,
    "id": id,
    "name": name,
    "phone": phone,
    "address": address,
    "country_name": countryName,
    "country_id": countryId,
    "token": token,
  };
}
