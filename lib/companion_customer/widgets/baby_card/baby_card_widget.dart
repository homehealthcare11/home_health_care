import 'package:iconsax/iconsax.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../utils/basic_screen_imports.dart';
import '/companion_customer/widgets/text_labels/title_heading5_widget.dart';

class BabyCardWidget extends StatelessWidget {
  const BabyCardWidget(
      {Key? key,
      required this.imagePath,
      required this.name,
      required this.age,
      this.borderColor = Colors.transparent,
      this.isIcon = false,
      this.onTap})
      : super(key: key);
  final String imagePath;
  final String name;
  final String age;
  final Color borderColor;
  final bool isIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return SizedBox(
      height: isTablet()
          ? MediaQuery.of(context).size.height * 0.4
          : MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.472,
      child: Stack(
        children: [
          Positioned(
            bottom: -3.h,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.471,
              height: isTablet()
                  ? MediaQuery.of(context).size.height * 0.175
                  : MediaQuery.of(context).size.height * 0.15,
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dimensions.radius),
                  ),
                ),
                surfaceTintColor: CustomColor.whiteColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.marginSizeHorizontal * 1),
                  child: Column(
                    mainAxisAlignment: mainCenter,
                    crossAxisAlignment: crossCenter,
                    children: [
                      verticalSpace(isTablet()
                          ? Dimensions.heightSize * 4.5
                          : Dimensions.heightSize * 3.5),
                      GestureDetector(
                        onTap: onTap,
                        child: Padding(
                          padding: EdgeInsets.all(isTablet()
                              ? Dimensions.paddingSize * 0.05
                              : Dimensions.paddingSize * 0.15),
                          child: Row(
                            mainAxisAlignment: mainCenter,
                            children: [
                              TitleHeading3Widget(
                                text: name,
                                fontWeight: FontWeight.w600,
                              ),
                              horizontalSpace(Dimensions.widthSize * 0.3),
                              Visibility(
                                visible: isIcon,
                                child: Icon(Iconsax.edit,
                                    color: CustomColor.primaryLightColor,
                                    size: 10.h),
                              )
                            ],
                          ),
                        ),
                      ),
                      verticalSpace(
                          isTablet() ? 0 : Dimensions.heightSize * 0.333),
                      TitleHeading5Widget(text: age),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: isTablet() ? 47.5.w : 35.w,
            top: isTablet() ? -1.h : -0.h,
            child: ClipOval(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: imagePath,
                fit: BoxFit.cover,
                height: 85.h,
                width: 85.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
