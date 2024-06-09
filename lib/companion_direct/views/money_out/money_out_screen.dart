import '/companion_customer/utils/responsive_layout.dart';

import '../../../companion_customer/utils/basic_screen_imports.dart';
import 'money_out_screen_mobile.dart';

class MoneyOutScreen extends StatelessWidget {
  const MoneyOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: MoneyOutScreenMobile());
  }
}
