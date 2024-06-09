import '../../utils/basic_screen_imports.dart';
import '../others/custom_image_widget.dart';

class DrawerTileWidgets extends StatelessWidget {
  const DrawerTileWidgets({
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
            CustomImageWidget(
              path: img,
              height: Dimensions.heightSize * 2.25,
              width: Dimensions.widthSize * 3,
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
