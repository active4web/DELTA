// To parse this JSON data, do
//
//     final articleCatM = articleCatMFromMap(jsonString);

import 'dart:convert';

class ArticleCatM {
  ArticleCatM({
    this.message,
    this.messageid,
    this.status,
    this.result,
  });

  String message;
  int messageid;
  bool status;
  Result result;

  factory ArticleCatM.fromJson(String str) => ArticleCatM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ArticleCatM.fromMap(Map<String, dynamic> json) => ArticleCatM(
    message: json["Message"],
    messageid: json["Messageid"],
    status: json["status"],
    result: Result.fromMap(json["result"]),
  );

  Map<String, dynamic> toMap() => {
    "Message": message,
    "Messageid": messageid,
    "status": status,
    "result": result.toMap(),
  };
}

class Result {
  Result({
    this.allCategories,
  });

  List<AllCategory> allCategories;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    allCategories: List<AllCategory>.from(json["all_categories"].map((x) => AllCategory.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "all_categories": List<dynamic>.from(allCategories.map((x) => x.toMap())),
  };
}

class AllCategory {
  AllCategory({
    this.categoryId,
    this.categoryName,
    this.allArticles,
  });

  String categoryId;
  String categoryName;
  List<AllArticle> allArticles;

  factory AllCategory.fromJson(String str) => AllCategory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllCategory.fromMap(Map<String, dynamic> json) => AllCategory(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    allArticles: List<AllArticle>.from(json["all_articles"].map((x) => AllArticle.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "all_articles": List<dynamic>.from(allArticles.map((x) => x.toMap())),
  };
}

class AllArticle {
  AllArticle({
    this.articlesImage,
    this.productName,
    this.smallDescription,
    this.prodId,
  });

  String articlesImage;
  String productName;
  String smallDescription;
  int prodId;

  factory AllArticle.fromJson(String str) => AllArticle.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllArticle.fromMap(Map<String, dynamic> json) => AllArticle(
    articlesImage: json["articles_image"],
    productName: json["product_name"],
    smallDescription: json["small_description"],
    prodId: json["prod_id"],
  );

  Map<String, dynamic> toMap() => {

    "articles_image": articlesImage,
    "product_name": productName,
    "small_description": smallDescription,
    "prod_id": prodId,
  };
}

