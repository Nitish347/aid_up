// To parse this JSON data, do
//
//     final teachiingNgoModel = teachiingNgoModelFromJson(jsonString);

import 'dart:convert';

TeachiingNgoModel teachiingNgoModelFromJson(String str) =>
    TeachiingNgoModel.fromJson(json.decode(str));

String teachiingNgoModelToJson(TeachiingNgoModel data) => json.encode(data.toJson());

class TeachiingNgoModel {
  String? name;
  String? phone;
  String? subject;
  String? address;
  String? date;
  String? time;
  String? desc;
  List<dynamic>? rules;
  String? uid;

  TeachiingNgoModel({
    this.name,
    this.phone,
    this.subject,
    this.address,
    this.date,
    this.time,
    this.desc,
    this.rules,
    this.uid,
  });

  factory TeachiingNgoModel.fromJson(Map<String, dynamic> json) => TeachiingNgoModel(
        name: json["name"],
        phone: json["phone"],
        subject: json["subject"],
        address: json["address"],
        date: json["date"],
        time: json["time"],
        desc: json["desc"],
        rules: json["rules"] == null ? [] : List<dynamic>.from(json["rules"]!.map((x) => x)),
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "subject": subject,
        "address": address,
        "date": date,
        "time": time,
        "desc": desc,
        "rules": rules == null ? [] : List<dynamic>.from(rules!.map((x) => x)),
        "uid": uid,
      };
}
