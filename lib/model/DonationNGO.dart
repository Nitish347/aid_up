// To parse this JSON data, do
//
//     final donationNgoModel = donationNgoModelFromJson(jsonString);

import 'dart:convert';

DonationNgoModel donationNgoModelFromJson(String str) =>
    DonationNgoModel.fromJson(json.decode(str));

String donationNgoModelToJson(DonationNgoModel data) => json.encode(data.toJson());

class DonationNgoModel {
  String? name;
  String? phone;
  String? address;
  List<dynamic>? donationType;
  String? date;
  String? time;
  String? desc;
  List<dynamic>? rules;

  DonationNgoModel({
    this.name,
    this.phone,
    this.address,
    this.donationType,
    this.date,
    this.time,
    this.desc,
    this.rules,
  });

  factory DonationNgoModel.fromJson(Map<String, dynamic> json) => DonationNgoModel(
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        donationType: json["donation_type"] == null
            ? []
            : List<dynamic>.from(json["donation_type"]!.map((x) => x)),
        date: json["date"],
        time: json["time"],
        desc: json["desc"],
        rules: json["rules"] == null ? [] : List<dynamic>.from(json["rules"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "address": address,
        "donation_type":
            donationType == null ? [] : List<dynamic>.from(donationType!.map((x) => x)),
        "date": date,
        "time": time,
        "desc": desc,
        "rules": rules == null ? [] : List<dynamic>.from(rules!.map((x) => x)),
      };
}
