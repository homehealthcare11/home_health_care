import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../backend/model/common/common_success_model.dart';
import '../../../backend/services/api_services.dart';
import '../../../backend/utils/custom_snackbar.dart';
import '../../../companion_customer/controller/update_pet/update_pet_image_controller.dart';
import '../../../companion_customer/language/english.dart';
import '../my_baby_and_pets/my_baby_and_pets_controller.dart';

class UpdatePetController extends GetxController {
  // all text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final babyNameController = TextEditingController();

  final ageController = TextEditingController();
  final petBreedController = TextEditingController();
  final babyFoodsController = TextEditingController();
  final petAgeController = TextEditingController();
  final petWeightController = TextEditingController();
  final imageController = Get.put(UpdatePetImageController());

  RxString countryMethod = "Male".obs;
  RxString petMethod = "Dog".obs;

  List<String> petType = [];

  List<String> gender = ["Male", "Female"];
  RxString selectGender = "Male".obs;
  final babyPetController = Get.put(MyBabyAndPetController());

  final int index = Get.arguments;

  @override
  void onInit() {
    super.onInit();

    setDataToController();
  }

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

  setDataToController() {
    var data =
        babyPetController.profileModel.data.myPet[index].professionTypeDetails;
    babyNameController.text = data.petName;
    petMethod.value = data.petType;
    petType = babyPetController.profileModel.data.petType.values.toList();

    countryMethod.value = data.petGender;
    ageController.text = data.petAge;
    babyFoodsController.text = data.petFood;
    petBreedController.text = data.petBreed;
    petAgeController.text = data.petAge;
    petWeightController.text = data.petWeight;
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
      'profession_type': '2',
      'pet_name': babyNameController.text,
      'pet_gender': countryMethod.value,
      'pet_age': petAgeController.text,
      'pet_food': babyFoodsController.text,
      'pet_type': petMethod.toString(),
      'pet_breed': petBreedController.text,
      'pet_weight': petWeightController.text,
      'target': babyPetController.profileModel.data.myPet[index].id,
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
      'target': babyPetController.profileModel.data.myPet[index].id
    };
    CustomSnackBar.success(Strings.successfullyDeleted.tr);
    Get.back();

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
      'profession_type': '2',
      'pet_name': babyNameController.text,
      'pet_gender': countryMethod.value,
      'pet_age': petAgeController.text,
      'pet_food': babyFoodsController.text,
      'pet_type': petMethod.toString(),
      'pet_breed': petBreedController.text,
      'pet_weight': petWeightController.text,
      "target": babyPetController.profileModel.data.myPet[index].id.toString()
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
