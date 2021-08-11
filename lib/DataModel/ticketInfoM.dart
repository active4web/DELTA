// To parse this JSON data, do
//
//     final ticketInfoM = ticketInfoMFromMap(jsonString);

import 'dart:convert';

class TicketInfoM {
  TicketInfoM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory TicketInfoM.fromJson(String str) => TicketInfoM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TicketInfoM.fromMap(Map<String, dynamic> json) => TicketInfoM(
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
    this.ticketInfo,
  });

  TicketInfo ticketInfo;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    ticketInfo: TicketInfo.fromMap(json["ticket_info"]),
  );

  Map<String, dynamic> toMap() => {
    "ticket_info": ticketInfo.toMap(),
  };
}

class TicketInfo {
  TicketInfo({
    this.ticket,
    this.repliesNumber,
    this.ticketReplies,
  });

  Ticket ticket;
  int repliesNumber;
  List<TicketReply> ticketReplies;

  factory TicketInfo.fromJson(String str) => TicketInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TicketInfo.fromMap(Map<String, dynamic> json) => TicketInfo(
    ticket: Ticket.fromMap(json["ticket"]),
    repliesNumber: json["replies_number"],
    ticketReplies: List<TicketReply>.from(json["ticket_replies"].map((x) => TicketReply.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "ticket": ticket.toMap(),
    "replies_number": repliesNumber,
    "ticket_replies": List<dynamic>.from(ticketReplies.map((x) => x.toMap())),
  };
}

class Ticket {
  Ticket({
    this.ticketId,
    this.title,
    this.type,
    this.color,
    this.content,
    this.createdAt,
  });

  int ticketId;
  String title;
  String type;
  String color;
  String content;
  DateTime createdAt;

  factory Ticket.fromJson(String str) => Ticket.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ticket.fromMap(Map<String, dynamic> json) => Ticket(
    ticketId: json["ticket_id"],
    title: json["title"],
    type: json["type"],
    color: json["color"],
    content: json["content"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toMap() => {
    "ticket_id": ticketId,
    "title": title,
    "type": type,
    "color": color,
    "content": content,
    "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
  };
}

class TicketReply {
  TicketReply({
    this.id,
    this.createdAt,
    this.time,
    this.content,
    this.sender,
    this.senderType,
  });

  int id;
  DateTime createdAt;
  String time;
  String content;
  String sender;
  int senderType;

  factory TicketReply.fromJson(String str) => TicketReply.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TicketReply.fromMap(Map<String, dynamic> json) => TicketReply(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    time: json["time"],
    content: json["content"],
    sender: json["sender"],
    senderType: json["sender_type"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
    "time": time,
    "content": content,
    "sender": sender,
    "sender_type": senderType,
  };
}
