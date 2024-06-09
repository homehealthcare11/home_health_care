import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../views/nanny/nanny_screen_mobile_responsive.dart';

class CompanionDetailsScreen extends StatelessWidget {
  const CompanionDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: CompanionDetailsMobileResponsive(),
    );
  }
}
