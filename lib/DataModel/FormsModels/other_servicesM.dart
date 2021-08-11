// To parse this JSON data, do
//
//     final otherServicesM = otherServicesMFromMap(jsonString);

import 'dart:convert';

class OtherServicesM {
  OtherServicesM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory OtherServicesM.fromJson(String str) => OtherServicesM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OtherServicesM.fromMap(Map<String, dynamic> json) => OtherServicesM(
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
    this.categoryDate,
  });

  CategoryDate categoryDate;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    categoryDate: CategoryDate.fromMap(json["category_date"]),
  );

  Map<String, dynamic> toMap() => {
    "category_date": categoryDate.toMap(),
  };
}

class CategoryDate {
  CategoryDate({
    this.title,
    this.description,
    this.id,
    this.details,
    this.color,
  });

  String title;
  String description;
  int id;
  String details;
  dynamic color;

  factory CategoryDate.fromJson(String str) => CategoryDate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryDate.fromMap(Map<String, dynamic> json) => CategoryDate(
    title: json["title"],
    description: json["description"],
    id: json["id"],
    details: json["details"],
    color: json["color"],
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "description": description,
    "id": id,
    "details": details,
    "color": color,
  };
}
