import '../../../companion_customer/utils/basic_screen_imports.dart';
import '../../../companion_customer/utils/responsive_layout.dart';
import '/companion_direct/views/privacy_policy_screen/privacy_policy_mobile_screen.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: PrivacyPolicyMobileScreen());
  }
}
