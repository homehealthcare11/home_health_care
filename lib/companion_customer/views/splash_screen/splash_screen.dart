import '../../../companion_customer/utils/basic_screen_imports.dart';
import '../../../companion_customer/utils/responsive_layout.dart';
import '../../../companion_customer/views/splash_screen/splash_screen_mobile_layout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: SplashScreenMobileLayout(),
    );
  }
}
