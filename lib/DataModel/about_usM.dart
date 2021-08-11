
// To parse this JSON data, do
//
//     final aboutUsM = aboutUsMFromMap(jsonString);

import 'dart:convert';

class AboutUsM {
  AboutUsM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory AboutUsM.fromJson(String str) => AboutUsM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AboutUsM.fromMap(Map<String, dynamic> json) => AboutUsM(
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
    this.visionTitle,
    this.visionTxt,
    this.aboutTitle,
    this.aboutTxt,
    this.messageTitle,
    this.messageTxt,
  });

  String visionTitle;
  String visionTxt;
  String aboutTitle;
  String aboutTxt;
  String messageTitle;
  String messageTxt;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    visionTitle: json["vision_title"],
    visionTxt: json["vision_txt"],
    aboutTitle: json["about_title"],
    aboutTxt: json["about_txt"],
    messageTitle: json["message_title"],
    messageTxt: json["message_txt"],
  );

  Map<String, dynamic> toMap() => {
    "vision_title": visionTitle,
    "vision_txt": visionTxt,
    "about_title": aboutTitle,
    "about_txt": aboutTxt,
    "message_title": messageTitle,
    "message_txt": messageTxt,
  };
}
