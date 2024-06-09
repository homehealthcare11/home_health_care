import '../../views/add_baby/add_baby_mobile_responsive.dart';

import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';

class AddBaby extends StatelessWidget {
  const AddBaby({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: AddBabyMobileResponsive(),);
  }
}

