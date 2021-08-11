// To parse this JSON data, do
//
//     final editProM = editProMFromMap(jsonString);

import 'dart:convert';

class EditProM {
  EditProM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory EditProM.fromJson(String str) => EditProM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EditProM.fromMap(Map<String, dynamic> json) => EditProM(
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
    this.clientData,
  });

  ClientData clientData;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    clientData: ClientData.fromMap(json["client_data"]),
  );

  Map<String, dynamic> toMap() => {
    "client_data": clientData.toMap(),
  };
}

class ClientData {
  ClientData({
    this.id,
    this.name,
    this.phone,
    this.tokenId,
    this.countryId,
    this.cityName,
  });

  int id;
  String name;
  String phone;
  String tokenId;
  String countryId;
  String cityName;

  factory ClientData.fromJson(String str) => ClientData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClientData.fromMap(Map<String, dynamic> json) => ClientData(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    tokenId: json["token_id"],
    countryId: json["country_id"],
    cityName: json["city_name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "phone": phone,
    "token_id": tokenId,
    "country_id": countryId,
    "city_name": cityName,
  };
}
