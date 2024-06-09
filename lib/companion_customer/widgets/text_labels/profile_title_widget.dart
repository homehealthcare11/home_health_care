import '../../language/language_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../others/custom_image_widget.dart';

class ProfileTileWidgets extends StatelessWidget {
  ProfileTileWidgets({
    super.key,
    required this.img,
    required this.title,
    required this.onTap,
  });

  final String img, title;
  final VoidCallback onTap;
  final languageController = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          top: Dimensions.marginSizeVertical * 0.35,
          bottom: Dimensions.marginSizeVertical * 0.10,
        ),
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.heightSize * .75,
            horizontal: Dimensions.widthSize),
        decoration: BoxDecoration(
          color: Get.isDarkMode
              ? CustomColor.secondaryDarkColor
              : CustomColor.secondaryLightColor,
          borderRadius: BorderRadius.circular(Dimensions.radius),
        ),
        child: Row(
          children: [
            CustomImageWidget(
              path: img,
              height: Dimensions.heightSize * 2,
              width: Dimensions.widthSize * 1.8,
              color: CustomColor.primaryLightTextColor,
            ),
            horizontalSpace(Dimensions.widthSize),
            Obx(() => languageController.isLoading
                ? const Text('')
                : Padding(
                    padding: const EdgeInsets.only(bottom: 0.5),
                    child: TitleHeading3Widget(
                      text: languageController.getTranslation(title),
                      color: CustomColor.primaryLightTextColor,
                      fontSize: Dimensions.headingTextSize3 + 1,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
