// To parse this JSON data, do
//
//     final skillsModel = skillsModelFromJson(jsonString);

import 'dart:convert';

SkillsModel skillsModelFromJson(String str) => SkillsModel.fromJson(json.decode(str));

String skillsModelToJson(SkillsModel data) => json.encode(data.toJson());

class SkillsModel {
  SkillsModel({
    this.message,
    this.response,
    this.status,
  });

  String message;
  List<Response> response;
  bool status;

  factory SkillsModel.fromJson(Map<String, dynamic> json) => SkillsModel(
    message: json["message"],
    response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
    "status": status,
  };
}

class Response {
  Response({
    this.id,
    this.sName,
    this.sInfo,
    this.createdAt,
    this.updatedAt,
    this.points,
  });

  int id;
  String sName;
  String sInfo;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic points;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    id: json["id"],
    sName: json["s_name"],
    sInfo: json["s_info"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    points: json["points"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "s_name": sName,
    "s_info": sInfo,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "points": points,
  };
}
