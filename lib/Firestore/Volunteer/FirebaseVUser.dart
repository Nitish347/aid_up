import 'package:aid_up/controller/obsData.dart';
import 'package:aid_up/model/DonationNGO.dart';
import 'package:aid_up/model/TeachingModel.dart';
import 'package:aid_up/model/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uuid/uuid.dart';

import '../../model/MoneyNGO.dart';

class FirestoreVData {
  //*********************Medicine Data

  //******************User Data
  static userData(BuildContext context, String uid) async {
    final controller = Get.put(ObsData());

    var snp = await FirebaseFirestore.instance.collection("Users").doc(uid).get();
    print(snp.data().toString());
    controller.userData.value = snp.data()!;
    UserModel user = UserModel.fromJson({
      "name": snp.data()!['name'],
      "dob": snp.data()!['dob'],
      "email": snp.data()!['email'],
      "phone": snp.data()!['phone'],
      "password": snp.data()!['password'],
      "uid": snp.data()!['uid'],
    });
    controller.userModel.value = user;
    controller.uid.value = uid;
    print(controller.userData.toString());
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

  static Future<bool> bookTeach(
    BuildContext context,
    TeachiingNgoModel teachiingNgoModel,
  ) async {
    final controller = Get.put(ObsData());
    Map<String, dynamic> mp = {
      "book": teachiingNgoModel.toJson(),
      "user": controller.userModel.value.toJson()
    };

    try {
      String postId = Uuid().v1();
      await FirebaseFirestore.instance
          .collection("NGO")
          .doc(teachiingNgoModel.uid)
          .collection("BookedTeach")
          .doc(postId)
          .set(mp);
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(controller.userModel.value.uid)
          .collection("BookedTeach")
          .doc(postId)
          .set(teachiingNgoModel.toJson());
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  static Future<bool> bookDonationCamp(
    BuildContext context,
    DonationNgoModel teachiingNgoModel,
  ) async {
    final controller = Get.put(ObsData());
    Map<String, dynamic> mp = {
      "book": teachiingNgoModel.toJson(),
      "user": controller.userModel.value.toJson()
    };

    try {
      String postId = Uuid().v1();
      await FirebaseFirestore.instance
          .collection("NGO")
          .doc(teachiingNgoModel.uid)
          .collection("BookedDonationCamp")
          .doc(postId)
          .set(mp);
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(controller.userModel.value.uid)
          .collection("BookedDonationCamp")
          .doc(postId)
          .set(teachiingNgoModel.toJson());
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
