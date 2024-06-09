import '../../../../custom_assets/assets.gen.dart';
import '../../../../companion_customer/routes/routes.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/others/custom_image_widget.dart';
import '../../../widgets/text_labels/title_heading5_widget.dart';

class SaveAddressCongratulationScreenMobile extends StatelessWidget {
  const SaveAddressCongratulationScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  // body : List of widget
  _bodyWidget(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.paddingSize, right: Dimensions.paddingSize),
        child: Column(
          // crossAxisAlignment: crossCenter,
          mainAxisAlignment: mainCenter,
          children: [
            _congratulationImageWidget(context),
            _congratulationTitleTextWidget(context),
            _congratulationSubTitleTextWidget(context),
            _okayButtonWidget(context),
            _addMoreAddressWidget(context),
          ],
        ),
      ),
    );
  }

  //okay button
  _okayButtonWidget(BuildContext context) {
    return PrimaryButton(
      title: Strings.okay.tr,
      onPressed: () {
        Get.toNamed(Routes.dashboardScreen);
      },
      borderColor: Theme.of(context).primaryColor,
      buttonColor: Theme.of(context).primaryColor,
      // shape: RoundedRectangleBorder(borderRadius: ),
    );
  }

  //congratulation image widget
  _congratulationImageWidget(BuildContext context) {
    return CustomImageWidget(
      path: Assets.clipart.congratulations,
      height: MediaQuery.of(context).size.height * 0.24,
      width: MediaQuery.of(context).size.width * 0.52,
    );
  }

  //congratulation text widget
  _congratulationTitleTextWidget(BuildContext context) {
    return TitleHeading1Widget(
      text: Strings.congratulation.tr,
      padding: EdgeInsets.only(top: Dimensions.paddingSize),
    );
  }

  //congratulation subtitle text widget
  _congratulationSubTitleTextWidget(BuildContext context) {
    return TitleHeading4Widget(
      textAlign: TextAlign.center,
      text: Strings.informationSaveSuccessText.tr,
      padding: EdgeInsets.only(
          top: Dimensions.paddingSize * 0.33,
          bottom: Dimensions.paddingSize * 0.833),
      fontWeight: FontWeight.w600,
      color: Get.isDarkMode
          ? CustomColor.primaryDarkTextColor.withOpacity(0.30)
          : CustomColor.primaryLightTextColor.withOpacity(0.30),
    );
  }

  _addMoreAddressWidget(BuildContext context) {
    return Column(
      children: [
        verticalSpace(Dimensions.heightSize * 2),
        Center(
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.chooseYourLocationScreen);
            },
            child: TitleHeading5Widget(
              fontWeight: FontWeight.w600,
              text: Strings.addMoreAddress.tr,
              color: Get.isDarkMode
                  ? CustomColor.primaryDarkTextColor.withOpacity(0.30)
                  : CustomColor.primaryLightTextColor.withOpacity(0.30),
            ),
          ),
        ),
      ],
    );
  }
}
