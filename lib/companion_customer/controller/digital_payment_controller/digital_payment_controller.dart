import '/backend/model/user_payment_method/payment_method_paypal_model.dart';

import '../../../backend/model/user_payment_method/payment_method_model.dart';
import '../../../backend/services/api_services.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';

class DigitalPaymentController extends GetxController {
  RxString paymentURL = ''.obs;
  RxString paymentMethod = ''.obs;

  void goToAddCardScreen() {
    Get.toNamed(Routes.addCardScreen);
  }

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late PaymentMethodModel _paymentMethodModel;

  PaymentMethodModel get paymentMethodModel => _paymentMethodModel;

  Future<PaymentMethodModel> userAddMoneyProcess(
      int id, String alias, double amount) async {
    debugPrint("Step 1");
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'amount': amount,
      'currency': alias,
      'user_request_id': id,
    };

    await ApiServices.userAddMoneyApi(body: inputBody).then((value) {
      _paymentMethodModel = value!;
      Get.toNamed(Routes.addCardScreen, arguments: id);

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _paymentMethodModel;
  }

  late PaymentMethodPaypalModel _paymentMethodPaypalModel;

  PaymentMethodPaypalModel get paymentMethodPaypalModel =>
      _paymentMethodPaypalModel;

  Future<PaymentMethodPaypalModel> userAddMoneyPaypalProcess(
      int id, String alias, double amount) async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'amount': amount,
      'currency': alias,
      'user_request_id': id,
    };

    await ApiServices.userAddMoneyPaypalApi(body: inputBody).then((value) {
      _paymentMethodPaypalModel = value!;
      final data = _paymentMethodPaypalModel.data.url;
      for (int i = 0; i < data.length; i++) {
        if (data[i].rel.contains('approve')) {
          paymentURL.value = data[i].href;
        }
      }

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _paymentMethodPaypalModel;
  }
}
