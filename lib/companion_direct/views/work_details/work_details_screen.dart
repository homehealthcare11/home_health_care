
import '../../views/work_details/work_details_screen_mobile.dart';

import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';

class WorkDetailsScreen extends StatelessWidget {
  const WorkDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ResponsiveLayout(
      mobileScaffold: WorkDetailsScreenMobile(),
    );
  }
}