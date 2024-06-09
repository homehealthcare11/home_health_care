import '../../../../../backend/local_storage/local_storage.dart';
import '../../../../../backend/model/auth/sign_up_direct/sign_up_model_direct.dart';
import '../../../../../backend/services/api_services.dart';
import '../../../../../companion_customer/routes/routes.dart';
import '../../../../model/country_model.dart';
import '../../../../utils/basic_screen_imports.dart';

class NannySignUpController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final countryController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  RxBool isSelected = true.obs;

  // dispose all controller while the screen destroy
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    countryController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  RxString selectedCountryCode = countryList.first.code.obs;
  RxString selectedCountry = countryList.first.name.obs;
  String? selectCountry;
  RxString selectedCity = countryList.first.city.first.obs;
  List<CountryModel> country = countryList;

  goToSignInScreen() {
    Get.toNamed(Routes.signInScreenNannyDirect);
  }

  goToSignUpEmailOtpVerificationScreen() {
    Get.toNamed(Routes.signUpEmailOtpVerificationScreen);
  }

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late SignUpModelDirect _signUpModel;

  SignUpModelDirect get signUpModel => _signUpModel;

  Future<SignUpModelDirect> signUpProcess({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String mobile,
    required String countryDirect,
  }) async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'mobile': mobile,
      'country': countryDirect,
      'password': password,
    };

    await ApiServices.signUpApiDirect(body: inputBody).then((value) {
      _signUpModel = value!;
      LocalStorage.saveToken(token: signUpModel.data.token.toString());
      if (signUpModel.data.nanny.emailVerified == 1) {
        Get.offAllNamed(Routes.signUpKycVerificationScreen);
        LocalStorage.isLoginSuccess(isLoggedIn: true);
      } else {
        goToSignUpEmailOtpVerificationScreen();
      }

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _signUpModel;
  }
}
