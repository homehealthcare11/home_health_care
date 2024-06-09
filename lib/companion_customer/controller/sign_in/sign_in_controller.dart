import '../../../backend/local_storage/local_storage.dart';
import '../../../backend/model/auth/sign_in_customer/sign_in_model.dart';
import '../../../backend/services/api_services.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/toast/toast_message.dart';

class SignInUserController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final resetPasswordController = TextEditingController();
  final resetConfirmController = TextEditingController();
  final emailController = TextEditingController();

  bool isFromLogin = false;
  var selectIndex = false.obs;

  signIn() {
    if (emailController.value.text.isEmpty) {
      ToastMessage.error(Strings.giveUserNameOrEmail.tr);
    } else if (passwordController.value.text.isEmpty) {
      ToastMessage.error(Strings.givePassword.tr);
    } else {
      gotoCategoriesScreen();
    }
  }

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late SignInModel _signInModel;

  SignInModel get signInModel => _signInModel;

  Future<SignInModel> signInProcess({
    required String email,
    required String password,
  }) async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'email': email,
      'password': password,
    };

    await ApiServices.signInApi(body: inputBody).then((value) {
      _signInModel = value!;

      _saveDataLocalStorage();

      if (_signInModel.data.user.emailVerified == 0) {
        isFromLogin = true;
        gotoOtpVerificationScreen();
      }
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _signInModel;
  }

  _goToSavedUser(SignInModel loginModel) {
    LocalStorage.saveToken(token: loginModel.data.token.toString());
    LocalStorage.isLoginSuccess(isLoggedIn: true);
    LocalStorage.isLoggedIn();
    update();
    LocalStorage.saveEmail(email: emailController.text);
    gotoCategoriesScreen();
  }

  // dispose all controller while the screen destroy
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    resetPasswordController.dispose();
    resetConfirmController.dispose();
    super.dispose();
  }

  void gotoOtpVerificationScreen() {
    LocalStorage.saveToken(token: _signInModel.data.token.toString());
    LocalStorage.saveEmail(email: emailController.text);
    update();
    Get.toNamed(Routes.emailVerificationScreen);
    // emailOtpController.resendCodeSignUp();

    update();
  }

  void gotoForgotPasswordScreen() {
    Get.toNamed(Routes.forgotPasswordScreen);
  }

  void gotoSignUpScreen() {
    Get.toNamed(Routes.signupScreen);
  }

  void gotoCategoriesScreen() {
    Get.offAllNamed(Routes.bottomNavBar);
  }

  _saveDataLocalStorage() {
    LocalStorage.saveIsSmsVerify(
        value: _signInModel.data.user.smsVerified == 0 ? false : true);
    LocalStorage.saveTwoFaID(
        id: _signInModel.data.user.twoFactorStatus == 0 ? false : true);
    LocalStorage.saveKyc(
        id: _signInModel.data.user.kycVerified == 1 ? true : false);

    if (_signInModel.data.user.twoFactorStatus == 1 &&
        _signInModel.data.user.twoFactorVerified == 0) {
      debugPrint(
          ">>>>>>>>>>>>>>>${_signInModel.data.user.twoFactorStatus.toString()}");
      LocalStorage.saveToken(token: signInModel.data.token);
      LocalStorage.saveEmail(email: signInModel.data.user.email);
      Get.toNamed(Routes.userGoogleTwoFaScreen);
    } else if (_signInModel.data.user.emailVerified == 1) {
      debugPrint("----------------VERIFIED");
      _goToSavedUser(signInModel);
    } else if (_signInModel.data.user.emailVerified == 0) {
      debugPrint("----------------EMAIL NOT VERIFIED");
      LocalStorage.saveToken(token: signInModel.data.token);
      Get.toNamed(Routes.emailVerificationScreen);
    }
  }
}
