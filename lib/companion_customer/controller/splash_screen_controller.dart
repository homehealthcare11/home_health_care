import 'dart:async';

import '../../helper/user_choise_helper.dart';
import '../../companion_direct/utils/basic_screen_imports.dart';
import '../routes/routes.dart';
import '/backend/local_storage/local_storage.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _goToScreen();
  }

  _goToScreen() async {
    Timer(const Duration(seconds: 5), () {
      debugPrint("test ====> ${UserChoiceHelper.getUserChoice()}");

      UserChoiceHelper.getUserChoice() == 'NANNY_CUSTOMER'
          ? LocalStorage.isLoggedIn()
              ? Get.offAllNamed(Routes.bottomNavBar)
              : LocalStorage.isOnBoardDone()
                  ? Get.toNamed(Routes.welcomeScreen)
                  : Get.toNamed(Routes.onboardScreen)
          : LocalStorage.isLoggedIn()
              ? Get.offAllNamed(Routes.dashboardScreen)
              : LocalStorage.isOnBoardDone()
                  ? Get.toNamed(Routes.welcomeScreen)
                  : Get.toNamed(Routes.onboardScreen);
    });
  }
}
