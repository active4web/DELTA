// To parse this JSON data, do
//
//     final registrationListM = registrationListMFromMap(jsonString);

import 'dart:convert';

class RegistrationListM {
  RegistrationListM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory RegistrationListM.fromJson(String str) => RegistrationListM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegistrationListM.fromMap(Map<String, dynamic> json) => RegistrationListM(
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
    this.listCountries,
  });

  List<ListCountry> listCountries;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    listCountries: List<ListCountry>.from(json["list_countries"].map((x) => ListCountry.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "list_countries": List<dynamic>.from(listCountries.map((x) => x.toMap())),
  };
}

class ListCountry {
  ListCountry({
    this.nameCity,
    this.idCity,
  });

  String nameCity;
  String idCity;

  factory ListCountry.fromJson(String str) => ListCountry.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListCountry.fromMap(Map<String, dynamic> json) => ListCountry(
    nameCity: json["name_city"],
    idCity: json["id_city"],
  );

  Map<String, dynamic> toMap() => {
    "name_city": nameCity,
    "id_city": idCity,
  };
}
