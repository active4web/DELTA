class GalleryOfferModel {
  String message;
  int codenum;
  bool status;
  Result result;

  GalleryOfferModel({this.message, this.codenum, this.status, this.result});

  GalleryOfferModel.fromJson(Map<String, dynamic> json) {
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
  List<AllDesigns> allDesigns;

  Result({this.allDesigns});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['all_designs'] != null) {
      allDesigns = new List<AllDesigns>();
      json['all_designs'].forEach((v) {
        allDesigns.add(new AllDesigns.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allDesigns != null) {
      data['all_designs'] = this.allDesigns.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllDesigns {
  String designImg;
  String name;
  String description;
  String price;
  String secondImage;
  String face;
  String gmail;
  String location;
  String phone;
  int offerId;

  AllDesigns(
      {this.designImg,
      this.name,
      this.secondImage,
      this.face,
      this.gmail,
      this.location,
      this.phone,
      this.description,
      this.price,
      this.offerId});

  AllDesigns.fromJson(Map<String, dynamic> json) {
    designImg = json['design_img'];
    name = json['name'];
    description = json['description'];
    face = json['facebook'];
    gmail = json['gmail'];
    location = json['location'];
    phone = json['phone'];
    price = json['price'];
    secondImage = json['second_img'];
    offerId = json['offer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['design_img'] = this.designImg;
    data['name'] = this.name;
    data['description'] = this.description;
    data['second_img'] = this.secondImage;
    data['facebook'] = this.face;
    data['phone'] = this.phone;
    data['gmail'] = this.gmail;
    data['location'] = this.location;
    data['price'] = this.price;
    data['offer_id'] = this.offerId;
    return data;
  }
}
