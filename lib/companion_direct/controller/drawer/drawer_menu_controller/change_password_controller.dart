import '../../../../backend/local_storage/local_storage.dart';
import '../../../../backend/model/common/common_success_model.dart';
import '../../../../backend/services/api_services.dart';
import '../../../../companion_customer/routes/routes.dart';
import '../../../utils/basic_widget_imports.dart';

class ChangePasswordController extends GetxController {
  // all text editing controller
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // dispose all controller while the screen destroy
  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }


  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late CommonSuccessModel _commonSuccessModel;

  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  // --------------------------- Api function ----------------------------------
  // reset password process function
  Future<CommonSuccessModel> resetPasswordPrecess(
      ) async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'current_password': oldPasswordController.text,
      'password': newPasswordController.text,
      'password_confirmation': confirmPasswordController.text,
      'token' : LocalStorage.getToken()
    };

    await ApiServices.changePasswordDirectApi(body: inputBody).then((value) {
      _commonSuccessModel = value!;
      LocalStorage.saveSuccessCustomer(
          success: _commonSuccessModel.message.success.first.toString());
      Get.offAllNamed(Routes.dashboardScreen);
      // Get.toNamed(Routes.congratulations);
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _commonSuccessModel;
  }
}