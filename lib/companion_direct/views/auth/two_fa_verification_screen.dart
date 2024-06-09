import '../../utils/basic_screen_imports.dart';
import '/companion_direct/controller/auth/sign_in/two_fa_verification_controller.dart';
import '/companion_direct/utils/responsive_layout.dart';
import '/companion_direct/views/auth/two_fa_verification_mobile_screen_layout.dart';

class TwoFaOtpVerificationScreen extends StatelessWidget {
  TwoFaOtpVerificationScreen({Key? key}) : super(key: key);
  final controller = Get.put(TwoFaVerificationController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: TwoFaVerificationMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
