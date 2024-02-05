import 'package:aid_up/controller/obsData.dart';
import 'package:aid_up/model/NgoModel.dart';
import 'package:aid_up/model/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SaveUser {
  static saveUser(
    BuildContext context,
    UserModel userModel,
    String uid,
  ) async {
    await FirebaseFirestore.instance.collection("Users").doc(uid).set({
      "name": userModel.name,
      "password": userModel.password,
      "email": userModel.email,
      "phone": userModel.phone,
      "dob": userModel.dob,
      "uid": uid
    });
    // await FirebaseFirestore.instance.collection("Users").doc(uid).set({
    //   "Name": provider.UserName,
    //   "HospitalName": provider.selectedHospital,
    //   "PhoneNumber": provider.UserPhoneNumber,
    //   "uid": uid
    // });
  }

  static saveNGO(
    BuildContext context,
    NgoModel userModel,
    String uid,
  ) async {
    final controller = Get.put(ObsData());
    try {
      await FirebaseFirestore.instance.collection("NGO").doc(uid).set({
        "name": userModel.name,
        "address": userModel.address,
        "email": userModel.email,
        "phone": userModel.phone,
        "password": userModel.password,
        "uid": uid
      });
      controller.ngoData.value = {
        "name": userModel.name,
        "address": userModel.address,
        "email": userModel.email,
        "phone": userModel.phone,
        "password": userModel.password,
        "uid": uid
      };
    } catch (e) {
      print(e.toString());
    }
  }
}
