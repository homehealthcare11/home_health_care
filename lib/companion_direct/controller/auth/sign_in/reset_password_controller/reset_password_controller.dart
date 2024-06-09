import '../../../../../backend/local_storage/local_storage.dart';
import '../../../../../backend/model/common/common_success_model.dart';
import '../../../../../backend/services/api_services.dart';
import '../../../../../companion_customer/routes/routes.dart';

import '../../../../utils/basic_screen_imports.dart';

class ResetPasswordController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  void dispose() {
    confirmPassword.dispose();
    passwordController.dispose();
    super.dispose();
  }

  goToCongratulationScreen() {
    Get.toNamed(
      Routes.resetPasswordCongratulationScreen,
    );
  }

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

    await ApiServices.resetPasswordDirectApi(body: inputBody).then((value) {
      _commonSuccessModel = value!;
      LocalStorage.saveSuccessCustomer(
          success: _commonSuccessModel.message.success.first.toString());
      goToCongratulationScreen();
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _commonSuccessModel;
  }
}
