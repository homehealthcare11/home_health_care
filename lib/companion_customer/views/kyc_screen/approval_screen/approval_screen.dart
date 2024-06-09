import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import '../../../views/kyc_screen/approval_screen/approval_screen_mobile.dart';

class SignUpWaitForApprovalScreen extends StatelessWidget {
  const SignUpWaitForApprovalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileScaffold: SignUpWaitForApprovalScreenMobile(),
    );
  }
}
