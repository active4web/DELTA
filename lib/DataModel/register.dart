// To parse this JSON data, do
//
//     final registrationM = registrationMFromMap(jsonString);

import 'dart:convert';

class RegistrationM {
  RegistrationM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory RegistrationM.fromJson(String str) => RegistrationM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegistrationM.fromMap(Map<String, dynamic> json) => RegistrationM(
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
    this.name,
    this.phone,
    this.id,
    this.fullname,
    this.lang,
    this.country,
    this.token,
  });

  String name;
  String phone;
  int id;
  String fullname;
  String lang;
  String country;
  String token;

  factory ClientDatum.fromJson(String str) => ClientDatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClientDatum.fromMap(Map<String, dynamic> json) => ClientDatum(
    name: json["name"],
    phone: json["phone"],
    id: json["id"],
    fullname: json["fullname"],
    lang: json["lang"],
    country: json["country"],
    token: json["token"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "phone": phone,
    "id": id,
    "fullname": fullname,
    "lang": lang,
    "country": country,
    "token": token,
  };
}
