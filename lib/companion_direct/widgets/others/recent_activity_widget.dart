import '../../utils/basic_screen_imports.dart';
import '../text_labels/title_heading5_widget.dart';

class RecentActivitiesWidget extends StatelessWidget {
  const RecentActivitiesWidget(
      {super.key,
      required this.amount,
      required this.title,
      required this.dateText,
      required this.email,
      required this.monthText,
      required this.status,
      required this.color});

  final String title, monthText, dateText, amount, email, status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.paddingSize * 0.3),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius),
          color: CustomColor.whiteColor,
        ),
        padding: EdgeInsets.only(right: Dimensions.paddingSize * 0.15),
        height: Dimensions.heightSize * 6,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(
                  left: Dimensions.marginSizeVertical * 0.10,
                  top: Dimensions.marginSizeVertical * 0.5,
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    TitleHeading4Widget(
                      text: dateText,
                      fontSize: isTablet()
                          ? Dimensions.headingTextSize3
                          : Dimensions.headingTextSize3 * 1.75,
                      fontWeight: FontWeight.w800,
                      color: CustomColor.primaryLightTextColor,
                    ),
                    TitleHeading4Widget(
                      text: monthText,
                      fontSize: isTablet() ? 20 : 10,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.primaryLightTextColor,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: Dimensions.widthSize * .12,
              color: CustomColor.primaryLightTextColor.withOpacity(.15),
              margin: EdgeInsets.only(
                top: Dimensions.marginSizeVertical * .75,
                bottom: Dimensions.marginSizeVertical * .65,
                right: Dimensions.marginSizeHorizontal * .3,
                left: Dimensions.marginSizeHorizontal * .2,
              ),
            ),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: crossStart,
                mainAxisAlignment: mainCenter,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: Dimensions.widthSize * 10,
                        child: TitleHeading3Widget(
                          text: title,
                        ),
                      ),
                      horizontalSpace(Dimensions.paddingSize * .05),
                      FittedBox(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: Dimensions.marginSizeHorizontal * 0.1),
                          decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radius * .25)),
                          child: TitleHeading5Widget(
                            padding: EdgeInsets.only(
                              left: Dimensions.paddingSize * 0.1,
                              right: Dimensions.paddingSize * 0.1,
                            ),
                            text: status,
                            color: CustomColor.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(Dimensions.heightSize * 0.7),
                  CustomTitleHeadingWidget(
                    text: email,
                    style: CustomStyle.darkHeading4TextStyle.copyWith(
                        fontSize: Dimensions.headingTextSize5,
                        fontWeight: FontWeight.w500,
                        color:
                            CustomColor.primaryLightTextColor.withOpacity(.30)),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: TitleHeading4Widget(
                text: amount,
                color: CustomColor.secondaryLightColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
