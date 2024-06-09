import '../../../../../controller/dashboard/profile_controller/digital_payment_controller.dart';
import '../../../../../utils/basic_screen_imports.dart';
import '../../../../../widgets/appbar/custom_app_bar.dart';
import '../../../../../widgets/inputs/custom_input_widget.dart';

class AddCArdScreenMobile extends StatelessWidget {
  AddCArdScreenMobile({
    super.key,
  });

  final controller = Get.put(DigitalPaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.addCard.tr,
        onTap: () {
          Get.back();
        },
        leadingPadding: EdgeInsets.only(
          left: Dimensions.paddingSize,
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.paddingSize, right: Dimensions.paddingSize),
        child: Column(
          children: [
            _textInputWidget(
                context,
                controller.cardHolderNameController,
                Strings.cardHolderName.tr,
                Strings.enterCardHolderName.tr,
                double.infinity),
            _textInputWidget(
                context,
                controller.cardNumberController,
                Strings.cardNumber.tr,
                Strings.enterCardNumber.tr,
                double.infinity),
            Row(
              children: [
                _textInputWidget(
                    context,
                    controller.expiryDateController,
                    Strings.expiryDate.tr,
                    Strings.mmOrYear.tr,
                    MediaQuery.of(context).size.width * 0.41),
                horizontalSpace(Dimensions.widthSize * 1.6),
                _textInputWidget(
                  context,
                  controller.cvcNumberController,
                  Strings.cvcOrCvv.tr,
                  Strings.enter.tr,
                  MediaQuery.of(context).size.width * 0.41,
                ),
              ],
            ),
            verticalSpace(Dimensions.heightSize * 3.33),
            PrimaryButton(
                title: Strings.addCard.tr,
                onPressed: () {
                  Get.back();
                },
                borderColor: CustomColor.primaryLightColor,
                buttonColor: CustomColor.primaryLightColor)
          ],
        ),
      ),
    );
  }

  //input field
  _textInputWidget(BuildContext context, TextEditingController controller,
      String text, String hintText, double width) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          TitleHeading3Widget(
            text: text,
            fontWeight: FontWeight.w500,
            color: CustomColor.blackColor,
            padding: EdgeInsets.only(top: Dimensions.paddingSize * 0.667),
          ),
          verticalSpace(Dimensions.heightSize * 0.667),
          CustomInputWidget(
            controller: controller,
            hintText: hintText,
            borderColor: CustomColor.blackColor.withOpacity(0.15),
            paddings: EdgeInsets.only(left: Dimensions.paddingSize),
            color: Colors.transparent,
            // width: MediaQuery.of(context).size.width * 0,
          ),
        ],
      ),
    );
  }
}