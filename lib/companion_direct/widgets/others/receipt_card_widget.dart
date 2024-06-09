import '../../utils/basic_screen_imports.dart';

class ReceiptCardWidget extends StatelessWidget {
  const ReceiptCardWidget(
      {Key? key,
      required this.babyNumber,
      required this.dayNumber,
      required this.nannyBill,
      required this.charge,
      required this.total})
      : super(key: key);
  final String babyNumber, dayNumber, nannyBill, charge, total;

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
            _textAndDivider(context, Strings.serviceDay.tr, dayNumber),
            _textAndDivider(context, Strings.nannyBill.tr, nannyBill),
            _textAndDivider(context, Strings.charge.tr, charge),
            _textAndDivider(context, Strings.total.tr, total),
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
}
