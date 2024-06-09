

import '../../../../companion_customer/utils/basic_screen_imports.dart';
import '../../../../companion_customer/utils/responsive_layout.dart';
import 'money_out_preview_mobile.dart';

class MoneyOutPreviewScreen extends StatelessWidget {
  const MoneyOutPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: MoneyOutPreviewMobileScreenLayout(),
    );
  }
}
