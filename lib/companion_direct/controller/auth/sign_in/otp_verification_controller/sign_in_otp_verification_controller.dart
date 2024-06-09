import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/companion_direct/controller/auth/sign_in/forgot_password_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../backend/local_storage/local_storage.dart';
import '../../../../../backend/model/auth/sign_in_direct/forgot_password_direct/forgot_password_otp_verification_direct_model.dart';
import '../../../../../backend/services/api_services.dart';
import '../../../../../companion_customer/routes/routes.dart';

class SignInOtpVerificationController extends GetxController {
  final otpInputFieldController = TextEditingController();
  final pinCodeController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  var currentText = ''.obs;
  StreamSubscription? streamSubscription;

  changeCurrentText(value) {
    currentText.value = value;
  }

  @override
  void onInit() {
    errorController = StreamController<
        ErrorAnimationType>.broadcast(); // create a broadcast stream
    timerInit();
    super.onInit();
  }

  timerInit() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (minuteRemaining.value != 0) {
        secondsRemaining.value--;
        if (secondsRemaining.value == 0) {
          secondsRemaining.value = 59;
          minuteRemaining.value = 0;
        }
      } else if (minuteRemaining.value == 0 && secondsRemaining.value != 0) {
        secondsRemaining.value--;
      } else {
        enableResend.value = true;
      }
    });
  }

  RxInt secondsRemaining = 59.obs;
  RxInt minuteRemaining = 00.obs;
  RxBool enableResend = false.obs;
  Timer? timer;

  resendCode() {
    ForgotPasswordController controller = Get.put(ForgotPasswordController());
    if (controller.emailController.text.isNotEmpty) {
      controller.forgotPasswordProcess(email: controller.emailController.text);
      timer?.cancel();
      secondsRemaining.value = 59;
      enableResend.value = false;
      timerInit();
    }
  }

  void listenToStream() {
    // cancel any existing subscription
    streamSubscription?.cancel();

    // listen to the stream
    streamSubscription = errorController!.stream.listen((errorAnimationType) {
      // do something with the error
    });
  }

  goToResetPasswordScreen() {
    Get.toNamed(Routes.nannyResetPasswordScreen);
  }

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late ResetOtpDirectModel _resetOtpModel;

  ResetOtpDirectModel get resetOtpModel => _resetOtpModel;

  // --------------------------- Api function ----------------------------------
  // reset otp process function
  Future<ResetOtpDirectModel> resetOtpProcess({required String otp}) async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'otp': otp,
      'token': LocalStorage.getToken()
    };

    await ApiServices.resetOtpDirectApi(body: inputBody).then((value) {
      _resetOtpModel = value!;
      LocalStorage.saveToken(
          token: _resetOtpModel.data.passwordResetData.token.toString());
      goToResetPasswordScreen();
      // Get.toNamed(Routes.resetPasswordScreen);
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _resetOtpModel;
  }
}
