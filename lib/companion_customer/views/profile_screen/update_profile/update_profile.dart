import '/companion_customer/views/profile_screen/update_profile/update_profile_screen_mobile.dart';

import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: UpdateProfileScreenMobile(),
    );
  }
}
