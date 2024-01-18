// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? email;
  String? phone;
  String? dob;
  String? password;

  UserModel({
    this.email,
    this.phone,
    this.dob,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        phone: json["phone"],
        dob: json["dob"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "phone": phone,
        "dob": dob,
        "password": password,
      };
}
