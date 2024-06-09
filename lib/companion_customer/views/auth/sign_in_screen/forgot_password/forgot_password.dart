import '../../../../views/auth/sign_in_screen/forgot_password/forgot_password_mobile_responsive.dart';

import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';


class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: ForgotPasswordScreenMobileResponsive(),);
  }
}


