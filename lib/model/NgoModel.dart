// To parse this JSON data, do
//
//     final ngoModel = ngoModelFromJson(jsonString);

import 'dart:convert';

NgoModel ngoModelFromJson(String str) => NgoModel.fromJson(json.decode(str));

String ngoModelToJson(NgoModel data) => json.encode(data.toJson());

class NgoModel {
  String? name;
  String? address;
  String? email;
  String? phone;
  String? password;

  NgoModel({
    this.name,
    this.address,
    this.email,
    this.phone,
    this.password,
  });

  factory NgoModel.fromJson(Map<String, dynamic> json) => NgoModel(
        name: json["name"],
        address: json["address"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "email": email,
        "phone": phone,
        "password": password,
      };
}
