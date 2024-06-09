import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/constants.dart';

const String idKey = "idKey";

const String nameKey = "nameKey";

const String tokenKey = "tokenKey";

const String directTokenKey = "directTokenKey";

const String emailKey = "emailKey";

const String imageKey = "imageKey";

const String showAdKey = "showAdKey";

const String isLoggedInKey = "isLoggedInKey";

const String isDirectLoggedInKey = "isDirectLoggedInKey";

const String isDataLoadedKey = "isDataLoadedKey";

const String isOnBoardDoneKey = "isOnBoardDoneKey";

const String isScheduleEmptyKey = "isScheduleEmptyKey";

const String language = "language";

const String smallLanguage = "smallLanguage";

const String capitalLanguage = "capitalLanguage";

const String isSuccessCustomerKey = "isSuccessKey";

const String userId = "userId";
const String splashImage = "splashImage";
const String guestUser = "guestUser";
const String isSmsVerifyKey = "isSmsVerifyKey";
const String twoFaKey = "twoFaKey";
const String kycKey = "kycKey";
const String onboardImage1 = "onboardImage1";
const String baseColorKey = "baseColorKey";
const String onboardImage2 = "onboardImage2";
const String onboardImage3 = "onboardImage3";
const String saveBasicLogoKey = "saveBasicLogoKey";
const String saveBasicLogoDarkKey = "saveBasicLogoDarkKey";

class LocalStorage {
  static Future<void> saveId({required String id}) async {
    final box = GetStorage();

    await box.write(idKey, id);
  }

  static Future<void> saveIsSmsVerify({required bool value}) async {
    final box = GetStorage();

    await box.write(isSmsVerifyKey, value);
  }

  static Future<void> saveSplashImage({required String image}) async {
    final box = GetStorage();

    await box.write(splashImage, image);
  }

  static Future<void> saveBasicLogoDark({required String logo}) async {
    final box = GetStorage();

    await box.write(saveBasicLogoDarkKey, logo);
  }

  static Future<void> saveTwoFaID({required bool id}) async {
    final box = GetStorage();
    await box.write(twoFaKey, id);
  }

  static Future<void> saveBasicLogo({required String logo}) async {
    final box = GetStorage();

    await box.write(saveBasicLogoKey, logo);
  }

  static Future<void> saveBaseColor({required String baseColor}) async {
    final box = GetStorage();

    await box.write(baseColorKey, baseColor);
  }

  static Future<void> saveKyc({required bool id}) async {
    final box = GetStorage();
    await box.write(kycKey, id);

    debugPrint('is Kyc Verified:$id');
  }

  static String? getSplashImage() {
    return GetStorage().read(splashImage) ?? '';
  }

  static Future<void> saveOnboard1({required String image}) async {
    final box = GetStorage();

    await box.write(onboardImage1, image);
  }

  static String getBaseColor() {
    return GetStorage().read(baseColorKey);
  }

  static String getBasicLogoDark() {
    return GetStorage().read(saveBasicLogoDarkKey);
  }

  static String getOnboard1() {
    return GetStorage().read(onboardImage1);
  }

  static Future<void> saveOnboard2({required String image}) async {
    final box = GetStorage();

    await box.write(onboardImage2, image);
  }

  static Future<void> saveOnboard3({required String image}) async {
    final box = GetStorage();

    await box.write(onboardImage3, image);
  }

  static Future<void> saveSuccessCustomer({required String success}) async {
    final box = GetStorage();

    await box.write(isSuccessCustomerKey, success);
  }

  static String getOnboard2() {
    return GetStorage().read(onboardImage2);
  }

  static Future<void> saveName({required String name}) async {
    final box = GetStorage();

    await box.write(nameKey, name);
  }

  static Future<void> saveEmail({required String email}) async {
    final box = GetStorage();

    await box.write(emailKey, email);
  }

  static String getBasicLogo() {
    return GetStorage().read(saveBasicLogoKey);
  }

  static String getOnboard3() {
    return GetStorage().read(onboardImage3);
  }

  static Future<void> saveToken({required String token}) async {
    final box = GetStorage();

    await box.write(tokenKey, token);
  }

  static Future<void> saveTokenDirect({required String token}) async {
    final box = GetStorage();

    await box.write(directTokenKey, token);
  }

  static Future<void> saveImage({required String image}) async {
    final box = GetStorage();

    await box.write(imageKey, image);
  }

  static Future<void> isLoginSuccess({required bool isLoggedIn}) async {
    final box = GetStorage();

    await box.write(isLoggedInKey, isLoggedIn);
  }

  static Future<void> isDirectLoginSuccess({required bool isLoggedIn}) async {
    final box = GetStorage();

    await box.write(isDirectLoggedInKey, isLoggedIn);
  }

  static Future<void> dataLoaded({required bool isDataLoad}) async {
    final box = GetStorage();

    await box.write(isDataLoadedKey, isDataLoad);
  }

  static Future<void> scheduleEmpty({required bool isScheduleEmpty}) async {
    final box = GetStorage();

    await box.write(isScheduleEmptyKey, isScheduleEmpty);
  }

  static Future<void> showAdYes({required bool isShowAdYes}) async {
    final box = GetStorage();

    await box.write(showAdKey, isShowAdYes);
  }

  static Future<void> saveOnboardDoneOrNot(
      {required bool isOnBoardDone}) async {
    final box = GetStorage();

    await box.write(isOnBoardDoneKey, isOnBoardDone);
  }

  static Future<void> saveLanguage({
    required String langSmall,
    required String langCap,
    required String languageName,
  }) async {
    final box1 = GetStorage();
    final box2 = GetStorage();
    final box3 = GetStorage();
    languageStateName = languageName;
    var locale = Locale(langSmall, langCap);
    Get.updateLocale(locale);
    await box1.write(smallLanguage, langSmall);
    await box2.write(capitalLanguage, langCap);
    await box3.write(language, languageName);
  }

  static List getLanguage() {
    String small = GetStorage().read(smallLanguage) ?? 'en';
    String capital = GetStorage().read(capitalLanguage) ?? 'EN';
    String languages = GetStorage().read(language) ?? 'English';
    return [small, capital, languages];
  }

  static Future<void> changeLanguage() async {
    final box = GetStorage();
    await box.remove(language);
  }

  static String? getId() {
    return GetStorage().read(idKey);
  }

  static String? getName() {
    return GetStorage().read(nameKey);
  }

  static String? getEmail() {
    return GetStorage().read(emailKey);
  }

  static String? getToken() {
    var rtrn = GetStorage().read(tokenKey);

    debugPrint(rtrn == null ? "##Token is null###" : "");

    return rtrn;
  }

  static String? getTokenDirect() {
    var rtrn = GetStorage().read(directTokenKey);

    debugPrint(rtrn == null ? "##Token is null###" : "");

    return rtrn;
  }

  static String? getImage() {
    return GetStorage().read(imageKey);
  }

  static bool isLoggedIn() {
    return GetStorage().read(isLoggedInKey) ?? false;
  }

  static bool isDirectLoggedIn() {
    return GetStorage().read(isDirectLoggedInKey) ?? false;
  }

  static bool isDataLoaded() {
    return GetStorage().read(isDataLoadedKey) ?? false;
  }

  static bool isScheduleEmpty() {
    return GetStorage().read(isScheduleEmptyKey) ?? false;
  }

  static bool isOnBoardDone() {
    return GetStorage().read(isOnBoardDoneKey) ?? false;
  }

  static bool showAdPermission() {
    return GetStorage().read(showAdKey) ?? true;
  }

  static Future<void> logout() async {
    final box = GetStorage();

    await box.remove(idKey);

    await box.remove(nameKey);

    await box.remove(emailKey);

    await box.remove(imageKey);

    await box.remove(isLoggedInKey);

    await box.remove(isDirectLoggedInKey);

    await box.remove(isOnBoardDoneKey);
  }
}
