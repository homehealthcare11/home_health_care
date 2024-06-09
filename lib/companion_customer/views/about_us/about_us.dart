import '../../utils/basic_screen_imports.dart';
import '/companion_customer/utils/responsive_layout.dart';
import 'about_us_mobile.dart';

class AboutUsScreenUser extends StatelessWidget {
  const AboutUsScreenUser({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: AboutUsUserMobile());
  }
}
