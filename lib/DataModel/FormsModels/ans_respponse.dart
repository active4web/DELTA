// To parse this JSON data, do
//
//     final resAnsM = resAnsMFromMap(jsonString);

import 'dart:convert';

class ResAnsM {
  ResAnsM({
    this.message,
    this.codenum,
    this.status,
  });

  String message;
  int codenum;
  bool status;

  factory ResAnsM.fromJson(String str) => ResAnsM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResAnsM.fromMap(Map<String, dynamic> json) => ResAnsM(
    message: json["message"],
    codenum: json["codenum"],
    status: json["status"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "codenum": codenum,
    "status": status,
  };
}
