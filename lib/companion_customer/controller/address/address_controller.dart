import '../../routes/routes.dart';
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

  String combinedText() {
    String allAddress =
        '${flatNoTextController.text},${houseNoTextController.text},${streetNoTextController.text},${areaTextController.text},${cityTextController.text},${stateTextController.text},';
    return allAddress;
  }

  goToAddHomeScreen() {
    Get.toNamed(Routes.addHomeScreen);
  }

  RxString addressTitle = ''.obs;
}
