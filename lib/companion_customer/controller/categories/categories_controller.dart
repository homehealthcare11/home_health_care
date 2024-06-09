import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CategoriesController extends GetxController {
  // all text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool pageChange = false.obs;
  final box = GetStorage();


  // dispose all controller while the screen destroy
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }


}
