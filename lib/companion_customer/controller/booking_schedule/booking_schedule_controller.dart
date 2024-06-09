import 'package:intl/intl.dart';

import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';

class BookingScheduleController extends GetxController {
  RxBool isChecked = false.obs;
  RxBool isCardSelect = false.obs;
  var selectedIndex = 1.obs;
  RxInt selectIndex = RxInt(-1);
  final date = TextEditingController();
  final dateMain = TextEditingController();
  final date2 = TextEditingController();
  final date2Main = TextEditingController();

  void selectItem(int index) {
    selectIndex.value = index;
  }

  String formattedDate = DateFormat('d MMM yyyy').format(DateTime.now());

  bool isItemSelected(int index) {
    return selectIndex.value == index;
  }

  Color getItemColor(int index) {
    return isItemSelected(index) ? Colors.blue : Colors.white;
  }

  goToAddressScreen() {
    Get.toNamed(Routes.serviceRequestScreen);
  }
}
