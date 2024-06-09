import 'package:get/get.dart';

import '../../../../backend/model/common/common_success_model.dart';
import '../../../../backend/services/api_services.dart';
import '../../../../companion_customer/routes/routes.dart';

class LogOutController extends GetxController {
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  late CommonSuccessModel _logOutModel;

  CommonSuccessModel get dashBoardModel => _logOutModel;

  Future<CommonSuccessModel> logOutProcess() async {
    _isLoading.value = true;
    update();
    await ApiServices.logOutDirect().then((value) {
      _logOutModel = value!;

      Get.offNamedUntil(Routes.welcomeScreen, (route) => false);
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    update();
    return _logOutModel;
  }
}
