import '../../../companion_customer/routes/routes.dart';

import '../../utils/basic_screen_imports.dart';

class AddressController extends GetxController {
  final searchTextController = TextEditingController();
  final flatNoTextController = TextEditingController();
  final houseNoTextController = TextEditingController();
  final streetNoTextController = TextEditingController();
  final areaTextController = TextEditingController();
  final cityTextController = TextEditingController();
  final zipCodeTextController = TextEditingController();
  final stateTextController = TextEditingController();

  @override
  void dispose() {
    searchTextController.dispose();
    flatNoTextController.dispose();
    houseNoTextController.dispose();
    streetNoTextController.dispose();
    areaTextController.dispose();
    cityTextController.dispose();
    zipCodeTextController.dispose();
    stateTextController.dispose();

    super.dispose();
  }

  goToAddHomeScreen() {

    Get.toNamed(Routes.nannyAddHomeScreen);
  }

  goToSaveAddressCongratulationScreen() {
    Get.toNamed(Routes.saveAddressCongratulationScreen);
  }

  RxString addressTitle = ''.obs;

  goToSetupLocationMap() {
    Get.toNamed(Routes.setupLocationScreen);
  }
}
