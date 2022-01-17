class RegisterationModel {
  String message;
  int codenum;
  bool status;
  Result result;

  RegisterationModel({this.message, this.codenum, this.status, this.result});

  RegisterationModel.fromJson(Map<String, dynamic> json) {
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
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  List<ClientData> clientData;

  Result({this.clientData});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['client_data'] != null) {
      clientData = new List<ClientData>();
      json['client_data'].forEach((v) {
        clientData.add(new ClientData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clientData != null) {
      data['client_data'] = this.clientData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClientData {
  String name;
  String phone;
  int id;
  String fullname;
  String lang;
  String country;
  String token;

  ClientData(
      {this.name,
      this.phone,
      this.id,
      this.fullname,
      this.lang,
      this.country,
      this.token});

  ClientData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    id = json['id'];
    fullname = json['fullname'];
    lang = json['lang'];
    country = json['country'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['lang'] = this.lang;
    data['country'] = this.country;
    data['token'] = this.token;
    return data;
  }
}
