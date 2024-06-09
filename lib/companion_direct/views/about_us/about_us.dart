import '../../utils/basic_screen_imports.dart';
import '/companion_customer/utils/responsive_layout.dart';
import '/companion_direct/views/about_us/about_us_mobile.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: AboutUsMobile());
  }
}
