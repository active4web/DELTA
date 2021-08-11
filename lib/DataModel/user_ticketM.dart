

// To parse this JSON data, do
//
//     final userTicketsM = userTicketsMFromMap(jsonString);

import 'dart:convert';

class UserTicketsM {
  UserTicketsM({
    this.message,
    this.codenum,
    this.status,
    this.total,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  int total;
  Result result;

  factory UserTicketsM.fromJson(String str) => UserTicketsM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserTicketsM.fromMap(Map<String, dynamic> json) => UserTicketsM(
    message: json["message"],
    codenum: json["codenum"],
    status: json["status"],
    total: json["total"],
    result: Result.fromMap(json["result"]),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "codenum": codenum,
    "status": status,
    "total": total,
    "result": result.toMap(),
  };
}

class Result {
  Result({
    this.myTickets,
  });

  List<MyTicket> myTickets;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    myTickets: List<MyTicket>.from(json["my_tickets"].map((x) => MyTicket.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "my_tickets": List<dynamic>.from(myTickets.map((x) => x.toMap())),
  };
}

class MyTicket {
  MyTicket({
    this.id,
    this.title,
    this.type,
    this.senderType,
    this.color,
    this.content,
    this.createdAt,
  });

  int id;
  String title;
  String type;
  String senderType;
  String color;
  String content;
  DateTime createdAt;

  factory MyTicket.fromJson(String str) => MyTicket.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MyTicket.fromMap(Map<String, dynamic> json) => MyTicket(
    id: json["id"],
    title: json["title"],
    type: json["type"],
    senderType: json["sender_type"],
    color: json["color"],
    content: json["content"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "type": type,
    "sender_type": senderType,
    "color": color,
    "content": content,
    "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
  };
}
