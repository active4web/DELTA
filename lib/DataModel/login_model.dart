
// To parse this JSON data, do
//
//     final loginM = loginMFromMap(jsonString);

import 'dart:convert';

class LoginM {
  LoginM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory LoginM.fromJson(String str) => LoginM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginM.fromMap(Map<String, dynamic> json) => LoginM(
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

  List<ClientDatum> clientData;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    clientData: List<ClientDatum>.from(json["client_data"].map((x) => ClientDatum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "client_data": List<dynamic>.from(clientData.map((x) => x.toMap())),
  };
}

class ClientDatum {
  ClientDatum({
    this.phone,
    this.id,
    this.fullname,
    this.email,
    this.cityId,
    this.cityName,
    this.token,
  });

  String phone;
  int id;
  String fullname;
  String email;
  String cityId;
  String cityName;
  String token;

  factory ClientDatum.fromJson(String str) => ClientDatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClientDatum.fromMap(Map<String, dynamic> json) => ClientDatum(
    phone: json["phone"],
    id: json["id"],
    fullname: json["fullname"],
    email: json["email"],
    cityId: json["city_id"],
    cityName: json["city_name"],
    token: json["token"],
  );

  Map<String, dynamic> toMap() => {
    "phone": phone,
    "id": id,
    "fullname": fullname,
    "email": email,
    "city_id": cityId,
    "city_name": cityName,
    "token": token,
  };
}
