import '../../utils/basic_screen_imports.dart';
import '../others/custom_image_widget.dart';

class ProfileTileWidgets extends StatelessWidget {
  const ProfileTileWidgets({
    super.key,
    required this.img,
    required this.title,
    required this.onTap,
  });

  final String img, title;
  final VoidCallback onTap;

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
              ? CustomColor.secondaryDarkTextColor
              : CustomColor.secondaryLightTextColor,
          borderRadius: BorderRadius.circular(Dimensions.radius),
        ),
        child: Row(
          children: [
            CustomImageWidget(
              path: img,
              height: Dimensions.heightSize * 2,
              width: Dimensions.widthSize * 1.8,
            ),
            horizontalSpace(Dimensions.widthSize),
            Padding(
              padding: const EdgeInsets.only(bottom: 0.5),
              child: TitleHeading3Widget(
                text: title,
                color: CustomColor.primaryLightTextColor,
                fontSize: Dimensions.headingTextSize3 + 1,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}