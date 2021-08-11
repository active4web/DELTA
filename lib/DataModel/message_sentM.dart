


// To parse this JSON data, do
//
//     final messageSentM = messageSentMFromMap(jsonString);

import 'dart:convert';

class MessageSentM {
  MessageSentM({
    this.message,
    this.codenum,
    this.status,
  });

  String message;
  int codenum;
  bool status;

  factory MessageSentM.fromJson(String str) => MessageSentM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MessageSentM.fromMap(Map<String, dynamic> json) => MessageSentM(
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
