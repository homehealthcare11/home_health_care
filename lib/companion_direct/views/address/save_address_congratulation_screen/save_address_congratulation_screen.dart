
import '../../../views/address/save_address_congratulation_screen/save_address_congratulation_screen_mobile.dart';

import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';

class SaveAddressCongratulationScreen extends StatelessWidget {
  const SaveAddressCongratulationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileScaffold:
      SaveAddressCongratulationScreenMobile(),
    );
  }
}