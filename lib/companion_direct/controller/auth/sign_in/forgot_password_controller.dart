import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../backend/local_storage/local_storage.dart';
import '../../../../backend/model/auth/sign_in_direct/forgot_password_direct/forgot_password_direct_model.dart';
import '../../../../backend/services/api_services.dart';
import '../../../../companion_customer/routes/routes.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();

  // api loading process indicator variable

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late ForgotPasswordEmailDirectModel _forgotPasswordOtpModel;

  ForgotPasswordEmailDirectModel get forgotPasswordOtpModel =>
      _forgotPasswordOtpModel;

  // --------------------------- Api function ----------------------------------
  // forgot password email process function
  Future<ForgotPasswordEmailDirectModel> forgotPasswordProcess(
      {required String email}) async {
    _isLoading.value = true;

    update();

    Map<String, dynamic> inputBody = {'credentials': email};

    await ApiServices.forgotPasswordEmailDirectApi(body: inputBody)
        .then((value) {
      _forgotPasswordOtpModel = value!;
      LocalStorage.saveToken(
          token: _forgotPasswordOtpModel.data.nanny.token.toString());

      goToForgotPasswordOTPVerificationScreen();
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _forgotPasswordOtpModel;
  }

  goToForgotPasswordOTPVerificationScreen() {
    Get.toNamed(Routes.nannyOtpVerificationScreen);
  }
}
