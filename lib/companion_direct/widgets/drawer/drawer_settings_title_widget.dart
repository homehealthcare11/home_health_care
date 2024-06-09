import '../../utils/basic_screen_imports.dart';
import '../others/custom_image_widget.dart';

class DrawerSettingsTileWidgets extends StatelessWidget {
  const DrawerSettingsTileWidgets({
    super.key,
    required this.img,
    required this.title,
    required this.onTap,
  });

  final String img, title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          left: Dimensions.marginSizeHorizontal * 1.3,
          right: Dimensions.marginSizeHorizontal * 1.3,
          top: Dimensions.marginSizeVertical * 0.35,
          bottom: Dimensions.marginSizeVertical * 0.35,
        ),
        child: Row(
          children: [
            Container(
              height: Dimensions.heightSize * 2.25,
              width: Dimensions.widthSize * 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(Dimensions.radius * 0.5833333),
                ),
                color: CustomColor.primaryLightTextColor.withOpacity(0.05),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: CustomImageWidget(
                  path: img,
                ),
              ),
            ),
            horizontalSpace(Dimensions.widthSize),
            Padding(
              padding: const EdgeInsets.only(bottom: 0.5),
              child: TitleHeading3Widget(
                text: title,
                color: CustomColor.primaryLightTextColor,
                fontSize: Dimensions.headingTextSize4,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
