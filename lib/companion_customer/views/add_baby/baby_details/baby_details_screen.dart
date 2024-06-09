import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import '../../../views/add_baby/baby_details/baby_details_mobile_responsive.dart';

class BabyDetailsScreen extends StatelessWidget {
  const BabyDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: BabyDetailsMobileResponsive(),
    );
  }
}
