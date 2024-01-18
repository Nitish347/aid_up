import 'package:aid_up/model/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PendingRequestModel {}

class ObsData extends GetxController {
  RxBool loggedIn = false.obs;
  RxString uid = "".obs;
  // Rx<UserModel> userModel =
  //     UserModel.fromJson({"email": "", "phone": "", "dob": "", "password": ""}).obs;
}
