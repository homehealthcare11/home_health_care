import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const String idKey = "idKey";

const String firstNameKey = "firstNameKey";

const String lastNameKey = "lastNameKey";

const String nameKey = "nameKey";

const String tokenKey = "tokenKey";

const String emailKey = "emailKey";

const String imageKey = "imageKey";

const String showAdKey = "showAdKey";

const String isLoggedInKey = "isLoggedInKey";

const String isDataLoadedKey = "isDataLoadedKey";

const String isOnBoardDoneKey = "isOnBoardDoneKey";

const String isScheduleEmptyKey = "isScheduleEmptyKey";

const String isSuccessKey = "isSuccessKey";

const String language = "language";

const String smallLanguage = "smallLanguage";

const String capitalLanguage = "capitalLanguage";

const String isLanguageSetByUserKey = "isLanguageSetByUser";

//! **************************************
const String onboardTitleKey = "onboardTitleKey";
const String onboardSubTitleKey = "onboardSubTitleKey";
const String logoDarkImageKey = "logoDarkImageKey";
const String logoLightImageKey = "logoLightImageKey";
const String splashScreenImageKey = "splashScreenImageKey";
const String onboardScreenImageKey = "onboardScreenImageKey";
const String userId = "userId";
const String guestUser = "guestUser";
const String isSmsVerifyKey = "isSmsVerifyKey";
const String twoFaKey = "twoFaKey";
const String kycKey = "kycKey";

class LocalStorage {
  static Future<void> saveId({required String id}) async {
    final box = GetStorage();

    await box.write(idKey, id);
  }

  static Future<void> saveKyc({required bool id}) async {
    final box = GetStorage();
    await box.write(kycKey, id);

    debugPrint('is Kyc Verified:$id');
  }

  static Future<void> saveTwoFaID({required bool id}) async {
    final box = GetStorage();
    await box.write(twoFaKey, id);
  }

  static Future<void> saveIsSmsVerify({required bool value}) async {
    final box = GetStorage();

    await box.write(isSmsVerifyKey, value);
  }

  static Future<void> saveFirstName({required String firstName}) async {
    final box = GetStorage();

    await box.write(firstNameKey, firstName);
  }

  static Future<void> saveLastName({required String lastName}) async {
    final box = GetStorage();

    await box.write(lastNameKey, lastName);
  }

  static Future<void> saveName({required String name}) async {
    final box = GetStorage();

    await box.write(nameKey, name);
  }

  static Future<void> saveEmail({required String email}) async {
    final box = GetStorage();

    await box.write(emailKey, email);
  }

  static Future<void> saveToken({required String token}) async {
    final box = GetStorage();

    await box.write(tokenKey, token);
  }

  static Future<void> saveImage({required String image}) async {
    final box = GetStorage();

    await box.write(imageKey, image);
  }

  static Future<void> saveSuccess({required String success}) async {
    final box = GetStorage();

    await box.write(isSuccessKey, success);
  }

  static Future<void> isLoginSuccess({required bool isLoggedIn}) async {
    final box = GetStorage();

    await box.write(isLoggedInKey, isLoggedIn);
  }

  static Future<void> dataLoaded({required bool isDataLoad}) async {
    final box = GetStorage();

    await box.write(isDataLoadedKey, isDataLoad);
  }

// ! ***********************************************************************
  static Future<void> saveLogoDarkImage({required String image}) async {
    final box = GetStorage();
    await box.remove(logoDarkImageKey);

    await box.write(logoDarkImageKey, image);
  }

  static Future<void> saveSplashScreenImage({required String image}) async {
    final box = GetStorage();

    await box.write(splashScreenImageKey, image);
  }

  static Future<void> saveOnboardScreenImage({required String image}) async {
    final box = GetStorage();

    await box.write(onboardScreenImageKey, image);
  }

  static Future<void> saveOnBoardTitle({required String title}) async {
    final box = GetStorage();

    await box.write(onboardTitleKey, title);
  }

  static Future<void> saveOnBoardSubTitle({required String subTitle}) async {
    final box = GetStorage();

    await box.write(onboardSubTitleKey, subTitle);
  }

  static Future<void> saveGuestUser({required bool isGuest}) async {
    final box = GetStorage();

    await box.write(guestUser, isGuest);
  }

  static Future<void> setUserSelectedLanguage(
      {required bool isUserSelectedLanguage}) async {
    final box = GetStorage();

    await box.write(isLanguageSetByUserKey, isUserSelectedLanguage);
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

  static String? getFirstName() {
    return GetStorage().read(firstNameKey);
  }

  static String? getLastName() {
    return GetStorage().read(lastNameKey);
  }

  static String? getName() {
    return GetStorage().read(nameKey);
  }

  static String getEmail() {
    return GetStorage().read(emailKey);
  }

  static String? getToken() {
    var rtrn = GetStorage().read(tokenKey);

    debugPrint(rtrn == null ? "##Token is null###" : "");

    return rtrn;
  }

  static String getImage() {
    return GetStorage().read(imageKey);
  }

  static String? getSuccess() {
    return GetStorage().read(isSuccessKey);
  }

  static bool isLoggedIn() {
    return GetStorage().read(isLoggedInKey) ?? false;
  }

  static bool isUserSelectedLanguage() {
    return GetStorage().read(isLanguageSetByUserKey) ?? false;
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

  // ! ************************************

  static String getSplashScreenImage() {
    return GetStorage().read(splashScreenImageKey) ?? '';
  }

  static String getOnboardScreenImage() {
    return GetStorage().read(onboardScreenImageKey) ?? '';
  }

  static String getOnboardTitle() {
    return GetStorage().read(onboardTitleKey) ?? '';
  }

  static String getOnboardSubTitle() {
    return GetStorage().read(onboardSubTitleKey) ?? '';
  }

//! is guest
  static bool getIsGuest() {
    return GetStorage().read(guestUser) ?? false;
  }

  static Future<void> logout() async {
    final box = GetStorage();

    await box.remove(idKey);

    await box.remove(firstNameKey);

    await box.remove(lastNameKey);

    await box.remove(nameKey);

    await box.remove(emailKey);

    await box.remove(imageKey);

    await box.remove(isLoggedInKey);

    await box.remove(isOnBoardDoneKey);

    await box.remove(tokenKey);
  }
}
