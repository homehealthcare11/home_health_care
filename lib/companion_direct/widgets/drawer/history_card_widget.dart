import '../../utils/basic_screen_imports.dart';
import '../text_labels/title_heading5_widget.dart';

class HistoryCardWidget extends StatelessWidget {
  const HistoryCardWidget({
    Key? key,
    required this.monthText,
    required this.dateText,
    required this.title,
    required this.status,
    required this.email,
    required this.amount,
  }) : super(key: key);

  final String monthText, dateText, title, status, email, amount;

//transaction history card contains date, transaction number, email, money
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.marginSizeVertical * .25),
      decoration: BoxDecoration(
          color: CustomColor.whiteColor,
          borderRadius: BorderRadius.circular(Dimensions.radius * .6)),
      child: SizedBox(
        // height: Dimensions.heightSize * 6,
        child: Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSize * 0.65,
                      horizontal: Dimensions.paddingSize * 0.55),
                  child: Column(
                    children: [
                      TitleHeading1Widget(
                        text: dateText.tr,
                        fontWeight: FontWeight.w600,
                        color: CustomColor.primaryLightTextColor,
                      ),
                      TitleHeading4Widget(
                        text: monthText.tr,
                        fontWeight: FontWeight.w500,
                        color: CustomColor.primaryLightTextColor,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: Dimensions.heightSize * 3.8,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CustomColor.primaryLightTextColor.withOpacity(.30),
                      width: 1,
                    ),
                  ),
                ),
                horizontalSpace(Dimensions.paddingSize * 0.625),
                Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    Row(
                      children: [
                        TitleHeading1Widget(
                          text: title.tr,
                          fontSize: Dimensions.headingTextSize3,
                          color: CustomColor.primaryLightTextColor,
                        ),
                        horizontalSpace(Dimensions.widthSize * 0.33),
                        Container(
                            decoration: BoxDecoration(
                              color: status == Strings.complete
                                  ? CustomColor.greenColor
                                  : status == Strings.pending
                                  ? CustomColor.secondaryLightColor
                                  : CustomColor.redColor,
                              borderRadius:
                              BorderRadius.circular(Dimensions.radius * 0.2),
                            ),
                            child: TitleHeading1Widget(
                              padding:
                              EdgeInsets.all(Dimensions.paddingSize * 0.08),
                              text: status.tr,
                              color: CustomColor.primaryBGLightColor,
                              fontSize: Dimensions.headingTextSize6 * 0.847,
                            )),
                      ],
                    ),
                    TitleHeading5Widget(
                      text: email.tr,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.primaryLightTextColor.withOpacity(.50),
                      padding:
                      EdgeInsets.only(top: Dimensions.paddingSize * 0.35),
                    ),
                    horizontalSpace(Dimensions.widthSize * 1.8),
                  ],
                ),



              ],
            ),
            TitleHeading4Widget(
              padding: EdgeInsets.only(right: Dimensions.widthSize * 1.6),
              text: amount.tr,
              fontWeight: FontWeight.w600,
              color: CustomColor.secondaryLightColor,
            ),

          ],
        ),
      ),
    );
  }
}