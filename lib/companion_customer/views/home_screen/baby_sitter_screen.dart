

import '/companion_customer/views/home_screen/baby_sitter_mobile_responsive.dart';

import '../../utils/responsive_layout.dart';

import '../../utils/basic_screen_imports.dart';

class BabySitter extends StatelessWidget {
  const BabySitter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: BabySitterMobileResponsive());
  }
}


