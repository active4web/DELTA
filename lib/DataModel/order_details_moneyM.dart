// To parse this JSON data, do
//
//     final orderDetailsMoneyM = orderDetailsMoneyMFromMap(jsonString);

import 'dart:convert';

class OrderDetailsMoneyM {
  OrderDetailsMoneyM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory OrderDetailsMoneyM.fromJson(String str) => OrderDetailsMoneyM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetailsMoneyM.fromMap(Map<String, dynamic> json) => OrderDetailsMoneyM(
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
    this.whatsapp,
    this.orderDetails,
  });

  String whatsapp;
  List<OrderDetail> orderDetails;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    whatsapp: json["whatsapp"],
    orderDetails: List<OrderDetail>.from(json["order_details"].map((x) => OrderDetail.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "whatsapp": whatsapp,
    "order_details": List<dynamic>.from(orderDetails.map((x) => x.toMap())),
  };
}

class OrderDetail {
  OrderDetail({
    this.totalMoney,
    this.paidValue,
    this.idOrder,
    this.details,
    this.creationDate,
    this.type,
    this.currencyName,
  });

  int totalMoney;
  String paidValue;
  int idOrder;
  String details;
  DateTime creationDate;
  String type;
  String currencyName;

  factory OrderDetail.fromJson(String str) => OrderDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetail.fromMap(Map<String, dynamic> json) => OrderDetail(
    totalMoney: json["total_money"],
    paidValue: json["paid_value"],
    idOrder: json["id_order"],
    details: json["details"],
    creationDate: DateTime.parse(json["creation_date"]),
    type: json["type"],
    currencyName: json["currency_name"] == null ? null : json["currency_name"],
  );

  Map<String, dynamic> toMap() => {
    "total_money": totalMoney,
    "paid_value": paidValue,
    "id_order": idOrder,
    "details": details,
    "creation_date": "${creationDate.year.toString().padLeft(4, '0')}-${creationDate.month.toString().padLeft(2, '0')}-${creationDate.day.toString().padLeft(2, '0')}",
    "type": type,
    "currency_name": currencyName == null ? null : currencyName,
  };
}
