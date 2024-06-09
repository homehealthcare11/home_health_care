import '../../views/add_pet/add_pet_mobile.dart';

import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';

class AddPet extends StatelessWidget {
  const AddPet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: AddPetMobileResponsive(),
    );
  }
}
