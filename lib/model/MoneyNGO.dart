// To parse this JSON data, do
//
//     final moneyNgoModel = moneyNgoModelFromJson(jsonString);

import 'dart:convert';

MoneyNgoModel moneyNgoModelFromJson(String str) => MoneyNgoModel.fromJson(json.decode(str));

String moneyNgoModelToJson(MoneyNgoModel data) => json.encode(data.toJson());

class MoneyNgoModel {
  String? name;
  String? phone;
  String? receiver;
  String? deadline;
  String? target;
  String? desc;
  String? cause;
  List<dynamic>? rules;

  MoneyNgoModel({
    this.name,
    this.phone,
    this.receiver,
    this.deadline,
    this.target,
    this.desc,
    this.cause,
    this.rules,
  });

  factory MoneyNgoModel.fromJson(Map<String, dynamic> json) => MoneyNgoModel(
        name: json["name"],
        phone: json["phone"],
        receiver: json["receiver"],
        deadline: json["deadline"],
        target: json["target"],
        desc: json["desc"],
        cause: json["cause"],
        rules: json["rules"] == null ? [] : List<dynamic>.from(json["rules"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "receiver": receiver,
        "deadline": deadline,
        "target": target,
        "desc": desc,
        "cause": cause,
        "rules": rules == null ? [] : List<dynamic>.from(rules!.map((x) => x)),
      };
}
