


// To parse this JSON data, do
//
//     final projectDetailsM = projectDetailsMFromMap(jsonString);

import 'dart:convert';

class ProjectDetailsM {
  ProjectDetailsM({
    this.message,
    this.codenum,
    this.status,
    this.result,
  });

  String message;
  int codenum;
  bool status;
  Result result;

  factory ProjectDetailsM.fromJson(String str) => ProjectDetailsM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProjectDetailsM.fromMap(Map<String, dynamic> json) => ProjectDetailsM(
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
    this.allSlider,
    this.projectDetails,
  });

  List<AllSlider> allSlider;
  ProjectDetails projectDetails;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    allSlider: List<AllSlider>.from(json["all_slider"].map((x) => AllSlider.fromMap(x))),
    projectDetails: ProjectDetails.fromMap(json["project_details"]),
  );

  Map<String, dynamic> toMap() => {
    "all_slider": List<dynamic>.from(allSlider.map((x) => x.toMap())),
    "project_details": projectDetails.toMap(),
  };
}

class AllSlider {
  AllSlider({
    this.img,
    this.depId,
  });

  String img;
  int depId;

  factory AllSlider.fromJson(String str) => AllSlider.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllSlider.fromMap(Map<String, dynamic> json) => AllSlider(
    img: json["img"],
    depId: json["dep_id"],
  );

  Map<String, dynamic> toMap() => {
    "img": img,
    "dep_id": depId,
  };
}

class ProjectDetails {
  ProjectDetails({
    this.projectImage,
    this.projectName,
    this.details,
    this.creationDate,
    this.views,
    this.id,
  });

  String projectImage;
  String projectName;
  String details;
  DateTime creationDate;
  String views;
  int id;

  factory ProjectDetails.fromJson(String str) => ProjectDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProjectDetails.fromMap(Map<String, dynamic> json) => ProjectDetails(
    projectImage: json["project_image"],
    projectName: json["project_name"],
    details: json["details"],
    creationDate: DateTime.parse(json["creation_date"]),
    views: json["views"],
    id: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "project_image": projectImage,
    "project_name": projectName,
    "details": details,
    "creation_date": "${creationDate.year.toString().padLeft(4, '0')}-${creationDate.month.toString().padLeft(2, '0')}-${creationDate.day.toString().padLeft(2, '0')}",
    "views": views,
    "id": id,
  };
}
