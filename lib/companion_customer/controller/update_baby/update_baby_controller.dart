import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../backend/model/common/common_success_model.dart';
import '../../../backend/services/api_services.dart';
import '../../../companion_customer/controller/update_baby/update_baby_image_controller.dart';
import '../my_baby_and_pets/my_baby_and_pets_controller.dart';

class UpdateBabyController extends GetxController {
  // all text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final babyNameController = TextEditingController();
  final genderController = TextEditingController();
  final ageController = TextEditingController();
  final babyFoodsController = TextEditingController();
  final imageController = Get.put(UpdateBabyImageController());
  final myBabyPetController = Get.put(MyBabyAndPetController());

  @override
  void onInit() {
    super.onInit();
    setDataToController();
  }

  RxString countryMethod = "Male".obs;
  RxString nationalityMethod = "Male".obs;

  setDataToController() {
    var data = myBabyPetController
        .profileModel.data.myBaby[index].professionTypeDetails;
    babyNameController.text = data.babyName;
    countryMethod.value = data.babyGender;
    ageController.text = data.babyAge;
    babyFoodsController.text = data.babyFood;
  }

  //
  List<String> gender = ["Male", "Female"];
  int index = Get.arguments;

  // dispose all controller while the screen destroy
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void goToBabyDetailsScreen() {
    Get.back();
  }

  final _isUpdateLoading = false.obs;

  bool get isUpdateLoading => _isUpdateLoading.value;

  late CommonSuccessModel _profileUpdateModel;

  // --------------------------- Api function ----------------------------------
  // Profile update process without image
  Future<CommonSuccessModel> profileUpdateWithOutImageProcess() async {
    _isUpdateLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'profession_type': 1,
      'baby_name': babyNameController.text,
      'baby_gender': countryMethod.toString(),
      'baby_age': ageController.text,
      'baby_food': babyFoodsController.text,
      'target': myBabyPetController.profileModel.data.myBaby[index].id
    };

    await ApiServices.updateBabyWithoutImageApi(body: inputBody).then((value) {
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

  final _isDeleteLoading = false.obs;

  bool get isDeleteLoading => _isDeleteLoading.value;

  Future<CommonSuccessModel> deleteBabyProcess() async {
    _isDeleteLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'target': myBabyPetController.profileModel.data.myBaby[index].id
    };

    await ApiServices.deleteBabyApi(body: inputBody).then((value) {
      _profileUpdateModel = value!;

      _isDeleteLoading.value = false;
      update();
      update();
    }).catchError((onError) {
      log.e(onError);
      _isDeleteLoading.value = false;
      update();
    });

    return _profileUpdateModel;
  }

  Future<CommonSuccessModel> profileUpdateWithImageProcess() async {
    _isUpdateLoading.value = true;
    update();

    Map<String, String> inputBody = {
      'profession_type': '1',
      'baby_name': babyNameController.text,
      'baby_gender': countryMethod.value,
      'baby_age': ageController.text,
      'baby_food': babyFoodsController.text,
      'target':
          myBabyPetController.profileModel.data.myBaby[index].id.toString()
    };
    debugPrint("test ===== ${imageController.imagePath.value}");

    await ApiServices.updateBabyWithImageApi(
      body: inputBody,
      filepath: imageController.imagePath.value,
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
