import '../../../../../views/dashboard/profile/digital_payment/digital_payment_screen/digital_payment_screen_mobile.dart';

import '../../../../../utils/basic_screen_imports.dart';
import '../../../../../utils/responsive_layout.dart';

class DigitalPaymentScreen extends StatelessWidget {
  const DigitalPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: DigitalPaymentScreenMobile(),
    );
  }
}