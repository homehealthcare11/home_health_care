import '/companion_customer/views/two_fa_verification_screen/two_fa_verification_mobile_screen_layout.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';

class UserTwoFaVerificationScreen extends StatelessWidget {
  const UserTwoFaVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: TwoFaVerificationMobileScreenLayout(),
    );
  }
}
