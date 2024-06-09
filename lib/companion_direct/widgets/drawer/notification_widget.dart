
import '../../utils/basic_screen_imports.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget(
      {super.key,

        required this.title,
        required this.dateText,

        required this.transaction,
        required this.monthText});

  final String title, monthText, dateText,transaction;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.paddingSize * 0.3),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
          color: CustomColor.secondaryLightTextColor,
        ),
        padding: EdgeInsets.only(right: Dimensions.paddingSize * 0.2),
        // height: Dimensions.heightSize * 5.3,
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.marginSizeVertical * 0.4,
                    top: Dimensions.marginSizeVertical * 0.5,
                    bottom: Dimensions.marginSizeVertical * 0.4,
                    right: Dimensions.marginSizeVertical * 0.2,
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: mainCenter,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: crossCenter,
                    children: [
                      TitleHeading3Widget(
                        text: dateText,
                        fontSize: Dimensions.headingTextSize1,
                        fontWeight: FontWeight.w600,
                        color: CustomColor.primaryLightTextColor,
                      ),
                      TitleHeading4Widget(
                        text: monthText,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: CustomColor.primaryLightTextColor,
                      ),
                    ],
                  ),
                )),
            Container(
              height: Dimensions.heightSize * 2.8,
              width: 2,
              color: CustomColor.primaryLightTextColor.withOpacity(0.3),
            ),
            horizontalSpace(Dimensions.widthSize),
            Expanded(
              flex: 9,
              child: Column(
                crossAxisAlignment: crossStart,
                mainAxisAlignment: mainCenter,
                children: [
                  TitleHeading1Widget(
                    text: title,
                    fontSize: Dimensions.headingTextSize4 + 1,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.primaryLightTextColor,
                  ),
                  verticalSpace(Dimensions.widthSize * 0.4),
                  TitleHeading2Widget(
                      maxLines: 1,
                      text: transaction,
                      fontSize: Dimensions.headingTextSize5,
                      fontWeight: FontWeight.w500,
                      color:
                      CustomColor.primaryLightTextColor.withOpacity(0.5)),
                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}