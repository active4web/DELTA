
// To parse this JSON data, do
//
//     final engineeringServicesOffersM = engineeringServicesOffersMFromMap(jsonString);

import 'dart:convert';

class EngineeringServicesOffersM {
  EngineeringServicesOffersM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory EngineeringServicesOffersM.fromJson(String str) => EngineeringServicesOffersM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EngineeringServicesOffersM.fromMap(Map<String, dynamic> json) => EngineeringServicesOffersM(
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
    this.color,
  });

  String title;
  String description;
  int id;
  String details;
  String color;

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

class LableList {
  LableList({
    this.title,
    this.lebalId,
    this.type,
    this.listAnwser,
  });

  String title;
  int lebalId;
  int type;
  List<ListAnwser> listAnwser;

  factory LableList.fromJson(String str) => LableList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LableList.fromMap(Map<String, dynamic> json) => LableList(
    title: json["title"],
    lebalId: json["lebal_id"],
    type: json["type"],
    listAnwser: List<ListAnwser>.from(json["list_anwser"].map((x) => ListAnwser.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "lebal_id": lebalId,
    "type": type,
    "list_anwser": List<dynamic>.from(listAnwser.map((x) => x.toMap())),
  };
}

class ListAnwser {
  ListAnwser({
    this.title,
    this.answerId,
    this.textCategory,
  });

  String title;
  int answerId;
  String textCategory;

  factory ListAnwser.fromJson(String str) => ListAnwser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListAnwser.fromMap(Map<String, dynamic> json) => ListAnwser(
    title: json["title"],
    answerId: json["answer_id"],
    textCategory: json["text_category"],
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "answer_id": answerId,
    "text_category": textCategory,
  };
}
