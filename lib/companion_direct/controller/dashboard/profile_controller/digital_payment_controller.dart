import '../../../../companion_customer/routes/routes.dart';

import '../../../utils/basic_screen_imports.dart';

class DigitalPaymentController extends GetxController {
  final cardHolderNameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvcNumberController = TextEditingController();

  void goToAddCardScreen() {
    Get.toNamed(Routes.nannyAddCardScreen);
  }
}
