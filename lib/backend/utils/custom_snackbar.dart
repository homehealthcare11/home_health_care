import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/companion_customer/language/language_controller.dart';

class CustomSnackBar {
  static success(String message) {
    return Get.snackbar(
        'Success', Get.find<LanguageController>().getTranslation(message),
        backgroundColor: Colors.green, colorText: Colors.white);
  }

  static error(String message) {
    return Get.snackbar(
        'Alert', Get.find<LanguageController>().getTranslation(message),
        backgroundColor: Colors.red, colorText: Colors.white);
  }

  static pending(String message) {
    return Get.snackbar(
        'Pending', Get.find<LanguageController>().getTranslation(message),
        backgroundColor: Colors.orange.shade600, colorText: Colors.white);
  }
}
