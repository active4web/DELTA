// To parse this JSON data, do
//
//     final deleteNotifyM = deleteNotifyMFromMap(jsonString);

import 'dart:convert';

class DeleteNotifyM {
  DeleteNotifyM({
    this.message,
    this.codenum,
    this.status,
  });

  String message;
  int codenum;
  bool status;

  factory DeleteNotifyM.fromJson(String str) => DeleteNotifyM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeleteNotifyM.fromMap(Map<String, dynamic> json) => DeleteNotifyM(
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
