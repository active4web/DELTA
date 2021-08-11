// To parse this JSON data, do
//
//     final notifyListM = notifyListMFromMap(jsonString);

import 'dart:convert';

class NotifyListM {
  NotifyListM({
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

  factory NotifyListM.fromJson(String str) => NotifyListM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotifyListM.fromMap(Map<String, dynamic> json) => NotifyListM(
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
    this.allNotifications,
  });

  List<AllNotification> allNotifications;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    allNotifications: List<AllNotification>.from(json["all_notifications"].map((x) => AllNotification.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "all_notifications": List<dynamic>.from(allNotifications.map((x) => x.toMap())),
  };
}

class AllNotification {
  AllNotification({
    this.title,
    this.id,
    this.body,
    this.isRead,
    this.createdAt,
    this.img,
  });

  String title;
  int id;
  String body;
  int isRead;
  DateTime createdAt;
  String img;

  factory AllNotification.fromJson(String str) => AllNotification.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllNotification.fromMap(Map<String, dynamic> json) => AllNotification(
    title: json["title"],
    id: json["id"],
    body: json["body"],
    isRead: json["is_read"],
    createdAt: DateTime.parse(json["created_at"]),
    img: json["img"],
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "id": id,
    "body": body,
    "is_read": isRead,
    "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
    "img": img,
  };
}
