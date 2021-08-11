
// To parse this JSON data, do
//
//     final userTicketsListM = userTicketsListMFromMap(jsonString);

import 'dart:convert';

class UserTicketsListM {
  UserTicketsListM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory UserTicketsListM.fromJson(String str) => UserTicketsListM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserTicketsListM.fromMap(Map<String, dynamic> json) => UserTicketsListM(
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
    this.ticketsTypes,
  });

  List<TicketsType> ticketsTypes;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    ticketsTypes: List<TicketsType>.from(json["tickets_types"].map((x) => TicketsType.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "tickets_types": List<dynamic>.from(ticketsTypes.map((x) => x.toMap())),
  };
}

class TicketsType {
  TicketsType({
    this.id,
    this.name,
    this.color,
  });

  int id;
  String name;
  String color;

  factory TicketsType.fromJson(String str) => TicketsType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TicketsType.fromMap(Map<String, dynamic> json) => TicketsType(
    id: json["id"],
    name: json["name"],
    color: json["color"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "color": color,
  };
}
