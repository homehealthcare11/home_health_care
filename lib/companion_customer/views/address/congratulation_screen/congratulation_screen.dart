import '/companion_customer/views/address/congratulation_screen/address_congrtulation_mobile.dart';

import '../../../../../companion_customer/utils/responsive_layout.dart';

import '../../../../companion_customer/utils/basic_widget_imports.dart';

class CongratulationScreenAddress extends StatelessWidget {
  const CongratulationScreenAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileScaffold: CongratulationScreenAddressMobileResponsive());
  }
}
