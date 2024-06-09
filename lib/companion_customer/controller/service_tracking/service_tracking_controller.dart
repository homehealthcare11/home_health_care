import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../backend/model/common/common_success_model.dart';
import '../../../backend/model/service_cart_user/service_cart_user_model.dart';
import '../../../backend/services/api_services.dart';

class ServiceTrackingController extends GetxController {
  // all text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final bioController = TextEditingController();
  final scheduleController = TextEditingController();
  final addressController = TextEditingController();
  final statusController = TextEditingController();
  RxString selectPaymentMethod = ''.obs;
  RxString selectPaymentMethodName = 'Select payment method'.obs;

  @override
  void onInit() {
    getServiceCartProcess();
    super.onInit();
  }

  // dispose all controller while the screen destroy
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  RxBool isChecked = true.obs;

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late ServiceCartModel _serviceCartModel;

  ServiceCartModel get serviceCartModel => _serviceCartModel;

  Future<ServiceCartModel> getServiceCartProcess() async {
    _isLoading.value = true;
    update();

    await ApiServices.serviceCartApi().then((value) {
      _serviceCartModel = value!;

      //end of get data and start navigation
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _serviceCartModel;
  }

  final _serviceCancelLoading = false.obs;

  bool get serviceCancelLoading => _serviceCancelLoading.value;

  late CommonSuccessModel _commonSuccessModel;

  CommonSuccessModel get serviceRequest => _commonSuccessModel;

  Future<CommonSuccessModel> serviceCancelProcess(int id) async {
    _serviceCancelLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {'id': id};

    await ApiServices.serviceCancelApi(body: inputBody).then((value) {
      _commonSuccessModel = value!;

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _serviceCancelLoading.value = false;
    update();
    return _commonSuccessModel;
  }
}
