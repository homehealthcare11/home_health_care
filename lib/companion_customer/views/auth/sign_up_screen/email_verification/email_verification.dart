import '../../../../utils/responsive_layout.dart';
import '../../../../views/auth/sign_up_screen/email_verification/email_verification_mobile_responsive.dart';

import '../../../../utils/basic_screen_imports.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: EmailVerificationMobileResponsive());
  }
}


