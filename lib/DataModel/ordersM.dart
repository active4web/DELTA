


// To parse this JSON data, do
//
//     final ordersM = ordersMFromMap(jsonString);

import 'dart:convert';

class OrdersM {
  OrdersM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory OrdersM.fromJson(String str) => OrdersM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrdersM.fromMap(Map<String, dynamic> json) => OrdersM(
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
    this.codeOrder,
    this.requestName,
    this.idOrder,
    this.totalPrice,
    this.currencyName,
    this.date,
    this.viewStore,
    this.viewId,
  });

  int codeOrder;
  String requestName;
  int idOrder;
  String totalPrice;
  String currencyName;
  DateTime date;
  String viewStore;
  int viewId;

  factory OrderDetail.fromJson(String str) => OrderDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetail.fromMap(Map<String, dynamic> json) => OrderDetail(
    codeOrder: json["code_order"],
    requestName: json["request_name"],
    idOrder: json["id_order"],
    totalPrice: json["total_price"],
    currencyName: json["currency_name"],
    date: DateTime.parse(json["date"]),
    viewStore: json["view_store"],
    viewId: json["view_id"],
  );

  Map<String, dynamic> toMap() => {
    "code_order": codeOrder,
    "request_name": requestName,
    "id_order": idOrder,
    "total_price": totalPrice,
    "currency_name": currencyName,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "view_store": viewStore,
    "view_id": viewId,
  };
}
