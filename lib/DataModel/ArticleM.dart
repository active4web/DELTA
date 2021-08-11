// To parse this JSON data, do
//
//     final articleM = articleMFromMap(jsonString);

import 'dart:convert';

class ArticleM {
  ArticleM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory ArticleM.fromJson(String str) => ArticleM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ArticleM.fromMap(Map<String, dynamic> json) => ArticleM(
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
    this.allSlider,
    this.articlesDetails,
  });

  List<AllSlider> allSlider;
  ArticlesDetails articlesDetails;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    allSlider: List<AllSlider>.from(json["all_slider"].map((x) => AllSlider.fromMap(x))),
    articlesDetails: ArticlesDetails.fromMap(json["articles_details"]),
  );

  Map<String, dynamic> toMap() => {
    "all_slider": List<dynamic>.from(allSlider.map((x) => x.toMap())),
    "articles_details": articlesDetails.toMap(),
  };
}

class AllSlider {
  AllSlider({
    this.img,
    this.depId,
  });

  String img;
  int depId;

  factory AllSlider.fromJson(String str) => AllSlider.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllSlider.fromMap(Map<String, dynamic> json) => AllSlider(
    img: json["img"],
    depId: json["dep_id"],
  );

  Map<String, dynamic> toMap() => {
    "img": img,
    "dep_id": depId,
  };
}

class ArticlesDetails {
  ArticlesDetails({
    this.articleImage,
    this.articleName,
    this.details,
    this.creationDate,
    this.views,
    this.id,
  });

  String articleImage;
  String articleName;
  String details;
  DateTime creationDate;
  String views;
  int id;

  factory ArticlesDetails.fromJson(String str) => ArticlesDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ArticlesDetails.fromMap(Map<String, dynamic> json) => ArticlesDetails(
    articleImage: json["article_image"],
    articleName: json["article_name"],
    details: json["details"],
    creationDate: DateTime.parse(json["creation_date"]),
    views: json["views"],
    id: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "article_image": articleImage,
    "article_name": articleName,
    "details": details,
    "creation_date": "${creationDate.year.toString().padLeft(4, '0')}-${creationDate.month.toString().padLeft(2, '0')}-${creationDate.day.toString().padLeft(2, '0')}",
    "views": views,
    "id": id,
  };
}
