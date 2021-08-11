// To parse this JSON data, do
//
//     final designNowM = designNowMFromMap(jsonString);

import 'dart:convert';

class DesignNowM {
  DesignNowM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory DesignNowM.fromJson(String str) => DesignNowM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DesignNowM.fromMap(Map<String, dynamic> json) => DesignNowM(
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
    this.lableList,
  });

  CategoryDate categoryDate;
  List<LableList> lableList;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    categoryDate: CategoryDate.fromMap(json["category_date"]),
    lableList: List<LableList>.from(json["lable_list"].map((x) => LableList.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "category_date": categoryDate.toMap(),
    "lable_list": List<dynamic>.from(lableList.map((x) => x.toMap())),
  };
}

class CategoryDate {
  CategoryDate({
    this.title,
    this.description,
    this.id,
    this.details,
  });

  String title;
  dynamic description;
  int id;
  String details;

  factory CategoryDate.fromJson(String str) => CategoryDate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryDate.fromMap(Map<String, dynamic> json) => CategoryDate(
    title: json["title"],
    description: json["description"],
    id: json["id"],
    details: json["details"],
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "description": description,
    "id": id,
    "details": details,
  };
}

class LableList {
  LableList({
    this.title,
    this.lebalId,
  });

  String title;
  int lebalId;

  factory LableList.fromJson(String str) => LableList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LableList.fromMap(Map<String, dynamic> json) => LableList(
    title: json["title"],
    lebalId: json["lebal_id"],
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "lebal_id": lebalId,
  };
}
