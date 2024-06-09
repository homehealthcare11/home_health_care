import 'package:get/get.dart';

import '../../../backend/model/user_notification/user_notification_model.dart';
import '../../../backend/services/api_services.dart';

class NotificationController extends GetxController {
  @override
  void onInit() {
    getServiceCartProcess();

    super.onInit();
  }

  RxBool isChecked = true.obs;

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late UserNotificationModel _userNotificationModel;

  UserNotificationModel get notificationModel => _userNotificationModel;

  Future<UserNotificationModel> getServiceCartProcess() async {
    _isLoading.value = true;
    update();

    await ApiServices.userNotificationApi().then((value) {
      _userNotificationModel = value!;

      //end of get data and start navigation
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _userNotificationModel;
  }
}
