import 'dart:async';

import '../../../backend/local_storage/local_storage.dart';
import '../../../backend/model/basic_settings/basic_settings_model.dart';
import '../../../backend/services/api_endpoint.dart';
import '../../../backend/services/api_services.dart';
import '../../../backend/services/basic_settings/basic_settings_service.dart';
import '../../data/onboard_data.dart';
import '../../model/onboard_model.dart';
import '../../utils/basic_screen_imports.dart';

class BasicSettingsController extends GetxController
    with BasicSettingsApiServices {
  RxString splashImage = ''.obs;
  RxString onboardImage = ''.obs;
  RxString onBoardTitle = ''.obs;
  RxString onBoardSubTitle = ''.obs;
  RxString appBasicLogoWhite = ''.obs;
  RxString appBasicLogoDark = ''.obs;
  RxString privacyPolicy = ''.obs;
  RxString contactUs = ''.obs;
  RxString aboutUs = ''.obs;
  RxString path = ''.obs;

  @override
  void onInit() {
    getBasicSettingsApiProcess();
    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  late BasicSettingsInfoModel _appSettingsModel;
  BasicSettingsInfoModel get appSettingsModel => _appSettingsModel;

  Future<BasicSettingsInfoModel> getBasicSettingsApiProcess() async {
    _isLoading.value = true;

    update();
    await getBasicSettingProcessApi().then((value) {
      _appSettingsModel = value!;
      saveInfo();
      update();
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
    });
    _isLoading.value = false;
    update();
    return _appSettingsModel;
  }

  void saveInfo() {
    if (_appSettingsModel.data.splashScreen.splashScreenImage != '') {
      var imageSplash = _appSettingsModel.data.splashScreen.splashScreenImage;

      var imagePath = _appSettingsModel.data.imagePath;
      splashImage.value = "${ApiEndpoint.mainDomain}/$imagePath/$imageSplash";
      LocalStorage.saveSplashImage(image: splashImage.value);
      debugPrint(splashImage.value);
    }

    LocalStorage.saveOnboard1(
        image:
            "${ApiEndpoint.mainDomain}/${_appSettingsModel.data.imagePath}/${_appSettingsModel.data.onboardScreen.first.image}");
    LocalStorage.saveOnboard2(
        image:
            "${ApiEndpoint.mainDomain}/${_appSettingsModel.data.imagePath}/${_appSettingsModel.data.onboardScreen.last.image}");
    var data = _appSettingsModel.data.onboardScreen;
    onboardData.add(
      OnboardModel(
        image: LocalStorage.getOnboard1(),
        title: data[0].title,
        description: data[0].subTitle,
      ),
    );
    onboardData.add(
      OnboardModel(
        image: LocalStorage.getOnboard2(),
        title: data[1].title,
        description: data[1].subTitle,
      ),
    );

    path.value =
        "${ApiEndpoint.mainDomain}/${_appSettingsModel.data.imagePath}/";
    Strings.appName = "SitterHub";

    if (_appSettingsModel.data.defaultLogo == '') {
      debugPrint('basic settings 1 testing');
      appBasicLogoWhite.value =
          "${ApiEndpoint.mainDomain}/${_appSettingsModel.data.allLogo}";

      appBasicLogoDark.value = appBasicLogoWhite.value;
      LocalStorage.saveBasicLogo(logo: appBasicLogoDark.value);
    } else {
      appBasicLogoWhite.value =
          "${ApiEndpoint.mainDomain}/${_appSettingsModel.data.logoImagePath}/${_appSettingsModel.data.allLogo.siteLogo}";
      appBasicLogoDark.value =
          "${ApiEndpoint.mainDomain}/${_appSettingsModel.data.logoImagePath}/${_appSettingsModel.data.allLogo.siteLogoDark}";
      debugPrint("logo white ======> ${appBasicLogoWhite.value}");
      debugPrint("logo dark ======> ${appBasicLogoDark.value}");
      LocalStorage.saveBasicLogo(logo: appBasicLogoWhite.value.toString());
      LocalStorage.saveBasicLogoDark(logo: appBasicLogoDark.value.toString());
    }
  }
}
