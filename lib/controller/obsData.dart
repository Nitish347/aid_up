import 'package:aid_up/model/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PendingRequestModel {}

class ObsData extends GetxController {
  RxBool loading = false.obs;
  RxString uid = "".obs;
  RxMap ngoData = {}.obs;
  RxMap userData = {}.obs;
  // Rx<UserModel> userModel =
  //     UserModel.fromJson({"email": "", "phone": "", "dob": "", "password": ""}).obs;
}
