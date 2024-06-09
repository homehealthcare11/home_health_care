import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../backend/model/common/common_success_model.dart';
import '../../../backend/model/nanny_user_store_baby_pet/baby_pet_get_model.dart';
import '../../../backend/services/api_services.dart';
import '../../routes/routes.dart';

class ServiceRequestController extends GetxController {
  DateTime day = DateTime.now();
  String timeNow = DateFormat.Hm().format(DateTime.now());
  int choice = 0;

  @override
  void onInit() {
    getProfileData();
    super.onInit();
  }

  String convertTo12HourFormat(String time24Hour) {
    final inputFormat = DateFormat("HH:mm");
    final outputFormat = DateFormat("h:mm a");

    final DateTime time = inputFormat.parse(time24Hour);
    final String time12Hour = outputFormat.format(time);

    return time12Hour;
  }

  int addBabyPetIdController = -1;
  final startedDateController = TextEditingController();
  final endDateController = TextEditingController();
  int dailyWorkingHourController = 2;
  final startedTimeController = TextEditingController();
  final addressController = TextEditingController();

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late CommonSuccessModel _commonSuccessModel;

  CommonSuccessModel get serviceRequest => _commonSuccessModel;

  Future<CommonSuccessModel> serviceRequestProcess(
      int id, String startDate, String endDate) async {
    _isLoading.value = true;
    update();
    Get.toNamed(Routes.babySitterCongratulation);

    Map<String, dynamic> inputBody = {
      'add_baby_pet_id': addBabyPetIdController,
      'started_date': startDate,
      'end_date': endDate,
      'daily_working_hour': 2,
      'started_time': timeNow,
      'address': addressController.text
    };

    await ApiServices.serviceRequestApi(body: inputBody, id: id).then((value) {
      _commonSuccessModel = value!;

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _commonSuccessModel;
  }

  final _profileLoading = false.obs;

  bool get profileLoading => _profileLoading.value;

  late BabyPetGetModel _babyPetGetModel;

  BabyPetGetModel get babyPetGetModel => _babyPetGetModel;

  Future<BabyPetGetModel> getProfileData() async {
    _profileLoading.value = true;
    update();

    ApiServices.babyAndPetListAPi().then((value) {
      _babyPetGetModel = value!;

      var data = babyPetGetModel.data.myBaby;
      if (kDebugMode) {
        print("test == ${data[2].professionTypeDetails.babyGender}");
      }
      //end of get data and start navigation
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _profileLoading.value = false;
    update();
    return _babyPetGetModel;
  }
}
