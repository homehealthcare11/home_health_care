import '../../../../utils/responsive_layout.dart';
import '../../../../views/auth/sign_up_screen/congratulation_screen/congratulation_screen_mobile_layout.dart';

import '../../../../utils/basic_screen_imports.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(mobileScaffold: CongratulationScreenMobileLayout());
  }
}

