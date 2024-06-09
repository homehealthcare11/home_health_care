import 'package:get/get.dart';

import '../../../../../backend/model/common/common_success_model.dart';
import '../../../../../backend/services/api_services.dart';





class SignUpResendOtpController extends GetxController {
  // api loading process indicator variable
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late CommonSuccessModel _commonSuccessModel;

  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  // --------------------------- Api function ----------------------------------
  // sign up resend otp process function
  Future<CommonSuccessModel> signUpResendOtpProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {};

    await ApiServices.signUpResendOtpDirectApi(body: inputBody).then((value) {
      _commonSuccessModel = value!;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _commonSuccessModel;
  }
}
