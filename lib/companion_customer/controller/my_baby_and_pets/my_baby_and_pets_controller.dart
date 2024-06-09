import 'package:flutter/foundation.dart';

import '../../../backend/model/nanny_user_store_baby_pet/baby_pet_get_model.dart';
import '../../../backend/services/api_services.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../categories/categories_controller.dart';

class MyBabyAndPetController extends GetxController {
  // all text editing controller
  final categoryController = Get.put(CategoriesController());
  RxBool isChecked = false.obs;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  RxInt selectIndex = 0.obs;
  RxInt selectPetIndex = 0.obs;

  @override
  void onInit() {
    getProfileData();
    super.onInit();
  }

  List<dynamic> baby = [];
  List<dynamic> pet = [];

  void selectItem(int index) {
    selectIndex.value = index;
  }

  void selectPetItem(int index) {
    selectPetIndex.value = index;
  }

  bool isItemSelected(int index) {
    return selectIndex.value == index;
  }

  bool isPetItemSelected(int index) {
    return selectPetIndex.value == index;
  }

  Color getItemColor(int index) {
    return isItemSelected(index) ? Colors.blue : Colors.white;
  }

  // dispose all controller while the screen destroy
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void goToNannyScreen() {
    Get.toNamed(Routes.nannyScreen);
  }

  void goToServiceRequestScreen() {
    Get.toNamed(Routes.serviceRequestScreen);
  }

  void goToBabyDetailsScreen() {
    Get.toNamed(Routes.babyDetailsScreen);
  }

  void goToPetDetailsScreen() {
    Get.toNamed(Routes.petDetails);
  }

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late BabyPetGetModel _babyPetGetModel;

  BabyPetGetModel get profileModel => _babyPetGetModel;

  Future<BabyPetGetModel> getProfileData() async {
    _isLoading.value = true;
    update();

    await ApiServices.babyAndPetListAPi().then((value) {
      _babyPetGetModel = value!;

      var data = profileModel.data.myBaby;
      if (kDebugMode) {
        print("test == ${data[1].professionTypeDetails.babyGender}");
      }
      //end of get data and start navigation
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _babyPetGetModel;
  }
}
