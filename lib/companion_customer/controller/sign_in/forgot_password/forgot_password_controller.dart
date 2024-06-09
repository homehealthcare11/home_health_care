
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../backend/local_storage/local_storage.dart';
import '../../../../backend/model/auth/sign_in_customer/forgot_password_customer/forgot_password_model.dart';
import '../../../../backend/services/api_services.dart';
import '../../../routes/routes.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();

  // api loading process indicator variable

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late ForgotPasswordEmailModel _forgotPasswordOtpModel;

  ForgotPasswordEmailModel get forgotPasswordOtpModel =>
      _forgotPasswordOtpModel;

  // --------------------------- Api function ----------------------------------
  // forgot password email process function
  Future<ForgotPasswordEmailModel> forgotPasswordProcess(
      {required String email}) async {
    _isLoading.value = true;

    update();

    Map<String, dynamic> inputBody = {'credentials': email};

    await ApiServices.forgotPasswordEmailApi(body: inputBody).then((value) {
      _forgotPasswordOtpModel = value!;
      LocalStorage.saveToken(token: _forgotPasswordOtpModel.data.user.token.toString());
      Get.toNamed(Routes.otpVerificationScreen);
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _forgotPasswordOtpModel;
  }
}
