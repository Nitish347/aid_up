import 'package:aid_up/controller/obsData.dart';
import 'package:aid_up/model/DonationNGO.dart';
import 'package:aid_up/model/TeachingModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uuid/uuid.dart';

import '../model/MoneyNGO.dart';

class FirestoreData {
  //*********************Medicine Data

  //******************User Data
  static userData(BuildContext context, String uid) async {
    final controller = Get.put(ObsData());

    var snp = await FirebaseFirestore.instance.collection("NGO").doc(uid).get();
    print(snp.data().toString());
    controller.ngoData.value = snp.data()!;
    controller.uid.value = uid;
    print(controller.ngoData.value.toString());

    // String hsptlName = snp.data()!["HospitalName"];
    // print(hsptlName);
    // print(snp.data()!["name"]);
    // User _user = User.fromJson(snp.data()!);
    // provider.updateUser(_user);
    // print(_user.hospitalName);
  }

  static Future<bool> post(
      BuildContext context, DonationNgoModel userModel, String uid, String path) async {
    final controller = Get.put(ObsData());
    try {
      String postId = Uuid().v1();
      await FirebaseFirestore.instance.collection(path).doc(postId).set(userModel.toJson());
      await FirebaseFirestore.instance
          .collection("NGO")
          .doc(uid)
          .collection(path)
          .doc(postId)
          .set(userModel.toJson());
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  static Future<bool> postMoney(
    BuildContext context,
    MoneyNgoModel userModel,
    String uid,
  ) async {
    final controller = Get.put(ObsData());
    try {
      String postId = Uuid().v1();
      await FirebaseFirestore.instance
          .collection("MoneyDonation")
          .doc(postId)
          .set(userModel.toJson());
      await FirebaseFirestore.instance
          .collection("NGO")
          .doc(uid)
          .collection("MoneyDonation")
          .doc(postId)
          .set(userModel.toJson());
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  static Future<bool> postTeach(
    BuildContext context,
    TeachiingNgoModel userModel,
    String uid,
  ) async {
    final controller = Get.put(ObsData());
    try {
      String postId = Uuid().v1();
      await FirebaseFirestore.instance
          .collection("TeachingCamp")
          .doc(postId)
          .set(userModel.toJson());
      await FirebaseFirestore.instance
          .collection("NGO")
          .doc(uid)
          .collection("TeachingCamp")
          .doc(postId)
          .set(userModel.toJson());
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }


  static getBookedCamp(BuildContext context, ) async {
    final controller = Get.put(ObsData());
    var snp = await FirebaseFirestore.instance.collection("NGO").doc(controller.uid.value).collection("BookedDonationCamp").get();
    print(snp.docs.toString());
    controller.bookedCamp.value = snp.docs;
  }

  static getBookedTeach(BuildContext context, ) async {
    final controller = Get.put(ObsData());
    var snp = await FirebaseFirestore.instance.collection("NGO").doc(controller.uid.value).collection("BookedTeach").get();
    print(snp.docs.toString());
    controller.bookedTeach.value = snp.docs;
  }
}
