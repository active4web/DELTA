// To parse this JSON data, do
//
//     final introM = introMFromMap(jsonString);

import 'dart:convert';

class IntroM {
  IntroM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory IntroM.fromJson(String str) => IntroM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IntroM.fromMap(Map<String, dynamic> json) => IntroM(
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
    this.txtImg,
    this.txtImg1,
    this.txtImg3,
    this.titleT1,
    this.txtT1,
    this.titleT2,
    this.txtT2,
    this.titleT3,
    this.txtT3,
  });

  String txtImg;
  String txtImg1;
  String txtImg3;
  String titleT1;
  String txtT1;
  String titleT2;
  String txtT2;
  String titleT3;
  String txtT3;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    txtImg: json["txt_img"],
    txtImg1: json["txt_img1"],
    txtImg3: json["txt_img3"],
    titleT1: json["title_t1"],
    txtT1: json["txt_t1"],
    titleT2: json["title_t2"],
    txtT2: json["txt_t2"],
    titleT3: json["title_t3"],
    txtT3: json["txt_t3"],
  );

  Map<String, dynamic> toMap() => {
    "txt_img": txtImg,
    "txt_img1": txtImg1,
    "txt_img3": txtImg3,
    "title_t1": titleT1,
    "txt_t1": txtT1,
    "title_t2": titleT2,
    "txt_t2": txtT2,
    "title_t3": titleT3,
    "txt_t3": txtT3,
  };
}
