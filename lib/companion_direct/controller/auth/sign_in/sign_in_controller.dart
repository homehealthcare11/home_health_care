import '../../../../backend/model/auth/sign_in_direct/sign_in_direct_model.dart';
import '../../../../backend/services/api_services.dart';
import '../../../../companion_customer/routes/routes.dart';
import '../../../local_storage/local_storage.dart';
import '../../../utils/basic_screen_imports.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgetPasswordController = TextEditingController();

  goToForgotPasswordScreen() {
    forgetPasswordController.text = emailController.text;
    Get.toNamed(Routes.nannyForgotPasswordScreen);
  }

  goToResetPasswordScreen() {
    Get.toNamed(Routes.nannyResetPasswordScreen);
  }

  goToSignUpScreen() {
    Get.toNamed(Routes.signUpScreen);
  }

  goToDashboardScreen() {
    LocalStorage.isLoginSuccess(isLoggedIn: true);
    Get.toNamed(Routes.dashboardScreen);
  }

  bool isFromLogin = false;
  var selectIndex = false.obs;

  get onSignIn => signInProcess();

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late SignInDirectModel _signInModel;

  SignInDirectModel get signInModel => _signInModel;

  Future<SignInDirectModel> signInProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'email': emailController.text,
      'password': passwordController.text,
    };

    await ApiServices.signInDirectApi(body: inputBody).then((value) {
      _signInModel = value!;
      _saveDataLocalStorage();
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _signInModel;
  }

  _goToSavedUser(SignInDirectModel loginModel) {
    LocalStorage.saveToken(token: loginModel.data.token.toString());
    LocalStorage.isLoginSuccess(isLoggedIn: true);
    LocalStorage.isLoggedIn();
    LocalStorage.saveEmail(email: emailController.text);
    update();
    goToDashboardScreen();
  }

  _saveDataLocalStorage() {
    LocalStorage.saveIsSmsVerify(
        value: _signInModel.data.nanny.smsVerified == 0 ? false : true);
    LocalStorage.saveTwoFaID(
        id: _signInModel.data.nanny.twoFactorStatus == 0 ? false : true);
    LocalStorage.saveKyc(
        id: _signInModel.data.nanny.kycVerified == 1 ? true : false);

    if (_signInModel.data.nanny.twoFactorStatus == 1 &&
        _signInModel.data.nanny.twoFactorVerified == 0 &&
        _signInModel.data.nanny.kycVerified != 0) {
      debugPrint(
          ">>>>>>>>>>>>>>>${_signInModel.data.nanny.twoFactorStatus.toString()}");
      LocalStorage.saveToken(token: signInModel.data.token);
      LocalStorage.saveEmail(email: signInModel.data.nanny.email);
      Get.toNamed(Routes.nannyTwoFaGoogleSecurity);
    } else if (_signInModel.data.nanny.emailVerified == 1 &&
        _signInModel.data.nanny.kycVerified != 0) {
      debugPrint("----------------VERIFIED");
      _goToSavedUser(signInModel);
    } else if (_signInModel.data.nanny.emailVerified == 0 &&
        _signInModel.data.nanny.kycVerified != 0) {
      debugPrint("----------------EMAIL NOT VERIFIED");
      LocalStorage.saveToken(token: signInModel.data.token);
      Get.toNamed(Routes.signUpEmailOtpVerificationScreen);
    } else if (_signInModel.data.nanny.kycVerified == 0) {
      LocalStorage.saveToken(token: _signInModel.data.token.toString());
      Get.toNamed(Routes.signUpKycVerificationScreen);
    }
  }
}
