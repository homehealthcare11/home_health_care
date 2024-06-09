import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../backend/model/pet_store/pet_store_model.dart';
import '../../../backend/services/api_services.dart';
import '../../widgets/pet_card/pet_picture_upload.dart';

class AddPetController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final babyNameController = TextEditingController();
  final petBreedController = TextEditingController();
  final petAgeController = TextEditingController();
  final petWeightController = TextEditingController();
  final genderController = TextEditingController();
  final ageController = TextEditingController();
  final babyFoodsController = TextEditingController();

  RxString countryMethod = "Male".obs;
  RxString petMethod = "Dog".obs;
  RxString nationalityMethod = "Male".obs;

  List<String> countryList = ["Male", "Female", "Other"];

  List<String> petType = [];

  // dispose all controller while the screen destroy
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _isUpdateLoading = false.obs;

  bool get isUpdateLoading => _isUpdateLoading.value;

  late PetStoreModel _petStoreModel;

  // --------------------------- Api function ----------------------------------
  // Profile update process without image
  Future<PetStoreModel> profileUpdateWithImageProcess() async {
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
    };
    debugPrint("test ===== ${imgController.imagePath.value}");
    if (kDebugMode) {
      print("test2===========  ${imgController.isImagePathSet.value}");
    }

    await ApiServices.addPetWithImageApi(
      body: inputBody,
      filepath: imgController.imagePath.value,
    ).then((value) {
      _petStoreModel = value!;

      _isUpdateLoading.value = false;
      update();
      update();
    }).catchError((onError) {
      log.e(onError);
      _isUpdateLoading.value = false;
      update();
    });

    return _petStoreModel;
  }
}
