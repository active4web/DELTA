// To parse this JSON data, do
//
//     final orderDetailsM = orderDetailsMFromMap(jsonString);

import 'dart:convert';

class OrderDetailsM {
  OrderDetailsM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory OrderDetailsM.fromJson(String str) => OrderDetailsM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetailsM.fromMap(Map<String, dynamic> json) => OrderDetailsM(
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
    this.orderDetails,
  });

  List<OrderDetail> orderDetails;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    orderDetails: List<OrderDetail>.from(json["order_details"].map((x) => OrderDetail.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "order_details": List<dynamic>.from(orderDetails.map((x) => x.toMap())),
  };
}

class OrderDetail {
  OrderDetail({
    this.codeName,
    this.idOrder,
    this.formName,
    this.details,
    this.finalDetails,
    this.whatsapp,
    this.phone,
    this.date,
    this.viewStore,
  });

  int codeName;
  int idOrder;
  String formName;
  String details;
  String finalDetails;
  String whatsapp;
  String phone;
  DateTime date;
  bool viewStore;

  factory OrderDetail.fromJson(String str) => OrderDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetail.fromMap(Map<String, dynamic> json) => OrderDetail(
    codeName: json["code_name"],
    idOrder: json["id_order"],
    formName: json["form_name"],
    details: json["details"],
    finalDetails: json["final_details"],
    whatsapp: json["whatsapp"],
    phone: json["phone"],
    date: DateTime.parse(json["date"]),
    viewStore: json["view_store"],
  );

  Map<String, dynamic> toMap() => {
    "code_name": codeName,
    "id_order": idOrder,
    "form_name": formName,
    "details": details,
    "final_details": finalDetails,
    "whatsapp": whatsapp,
    "phone": phone,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "view_store": viewStore,
  };
}
