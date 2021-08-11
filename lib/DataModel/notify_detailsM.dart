

// To parse this JSON data, do
//
//     final notifyDetailsM = notifyDetailsMFromMap(jsonString);

import 'dart:convert';

class NotifyDetailsM {
  NotifyDetailsM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory NotifyDetailsM.fromJson(String str) => NotifyDetailsM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotifyDetailsM.fromMap(Map<String, dynamic> json) => NotifyDetailsM(
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
    this.notificationDetails,
  });

  NotificationDetails notificationDetails;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    notificationDetails: NotificationDetails.fromMap(json["notification_details"]),
  );

  Map<String, dynamic> toMap() => {
    "notification_details": notificationDetails.toMap(),
  };
}

class NotificationDetails {
  NotificationDetails({
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

  factory NotificationDetails.fromJson(String str) => NotificationDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotificationDetails.fromMap(Map<String, dynamic> json) => NotificationDetails(
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
