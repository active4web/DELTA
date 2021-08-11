// To parse this JSON data, do
//
//     final contactInfoM = contactInfoMFromMap(jsonString);

import 'dart:convert';

class ContactInfoM {
  ContactInfoM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory ContactInfoM.fromJson(String str) => ContactInfoM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContactInfoM.fromMap(Map<String, dynamic> json) => ContactInfoM(
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
    this.hotline,
    this.nameSite,
    this.address,
    this.supportEmail,
    this.supportPhone,
    this.whatsapp,
    this.facebook,
    this.twitter,
    this.instagram,
    this.linkedin,
    this.websiteLink,
  });

  String hotline;
  String nameSite;
  String address;
  String supportEmail;
  String supportPhone;
  String whatsapp;
  String facebook;
  String twitter;
  String instagram;
  String linkedin;
  String websiteLink;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    hotline: json["hotline"],
    nameSite: json["name_site"],
    address: json["address"],
    supportEmail: json["support_email"],
    supportPhone: json["support_phone"],
    whatsapp: json["whatsapp"],
    facebook: json["facebook"],
    twitter: json["twitter"],
    instagram: json["instagram"],
    linkedin: json["linkedin"],
    websiteLink: json["website_link"],
  );

  Map<String, dynamic> toMap() => {
    "hotline": hotline,
    "name_site": nameSite,
    "address": address,
    "support_email": supportEmail,
    "support_phone": supportPhone,
    "whatsapp": whatsapp,
    "facebook": facebook,
    "twitter": twitter,
    "instagram": instagram,
    "linkedin": linkedin,
    "website_link": websiteLink,
  };
}
