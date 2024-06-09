import 'package:get/get.dart';
import '/companion_customer/controller/basic_settings/basic_settings_controller.dart';
import '/companion_customer/language/language_controller.dart';

import '../controller/splash_screen_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LanguageController());
    Get.put(SplashController());
    Get.put(BasicSettingsController());
  }
}
