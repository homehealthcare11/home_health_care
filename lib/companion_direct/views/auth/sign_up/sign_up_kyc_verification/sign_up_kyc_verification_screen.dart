import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';
import '../../../../views/auth/sign_up/sign_up_kyc_verification/sign_up_kyc_verification_screen_mobile.dart';

class SignUpKycVerificationScreen extends StatelessWidget {
  const SignUpKycVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: SignUpKycVerificationScreenMobile(),
    );
  }
}
