import '../../../../views/dashboard/profile/saved_address/saved_address_screen_mobile.dart';

import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';

class SavedAddressScreen extends StatelessWidget {
  const SavedAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: SavedAddressScreenMobile(),
    );
  }
}