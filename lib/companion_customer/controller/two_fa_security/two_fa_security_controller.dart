import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';

class TwoFaSecurityController extends GetxController {
  final phoneNumberController = TextEditingController();

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  void goToSomeScreen() {
    Get.toNamed(Routes.bottomNavBar);
  }
}
