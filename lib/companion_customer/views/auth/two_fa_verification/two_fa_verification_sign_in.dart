import '../../../../companion_customer/utils/basic_screen_imports.dart';
import '../../../controller/sign_in/two_fa_verification_controller.dart';
import '/companion_customer/utils/responsive_layout.dart';
import '/companion_customer/views/auth/two_fa_verification/two_fa_verification_mobile.dart';

class UserTwoFaOtpVerificationScreen extends StatelessWidget {
  UserTwoFaOtpVerificationScreen({Key? key}) : super(key: key);
  final controller = Get.put(UserTwoFaVerificationController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: UserTwoFaVerificationMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
