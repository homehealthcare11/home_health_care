import '/backend/model/direct_notification/direct_notification_model.dart';
import 'package:get/get.dart';

import '../../../../backend/services/api_services.dart';

class NotificationController extends GetxController {
  @override
  void onInit() {
    getNotificationDataProcess();

    super.onInit();
  }

  RxBool isChecked = true.obs;

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late DirectNotificationModel _userNotificationModel;

  DirectNotificationModel get notificationModel => _userNotificationModel;

  Future<DirectNotificationModel> getNotificationDataProcess() async {
    _isLoading.value = true;
    update();

    await ApiServices.directNotificationApi().then((value) {
      _userNotificationModel = value!;

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _userNotificationModel;
  }
}
