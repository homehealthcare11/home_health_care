import '../../views/two_fa_security/two_fa_seurity_mobile_responsive.dart';

import '../../utils/responsive_layout.dart';

import '../../utils/basic_screen_imports.dart';

class TwoFaSecurityScreen extends StatelessWidget {
  const TwoFaSecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: TwoFaSecurityScreenMobile());
  }
}


