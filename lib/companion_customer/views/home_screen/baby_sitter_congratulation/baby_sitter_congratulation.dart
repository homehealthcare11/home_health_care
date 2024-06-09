
import '/companion_customer/views/home_screen/baby_sitter_congratulation/baby_sitter_congratulation_mobile.dart';

import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';

class BabySitterCongratulation extends StatelessWidget {
  const BabySitterCongratulation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileScaffold: BabySitterCongratulationMobile(),
    );
  }
}
