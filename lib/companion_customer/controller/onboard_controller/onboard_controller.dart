import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class OnBoardController extends GetxController {
  var selectedIndex = 0.obs;
  var pageController = PageController();

  goToSignupScreen() {
    Get.offAllNamed(Routes.signupScreen);
  }
}
