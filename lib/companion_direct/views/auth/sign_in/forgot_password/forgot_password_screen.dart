import '../../../../../companion_direct/views/auth/sign_in/forgot_password/forgot_password_screen_mobile.dart';

import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: ForgotPasswordScreenMobile(),
    );
  }
}
