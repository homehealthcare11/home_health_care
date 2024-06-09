import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../backend/local_storage/local_storage.dart';
import '../../../backend/model/auth/sign_up_customer/signup_model.dart';
import '../../../backend/model/service_area_nanny_direct/service_area_model.dart';
import '../../../backend/services/api_services.dart';
import '../../model/country_model.dart';
import '../../routes/routes.dart';

class SignUpController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final stateController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final countryController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String? selectCountry;
  String selectCountryCode = '';
  RxBool isSelected = true.obs;

  @override
  void onInit() {
    super.onInit();
    getServiceArea();
  }

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

  RxString countryMethod = "Bangladesh".obs;
  RxString nationalityMethod = "Bangladesh".obs;
  RxString selectedCountry = countryList.first.name.obs;
  List<CountryModel> country = countryList;
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late SignUpModel _signUpModel;

  SignUpModel get signUpModel => _signUpModel;

  Future<SignUpModel> signUpProcess({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String city,
    required String country,
    required String state,
    required String address,
  }) async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'policy': "on",
      'country': country,
      'city': city,
      'state': state,
      'address': address,
    };

    await ApiServices.signUpApi(body: inputBody).then((value) {
      _signUpModel = value!;
      LocalStorage.saveToken(token: signUpModel.data.token.toString());
      if (signUpModel.data.user.emailVerified == 1) {
        debugPrint("email verified");
        LocalStorage.isLoginSuccess(isLoggedIn: true);
        Get.offAllNamed(Routes.bottomNavBar);
      } else {
        debugPrint("email not verified");
        gotoEmailVerificationScreen();
      }

      // LocalStorage.isLoggedIn();
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _signUpModel;
  }

  gotoSignInScreen() {
    Get.toNamed(Routes.signInScreen);
  }

  gotoEmailVerificationScreen() {
    Get.toNamed(Routes.emailVerificationScreen);
  }

  final List<String> serviceArea = [];
  RxString selectArea = "".obs;
  final _isServiceAreaLoading = false.obs;

  bool get isServiceAreaLoading => _isServiceAreaLoading.value;

  late ServiceAreaModel _serviceAreaModel;

  ServiceAreaModel get serviceAreaModel => _serviceAreaModel;

  Future<ServiceAreaModel> getServiceArea() async {
    _isServiceAreaLoading.value = true;
    update();

    await ApiServices.serviceAreaListProcessApi().then((value) {
      _serviceAreaModel = value!;
      selectArea.value = serviceAreaModel.data.first.serviceArea;

      var data = serviceAreaModel.data;
      for (int i = 0; i < data.length; i++) {
        serviceArea.add(data[i].serviceArea);
      }

      if (kDebugMode) {
        print(serviceArea);
      }

      //end of get data and start navigation
      update();
    });

    _isServiceAreaLoading.value = false;
    update();
    return _serviceAreaModel;
  }
}
