import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/others/custom_image_widget.dart';
import '../../widgets/text_labels/title_heading5_widget.dart';

class FavoriteListWidget extends StatelessWidget {
  const FavoriteListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: CustomColor.whiteColor,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.paddingSize * 0.3,
                  top: Dimensions.paddingSize * 0.375,
                  bottom: Dimensions.paddingSize * 0.375),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.144,
                width: MediaQuery.of(context).size.width * 0.326,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Dimensions.radius),
                    ),
                    image: DecorationImage(
                      image:
                          AssetImage(Assets.baby.daysOfChristmasWidePic.path),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            horizontalSpace(Dimensions.widthSize * 0.5),
            Column(
              crossAxisAlignment: crossStart,
              children: [
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    TitleHeading2Widget(
                      text: "Ave Niluan",
                      fontWeight: FontWeight.w600,
                    ),
                    horizontalSpace(Dimensions.widthSize),
                    Container(
                      height: Dimensions.heightSize * 2.25,
                      decoration: BoxDecoration(
                        color: CustomColor.secondaryLightColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(Dimensions.radius),
                          topLeft: Radius.circular(Dimensions.radius),
                        ),
                      ),
                      child: TitleHeading1Widget(
                        padding: const EdgeInsets.only(
                            left: 9, top: 5, bottom: 5, right: 2),
                        text: '10 USD/hr',
                        fontSize: Dimensions.headingTextSize3,
                        color: CustomColor.whiteColor,
                      ),
                    )
                  ],
                ),
                verticalSpace(Dimensions.heightSize * 0.5),
                SizedBox(
                  width: Dimensions.widthSize * 17.9,
                  child: TitleHeading5Widget(
                    text:
                        "Hi I'm Ave Niluan. I can take care of your baby very will. You can trust me for your child..",
                    maxLines: 3,
                    fontWeight: FontWeight.w500,
                    color: CustomColor.primaryLightTextColor.withOpacity(0.30),
                  ),
                ),
                verticalSpace(Dimensions.heightSize * 0.5),
                Padding(
                  padding: EdgeInsets.only(right: Dimensions.paddingSize * 0.5),
                  child: Row(
                    mainAxisAlignment: mainSpaceBet,
                    children: [
                      _iconAndTextWidget(
                          context, Assets.icon.boldHeart, '1.52K'),
                      horizontalSpace(Dimensions.widthSize),
                      _iconAndTextWidget(
                          context, Assets.icon.experience, '1.78K'),
                      horizontalSpace(Dimensions.widthSize),
                      _iconAndTextWidget(context, Assets.icon.rate, '1.10K'),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _iconAndTextWidget(BuildContext context, String icon, String text) {
    return Row(
      mainAxisAlignment: mainSpaceBet,
      children: [
        CustomImageWidget(path: icon),
        horizontalSpace(Dimensions.widthSize * 0.5),
        TitleHeading5Widget(
            text: text,
            fontWeight: FontWeight.w500,
            color: CustomColor.primaryLightTextColor.withOpacity(0.30))
      ],
    );
  }
}
