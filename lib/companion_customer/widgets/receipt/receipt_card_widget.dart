import '../../utils/basic_screen_imports.dart';

class ReceiptCardWidget extends StatelessWidget {
  const ReceiptCardWidget(
      {Key? key,
      required this.dayDifference,
      required this.totalBill,
      required this.nannyBill,
      required this.charge,
      required this.babyNumber})
      : super(key: key);
  final String dayDifference, totalBill, nannyBill, charge, babyNumber;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: CustomColor.whiteColor,
      child: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.paddingSize * 0.833,
            right: Dimensions.paddingSize * 0.833),
        child: Column(
          children: [
            _textAndDivider(context, Strings.children.tr, babyNumber),
            _textAndDivider(context, Strings.serviceDay.tr, dayDifference),
            _textAndDivider(context, Strings.nannyBill.tr, nannyBill),
            _textAndDivider(context, Strings.charge.tr, charge),
            _textAnd(context, Strings.totalBill.tr, totalBill),
          ],
        ),
      ),
    );
  }

  _textAndDivider(BuildContext context, String text1, String text2) {
    return Column(
      children: [
        verticalSpace(Dimensions.heightSize * 0.667),
        Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            TitleHeading4Widget(
              text: text1,
              fontWeight: FontWeight.w500,
              color: CustomColor.primaryLightTextColor.withOpacity(0.30),
            ),
            TitleHeading4Widget(
              text: text2,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        verticalSpace(Dimensions.heightSize * 0.667),
        Divider(
          color: CustomColor.primaryLightTextColor.withOpacity(.15),
          height: 1.3,
        )
      ],
    );
  }

  _textAnd(BuildContext context, String text1, String text2) {
    return Column(
      children: [
        verticalSpace(Dimensions.heightSize * 0.667),
        Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            TitleHeading4Widget(
              text: text1,
              fontWeight: FontWeight.w500,
              color: CustomColor.primaryLightTextColor.withOpacity(0.30),
            ),
            TitleHeading4Widget(
              text: text2,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        verticalSpace(Dimensions.heightSize * 0.667),
      ],
    );
  }
}
