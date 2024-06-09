import '../../../../../companion_direct/utils/responsive_layout.dart';
import '../../../../utils/basic_screen_imports.dart';
import 'congratulation_screen_sign_in_mobile_responsive.dart';

class CongratulationScreenSignIn extends StatelessWidget {
  const CongratulationScreenSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileScaffold: CongratulationScreenSignInMobileResponsive());
  }
}
