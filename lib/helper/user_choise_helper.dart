import 'package:get_storage/get_storage.dart';

const String userChoiceKey = "userChoiceKey";

class UserChoiceHelper {
  static Future<void> saveUserChoice({required String choice}) async {
    final box = GetStorage();

    await box.write(userChoiceKey, choice);
  }

  static String? getUserChoice() {
    return GetStorage().read(userChoiceKey) ?? 'nanny_CUSTOMER';
  }

  static Future<void> removeUserChoice() async {
    final box = GetStorage();
    await box.remove(userChoiceKey);
  }
}
