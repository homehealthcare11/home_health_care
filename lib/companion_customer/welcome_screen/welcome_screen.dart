import '../utils/basic_screen_imports.dart';
import '../utils/responsive_layout.dart';
import '../welcome_screen/welcome_screen_mobile.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(mobileScaffold: WelcomeScreenMobile());
  }
}
