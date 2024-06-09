import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../views/service_cart/service_cart_mobile_responsive.dart';

class ServiceCartScreen extends StatelessWidget {
  const ServiceCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: ServiceCartMobileResponsive(),
    );
  }
}
