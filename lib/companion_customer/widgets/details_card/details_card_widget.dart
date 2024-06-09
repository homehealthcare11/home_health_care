import '../../controller/nanny_details/nanny_details_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/others/custom_image_widget.dart';

class DetailsCardWidget extends StatelessWidget {
  DetailsCardWidget({Key? key}) : super(key: key);
  final controller = Get.put(NannyDetailsController());

  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Card(
      surfaceTintColor: CustomColor.whiteColor,
      child: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.paddingSize * 0.5,
            right: Dimensions.paddingSize * 0.5),
        child: SizedBox(
          height: isTablet()
              ? MediaQuery.of(context).size.height * 0.6
              : MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: mainCenter,
            children: [
              CustomImageWidget(
                path: Assets.icon.experience2,
                height: Dimensions.heightSize * 5,
                width: Dimensions.widthSize * 5,
              ),
              verticalSpace(Dimensions.heightSize),
              _textsWidget(context),
              verticalSpace(Dimensions.heightSize),
              _dividerLine(context),
              Row(
                mainAxisAlignment: mainSpaceBet,
                children: [
                  _experienceAndChargeWidget(
                      context,
                      controller.workExperienceController.text,
                      "",
                      Strings.experience.tr,
                      Assets.icon.experience3),
                  _experienceAndChargeWidget(
                      context,
                      "${controller.amountController.text} OMR",
                      controller.chargeTypeController.text.isEmpty
                          ? controller.chargeTypeController.text
                          : "/${controller.chargeTypeController.text}",
                      Strings.charge.tr,
                      Assets.icon.charge),
                ],
              ),
              verticalSpace(Dimensions.heightSize),
              _dividerLine(context),
              _addressDetailsWidget(context),
            ],
          ),
        ),
      ),
    );
  }

//texts of service request
  _textsWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: mainSpaceBet,
      children: [
        _customColumnTextsWidget(
            context,
            controller.totalNumberOfService.toString(),
            Strings.totalService.tr),
        _customColumnTextsWidget(context,
            controller.totalTaskComplete.toString(), Strings.taskComplete.tr),
        _customColumnTextsWidget(
            context,
            "${controller.totalNumberOfService.toInt() - controller.totalTaskComplete.toInt()}",
            Strings.incomplete.tr),
      ],
    );
  }

  //column text
  _customColumnTextsWidget(BuildContext context, String text1, String text2) {
    return Column(
      children: [
        TitleHeading1Widget(
          text: text1,
          fontWeight: FontWeight.w800,
        ),
        TitleHeading4Widget(
          text: text2,
          fontWeight: FontWeight.w500,
          color: CustomColor.primaryLightTextColor.withOpacity(0.30),
        )
      ],
    );
  }

//experience and charge
  _experienceAndChargeWidget(BuildContext context, String text1, String text2,
      String text3, String path) {
    return Row(
      children: [
        CustomImageWidget(
          path: path,
          height: Dimensions.heightSize * 3.715,
          width: 4.458,
        ),
        horizontalSpace(Dimensions.widthSize),
        Column(
          mainAxisAlignment: mainStart,
          crossAxisAlignment: crossStart,
          children: [
            Row(
              children: [
                TitleHeading3Widget(
                  text: text1,
                  fontWeight: FontWeight.w600,
                  fontSize: Dimensions.headingTextSize2 * .75,
                ),
                TitleHeading4Widget(
                  text: text2,
                  fontWeight: FontWeight.w600,
                  fontSize: Dimensions.headingTextSize6,
                  padding:
                      EdgeInsets.only(bottom: Dimensions.paddingSize * 0.3),
                )
              ],
            ),
            TitleHeading4Widget(
              text: text3,
              fontWeight: FontWeight.w500,
              color: CustomColor.primaryLightTextColor.withOpacity(.30),
            ),
          ],
        )
      ],
    );
  }

// divider line
  _dividerLine(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: CustomColor.primaryLightTextColor.withOpacity(0.15),
          thickness: 1.3,
          height: 2,
        ),
        verticalSpace(Dimensions.heightSize),
      ],
    );
  }

  //address details
  _addressDetailsWidget(BuildContext context) {
    return Row(
      children: [
        CustomImageWidget(
          path: Assets.icon.address,
          height: Dimensions.heightSize * 3.71416,
          width: Dimensions.widthSize * 4.457,
        ),
        horizontalSpace(Dimensions.widthSize * 1.243),
        SizedBox(
          width: Dimensions.widthSize * 24,
          child: TitleHeading4Widget(
            text: controller.addressController.text.isEmpty
                ? Strings.addressNotFound.tr
                : controller.addressController.text,
            fontWeight: FontWeight.w500,
            color: CustomColor.primaryLightTextColor.withOpacity(0.30),
          ),
        )
      ],
    );
  }
}
