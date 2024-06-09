import '../../views/change_password/change_password_mobile_responsive.dart';

import '../../utils/responsive_layout.dart';

import '../../utils/basic_screen_imports.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: ChangePasswordMobileResponsive());
  }
}

