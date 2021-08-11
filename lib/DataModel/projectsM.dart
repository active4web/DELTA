// To parse this JSON data, do
//
//     final projectsM = projectsMFromMap(jsonString);

import 'dart:convert';

class ProjectsM {
  ProjectsM({
    this.message,
    this.messageid,
    this.status,
    this.total,
    this.result,
  });

  String message;
  int messageid;
  bool status;
  int total;
  Result result;

  factory ProjectsM.fromJson(String str) => ProjectsM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProjectsM.fromMap(Map<String, dynamic> json) => ProjectsM(
    message: json["Message"],
    messageid: json["Messageid"],
    status: json["status"],
    total: json["total"],
    result: Result.fromMap(json["result"]),
  );

  Map<String, dynamic> toMap() => {
    "Message": message,
    "Messageid": messageid,
    "status": status,
    "total": total,
    "result": result.toMap(),
  };
}

class Result {
  Result({
    this.allProjects,
  });

  List<AllProject> allProjects;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    allProjects: List<AllProject>.from(json["all_projects"].map((x) => AllProject.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "all_projects": List<dynamic>.from(allProjects.map((x) => x.toMap())),
  };
}

class AllProject {
  AllProject({
    this.allSlider,
    this.articlesImage,
    this.projectName,
    this.smallDescription,
    this.projectId,
  });

  List<AllSlider> allSlider;
  String articlesImage;
  String projectName;
  String smallDescription;
  int projectId;

  factory AllProject.fromJson(String str) => AllProject.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllProject.fromMap(Map<String, dynamic> json) => AllProject(
    allSlider: List<AllSlider>.from(json["all_slider"].map((x) => AllSlider.fromMap(x))),
    articlesImage: json["articles_image"],
    projectName: json["project_name"],
    smallDescription: json["small_description"],
    projectId: json["project_id"],
  );

  Map<String, dynamic> toMap() => {
    "all_slider": List<dynamic>.from(allSlider.map((x) => x.toMap())),
    "articles_image": articlesImage,
    "project_name": projectName,
    "small_description": smallDescription,
    "project_id": projectId,
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
