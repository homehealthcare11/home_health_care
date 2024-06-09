import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import '../../../views/address/add_home/add_home_screen_mobile.dart';

class AddHomeScreen extends StatelessWidget {
  const AddHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: AddHomeScreenMobile(),
    );
  }
}
