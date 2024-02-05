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

  //***************** Hospital Data
  static hospitalData(BuildContext context, String uid) async {
    // var provider = Provider.of<UserProvider>(context, listen: false);
    print("fetching");
    var snp = await FirebaseFirestore.instance.collection("Users").doc(uid).get();
    String hsptlName = snp.data()!["HospitalName"];
    var snap = await FirebaseFirestore.instance.collection('HospitalNames').doc(hsptlName).get();
    // HospitalModel hospitalModel = HospitalModel.fromJson(snap.data()!);
    // provider.updateHopital(hospitalModel);
  }

  //******************** Hospital Names List
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
}
