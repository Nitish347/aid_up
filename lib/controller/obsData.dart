import 'package:aid_up/model/DonationNGO.dart';
import 'package:aid_up/model/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../model/MoneyNGO.dart';
import '../model/TeachingModel.dart';

class PendingRequestModel {}

class ObsData extends GetxController {
  RxBool loading = false.obs;
  RxString uid = "".obs;
  RxMap ngoData = {}.obs;
  RxMap userData = {}.obs;
  RxList bookedCamp = [].obs;
  RxList bookedTeach = [].obs;


  RxList<TeachiingNgoModel> teachingList = <TeachiingNgoModel>[].obs;
  RxList<DonationNgoModel> donationList = <DonationNgoModel>[].obs;
  RxList<MoneyNgoModel> donationMoneyList = <MoneyNgoModel>[].obs;
  Rx<UserModel> userModel = UserModel.fromJson(
      {"name": "", "password": "", "email": "", "phone": "", "dob": "", "uid": ""}).obs;
}
