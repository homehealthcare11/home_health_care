import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import '../../../views/add_pet/pet_details/pet_details_mobile_responsive.dart';

class PetDetailsScreen extends StatelessWidget {
  const PetDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: PetDetailsMobileResponsive(),
    );
  }
}
