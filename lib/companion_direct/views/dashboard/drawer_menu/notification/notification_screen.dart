import '../../../../views/dashboard/drawer_menu/notification/notification_screen_mobile.dart';


import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: NotificationScreenMobile(),
    );
  }
}