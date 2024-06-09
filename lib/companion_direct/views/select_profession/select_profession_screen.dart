
import '../../views/select_profession/select_profession_screen_mobile.dart';

import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';

class SelectProfessionScreen extends StatelessWidget {
  const SelectProfessionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const ResponsiveLayout(
      mobileScaffold: SelectProfessionScreenMobile(),
    );
  }
}