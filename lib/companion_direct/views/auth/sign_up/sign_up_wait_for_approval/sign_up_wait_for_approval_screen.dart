import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';
import '../../../../views/auth/sign_up/sign_up_wait_for_approval/sign_up_wait_for_approval_screen_mobile.dart';

class SignUpWaitForApprovalScreen extends StatelessWidget {
  const SignUpWaitForApprovalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: SignUpWaitForApprovalScreenMobile(),
    );
  }
}
