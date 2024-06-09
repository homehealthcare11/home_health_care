import '../../views/my_baby_pets/my_baby_pets_mobile_screen.dart';

import '../../utils/responsive_layout.dart';

import '../../utils/basic_screen_imports.dart';

class MyPatientsScreen extends StatelessWidget {
  const MyPatientsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: MyPatientsMobileResponsive());
  }
}


