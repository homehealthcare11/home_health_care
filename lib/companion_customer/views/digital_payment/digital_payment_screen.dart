import '../../views/digital_payment/digital_payment_mobile_responsive.dart';

import '../../utils/responsive_layout.dart';

import '../../utils/basic_screen_imports.dart';

class DigitalPaymentScreen extends StatelessWidget {
  const DigitalPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: DigitalPaymentMobileResponsive());
  }
}

