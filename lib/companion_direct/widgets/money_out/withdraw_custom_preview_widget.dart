import '/companion_direct/widgets/money_out/separate_double_text_widget.dart';

import '../../../companion_customer/utils/basic_screen_imports.dart';
import '../../../companion_customer/widgets/text_labels/title_heading5_widget.dart';
import '../../controller/money_out/money_out_controller.dart';
import '../amount_widget.dart';

class WithdrawCustomPreviewWidget extends StatelessWidget {
  WithdrawCustomPreviewWidget({super.key});

  final controller = Get.put(MoneyOutController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _enteredAmountWidget(context),
        _transactionSummaryWidget(context),
      ],
    );
  }

  _enteredAmountWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSizeHorizontal * 3.33,
        vertical: Dimensions.marginSizeVertical * 1.5,
      ),
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
        ),
      ),
      child: Column(
        children: [
          AmountWidget(
            amount: controller.enteredAmount,
            currency: '',
            isPrimaryColor: true,
          ),
          verticalSpace(Dimensions.marginSizeVertical * 0.5),
          TitleHeading4Widget(
            text: Strings.enteredAmount,
            opacity: 0.60,
          )
        ],
      ),
    );
  }

  _transactionSummaryWidget(BuildContext context) {
    final data = controller.moneyOutInsertModel.data.paymentInformations;
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginBetweenInputTitleAndBox,
        bottom: Dimensions.marginSizeVertical,
      ),
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.75),
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius),
        ),
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          TitleHeading5Widget(
            text: Strings.transactionsSummary,
            opacity: 0.60,
          ),
          Container(
            height: 2,
            width: double.infinity,
            margin: EdgeInsets.only(
              top: Dimensions.marginBetweenInputTitleAndBox,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          verticalSpace(Dimensions.marginBetweenInputTitleAndBox * 2),
          SeparateDoubleTextWidget(
            firstText: Strings.enteredAmount,
            secondText: data.requestAmount,
          ),
          SeparateDoubleTextWidget(
            firstText: Strings.feesAndCharge,
            secondText: data.totalCharge,
          ),
          SeparateDoubleTextWidget(
            firstText: Strings.total,
            secondText: data.willGet,
          ),
          SeparateDoubleTextWidget(
            firstText: Strings.payableAmount,
            secondText: data.payable,
          ),
        ],
      ),
    );
  }
}
