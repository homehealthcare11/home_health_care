import 'package:flutter_svg/flutter_svg.dart';

import '../../../custom_assets/assets.gen.dart';
import '../../utils/basic_widget_imports.dart';
import '/companion_customer/language/language_controller.dart';

class BackButtonWidget extends StatelessWidget {
  BackButtonWidget({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;
  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Obx(() => languageController.isLoading == false
          ? SizedBox(
              height: 28.h,
              width: 28.w,
              child: Transform.rotate(
                angle:
                    languageController.selectedLanguage.value == "ar" ? 3.1 : 0,
                child: SvgPicture.asset(Assets.icon.backward),
              ))
          : SizedBox(
              height: 28.h,
              width: 28.w,
              child: SvgPicture.asset(Assets.icon.settingTwo))),
    );
  }
}
