

import '../../../views/address/choose_your_location/choose_your_location_mobile_screen.dart';

import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';


class ChooseYourLocationScreen extends StatelessWidget {
  const ChooseYourLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: ChooseYourLocationMobileScreen());
  }
}


