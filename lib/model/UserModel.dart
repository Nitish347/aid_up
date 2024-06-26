// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? name;
  String? dob;
  String? email;
  String? phone;
  String? password;
  String? uid;

  UserModel({
    this.name,
    this.dob,
    this.email,
    this.phone,
    this.password,
    this.uid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        dob: json["dob"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "dob": dob,
        "email": email,
        "phone": phone,
        "password": password,
        "uid": uid,
      };
}
