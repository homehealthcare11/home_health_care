import '../../utils/responsive_layout.dart';
import '../../views/pet_sitter/service_request_pet_mobile.dart';

import '../../utils/basic_screen_imports.dart';

class ServiceRequestPet extends StatelessWidget {
  const ServiceRequestPet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: ServiceRequestPetMobileResponsive());
  }
}


