import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../backend/local_storage/local_storage.dart';
import '../../../../backend/model/common/common_success_model.dart';
import '../../../../backend/services/api_services.dart';
import '../../../routes/routes.dart';

class ResetPasswordController extends GetxController {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // api loading process indicator variable
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late CommonSuccessModel _commonSuccessModel;

  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  // --------------------------- Api function ----------------------------------
  // reset password process function
  Future<CommonSuccessModel> resetPasswordPrecess(
      {required String password, required String passwordConfirmation}) async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'password': password,
      'password_confirmation': passwordConfirmation,
      'token': LocalStorage.getToken()
    };

    await ApiServices.resetPasswordApi(body: inputBody).then((value) {
      _commonSuccessModel = value!;
      LocalStorage.saveSuccessCustomer(
          success: _commonSuccessModel.message.success.first.toString());
      Get.toNamed(Routes.congratulationScreenSignIn);
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _commonSuccessModel;
  }
}
