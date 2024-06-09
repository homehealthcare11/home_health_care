import '/companion_customer/utils/responsive_layout.dart';
import '/companion_customer/views/settings/settings_screen_mobile.dart';
import '../../utils/basic_screen_imports.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: SettingsScreenMobile());
  }
}
