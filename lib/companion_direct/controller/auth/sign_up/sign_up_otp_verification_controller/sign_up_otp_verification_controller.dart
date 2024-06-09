import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../backend/local_storage/local_storage.dart';
import '../../../../../backend/model/common/common_success_model.dart';
import '../../../../../backend/services/api_services.dart';
import '../../../../../companion_customer/routes/routes.dart';
import '../../../../../companion_direct/controller/auth/sign_up/sign_up_otp_verification_controller/sign_up_resend_otp_controller.dart';

class SignUpOtpVerificationController extends GetxController {
  final otpInputFieldController = TextEditingController();
  final pinCodeController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  var currentText = ''.obs;
  StreamSubscription? streamSubscription;

  changeCurrentText(value) {
    currentText.value = value;
  }

  @override
  void dispose() {
    pinCodeController.clear();
    errorController!.close(); // close the errorController stream
    streamSubscription?.cancel(); // cancel the stream subscription
    super.dispose();
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
    SignUpResendOtpController controller = Get.put(SignUpResendOtpController());
    controller.signUpResendOtpProcess();
    timer?.cancel();
    secondsRemaining.value = 59;
    minuteRemaining.value = 00;
    enableResend.value = false;
    pinCodeController.clear();
    timerInit();
    // timer?.cancel();
    // secondsRemaining.value = 59;
    // enableResend.value = false;
    // timerInit();
  }

  void listenToStream() {
    // cancel any existing subscription
    streamSubscription?.cancel();

    // listen to the stream
    streamSubscription = errorController!.stream.listen((errorAnimationType) {
      // do something with the error
    });
  }

  goToKYCVerificationScreen() {
    Get.toNamed(Routes.signUpKycVerificationScreen);
  }

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late CommonSuccessModel _commonSuccessModel;

  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  // --------------------------- Api function ----------------------------------
  // email verification process function
  Future<CommonSuccessModel> emailVerificationProcess(
      {required String code}) async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {'otp': code};

    await ApiServices.emailVerificationDirectApi(body: inputBody).then((value) {
      _commonSuccessModel = value!;
      LocalStorage.saveSuccessCustomer(
          success: _commonSuccessModel.message.success.first.toString());
      LocalStorage.isLoginSuccess(isLoggedIn: true);
      goToKYCVerificationScreen();
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _commonSuccessModel;
  }
}
