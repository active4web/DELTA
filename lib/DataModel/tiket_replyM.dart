

// To parse this JSON data, do
//
//     final ticketReplyM = ticketReplyMFromMap(jsonString);

import 'dart:convert';

class TicketReplyM {
  TicketReplyM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory TicketReplyM.fromJson(String str) => TicketReplyM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TicketReplyM.fromMap(Map<String, dynamic> json) => TicketReplyM(
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
    this.replies,
  });

  Replies replies;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    replies: Replies.fromMap(json["replies"]),
  );

  Map<String, dynamic> toMap() => {
    "replies": replies.toMap(),
  };
}

class Replies {
  Replies({
    this.id,
    this.createdAt,
    this.time,
    this.content,
    this.sender,
  });

  String id;
  DateTime createdAt;
  String time;
  String content;
  String sender;

  factory Replies.fromJson(String str) => Replies.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Replies.fromMap(Map<String, dynamic> json) => Replies(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    time: json["time"],
    content: json["content"],
    sender: json["sender"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
    "time": time,
    "content": content,
    "sender": sender,
  };
}
