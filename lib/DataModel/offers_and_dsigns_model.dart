class OffersAndDesignsModel {
  String? message;
  int? codenum;
  bool? status;
  Result? result;

  OffersAndDesignsModel({this.message, this.codenum, this.status, this.result});

  OffersAndDesignsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    codenum = json['codenum'];
    status = json['status'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['codenum'] = this.codenum;
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  CategoryDate? categoryDate;
  List<LableList>? lableList;

  Result({this.categoryDate, this.lableList});

  Result.fromJson(Map<String, dynamic> json) {
    categoryDate = json['category_date'] != null
        ? CategoryDate.fromJson(json['category_date'])
        : null;
    if (json['lable_list'] != null) {
      lableList = <LableList>[];
      json['lable_list'].forEach((v) {
        lableList!.add(LableList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.categoryDate != null) {
      data['category_date'] = this.categoryDate!.toJson();
    }
    if (this.lableList != null) {
      data['lable_list'] = this.lableList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class CategoryDate {
  String? title;
  String? description;
  int? id;
  String?details;
  Null color;

  CategoryDate(
      {this.title, this.description, this.id, this.details, this.color});

  CategoryDate.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    id = json['id'];
    details = json['details'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['id'] = this.id;
    data['details'] = this.details;
    data['color'] = this.color;
    return data;
  }
}

class LableList {
  String? title;
  int? lebalId;

  LableList({this.title, this.lebalId});

  LableList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    lebalId = json['lebal_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['lebal_id'] = this.lebalId;
    return data;
  }
}
