import '../../../../../views/dashboard/profile/digital_payment/add_card_screen/add_card_screen_mobile.dart';

import '../../../../../utils/basic_screen_imports.dart';
import '../../../../../utils/responsive_layout.dart';

class AddCArdScreen extends StatelessWidget {
  const AddCArdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: AddCArdScreenMobile(),
    );
  }
}