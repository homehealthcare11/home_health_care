import '../../../views/address/add_home/add_home_mobile_responsive.dart';

import '../../../utils/responsive_layout.dart';

import '../../../utils/basic_screen_imports.dart';

class AddHomeScreen extends StatelessWidget {
  const AddHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: AddHomeMobileResponsive());
  }
}

