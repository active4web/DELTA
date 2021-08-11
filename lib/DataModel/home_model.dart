// To parse this JSON data, do
//
//     final homeM = homeMFromMap(jsonString);

import 'dart:convert';

class HomeM {
  HomeM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory HomeM.fromJson(String str) => HomeM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HomeM.fromMap(Map<String, dynamic> json) => HomeM(
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
    this.mainOffers,
    this.allCategories,
  });

  List<MainOffer> mainOffers;
  List<AllCategory> allCategories;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    mainOffers: List<MainOffer>.from(json["main_offers"].map((x) => MainOffer.fromMap(x))),
    allCategories: List<AllCategory>.from(json["all_categories"].map((x) => AllCategory.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "main_offers": List<dynamic>.from(mainOffers.map((x) => x.toMap())),
    "all_categories": List<dynamic>.from(allCategories.map((x) => x.toMap())),
  };
}

class AllCategory {
  AllCategory({
    this.categoryImg,
    this.categoryName,
    this.catId,
  });

  String categoryImg;
  String categoryName;
  int catId;

  factory AllCategory.fromJson(String str) => AllCategory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllCategory.fromMap(Map<String, dynamic> json) => AllCategory(
    categoryImg: json["category_img"],
    categoryName: json["category_name"],
    catId: json["cat_id"],
  );

  Map<String, dynamic> toMap() => {
    "category_img": categoryImg,
    "category_name": categoryName,
    "cat_id": catId,
  };
}

class MainOffer {
  MainOffer({
    this.image,
    this.link,
  });

  String image;
  String link;

  factory MainOffer.fromJson(String str) => MainOffer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MainOffer.fromMap(Map<String, dynamic> json) => MainOffer(
    image: json["image"],
    link: json["link"],
  );

  Map<String, dynamic> toMap() => {
    "image": image,
    "link": link,
  };
}
