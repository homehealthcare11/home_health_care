import '../../../utils/responsive_layout.dart';
import '../../../views/auth/sign_up_screen/sign_up_screen_mobile_responsive.dart';

import '../../../utils/basic_screen_imports.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: SignupScreenMobileResponsive());
  }
}


