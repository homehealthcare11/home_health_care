import '../../../../backend/model/common/common_success_model.dart';
import '../../../../backend/services/api_services.dart';
import '../../../../companion_customer/routes/routes.dart';
import '../../../utils/basic_screen_imports.dart';

class ServiceTrackingController extends GetxController {
  RxBool isChecked = true.obs;

  // int id = 15;

  goToDashboardScreen() {
    Get.toNamed(Routes.dashboardScreen);
  }

  final _isUpdateLoading = false.obs;

  bool get isUpdateLoading => _isUpdateLoading.value;

  late CommonSuccessModel commonSuccessModel;

  // --------------------------- Api function ----------------------------------
  // Profile update process without image
  Future<CommonSuccessModel> serviceAcceptProcess(int id) async {
    _isUpdateLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'status': 1,

      // 'name' : firstNameController.text
    };

    await ApiServices.serviceRequestAccept(body: inputBody, id: id)
        .then((value) {
      commonSuccessModel = value!;
      // getProfileData();
      Get.offAllNamed(Routes.dashboardScreen);
      _isUpdateLoading.value = false;
      update();
      update();
    }).catchError((onError) {
      log.e(onError);
      _isUpdateLoading.value = false;
      update();
    });

    return commonSuccessModel;
  }

  final _isCancelLoading = false.obs;

  bool get isCancelLoading => _isCancelLoading.value;

  Future<CommonSuccessModel> serviceCancelProcess(int id) async {
    _isCancelLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'status': 2,

      // 'name' : firstNameController.text
    };

    await ApiServices.serviceRequestAccept(body: inputBody, id: id)
        .then((value) {
      commonSuccessModel = value!;
      // getProfileData();
      Get.offAllNamed(Routes.dashboardScreen);
      _isCancelLoading.value = false;
      update();
      update();
    }).catchError((onError) {
      log.e(onError);
      _isCancelLoading.value = false;
      update();
    });

    return commonSuccessModel;
  }

  final _isTaskCompleteLoading = false.obs;

  bool get isTaskCompleteLoading => _isTaskCompleteLoading.value;

  // late CommonSuccessModel commonSuccessModel;

  // --------------------------- Api function ----------------------------------
  // Profile update process without image
  Future<CommonSuccessModel> serviceRequestTaskCompete(int id) async {
    _isTaskCompleteLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'status': 4,

      // 'name' : firstNameController.text
    };

    await ApiServices.serviceRequestAccept(body: inputBody, id: id)
        .then((value) {
      commonSuccessModel = value!;
      // getProfileData();
      Get.offAllNamed(Routes.dashboardScreen);
      _isTaskCompleteLoading.value = false;
      update();
      update();
    }).catchError((onError) {
      log.e(onError);
      _isTaskCompleteLoading.value = false;
      update();
    });

    return commonSuccessModel;
  }
}
