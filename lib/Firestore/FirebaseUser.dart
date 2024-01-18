import 'package:aid_up/model/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class SaveUser {
  static saveUser(
    BuildContext context,
    UserModel userModel,
    String uid,
  ) async {
    await FirebaseFirestore.instance.collection("Users").doc(uid).set({
      "email": userModel.email,
      "phone": userModel.phone,
      "DateOfBirth": userModel.dob,
      "uid": uid
    });
    // await FirebaseFirestore.instance.collection("Users").doc(uid).set({
    //   "Name": provider.UserName,
    //   "HospitalName": provider.selectedHospital,
    //   "PhoneNumber": provider.UserPhoneNumber,
    //   "uid": uid
    // });
  }
}
