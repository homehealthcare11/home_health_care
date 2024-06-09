import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../backend/model/nanny_user_store_baby_pet/baby_pet_store_model.dart';
import '../../../backend/services/api_services.dart';
import '../../widgets/baby_card/baby_picture_upload.dart';

class AddBabyController extends GetxController {
  // all text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final babyNameController = TextEditingController();
  final genderController = TextEditingController();
  final ageController = TextEditingController();
  final babyFoodsController = TextEditingController();

  RxString countryMethod = "Male".obs;
  RxString nationalityMethod = "Male".obs;

  List<String> countryList = ["Male", "Female", "Other"];

  // dispose all controller while the screen destroy
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void goToBabyDetailsScreen() {
    Get.back(result: "added");
  }

  final _isUpdateLoading = false.obs;

  bool get isUpdateLoading => _isUpdateLoading.value;

  late BabyPetStoreModel _profileUpdateModel;

  // --------------------------- Api function ----------------------------------
  // Profile update process without image
  Future<BabyPetStoreModel> profileUpdateWithOutImageProcess() async {
    _isUpdateLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'profession_type': 1,
      'baby_name': babyNameController.text,
      'baby_gender': countryMethod.toString(),
      'baby_age': ageController.text,
      'baby_food': babyFoodsController.text,
    };

    await ApiServices.addBabyWithoutImageApi(body: inputBody).then((value) {
      _profileUpdateModel = value!;

      _isUpdateLoading.value = false;
      update();
      update();
    }).catchError((onError) {
      log.e(onError);
      _isUpdateLoading.value = false;
      update();
    });

    return _profileUpdateModel;
  }

  Future<BabyPetStoreModel> profileUpdateWithImageProcess() async {
    _isUpdateLoading.value = true;
    update();

    Map<String, String> inputBody = {
      'profession_type': '1',
      'baby_name': babyNameController.text,
      'baby_gender': countryMethod.value,
      'baby_age': ageController.text,
      'baby_food': babyFoodsController.text,
    };
    debugPrint("test ===== ${imgController.imagePath.value}");
    debugPrint("test2 ======= ${imgController.isImagePathSet.value}");

    await ApiServices.addBabyWithImageApi(
      body: inputBody,
      filepath: imgController.imagePath.value,
    ).then((value) {
      _profileUpdateModel = value!;

      _isUpdateLoading.value = false;
      update();
      update();
    }).catchError((onError) {
      log.e(onError);
      _isUpdateLoading.value = false;
      update();
    });

    return _profileUpdateModel;
  }
}
