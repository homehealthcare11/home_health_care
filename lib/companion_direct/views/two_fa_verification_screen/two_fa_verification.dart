import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '/companion_direct/views/two_fa_verification_screen/two_fa_verification_mobile_screen_layout.dart';

class TwoFaVerificationScreen extends StatelessWidget {
  const TwoFaVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: TwoFaVerificationMobileScreenLayout(),
    );
  }
}
