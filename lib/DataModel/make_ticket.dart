
// To parse this JSON data, do
//
//     final makeTicketM = makeTicketMFromMap(jsonString);

import 'dart:convert';

class MakeTicketM {
  MakeTicketM({
    this.message,
    this.codenum,
    this.status,
  });

  String message;
  int codenum;
  bool status;

  factory MakeTicketM.fromJson(String str) => MakeTicketM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MakeTicketM.fromMap(Map<String, dynamic> json) => MakeTicketM(
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
