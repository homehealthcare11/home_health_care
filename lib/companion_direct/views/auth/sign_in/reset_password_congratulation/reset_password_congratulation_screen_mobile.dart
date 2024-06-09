import '../../../../../custom_assets/assets.gen.dart';
import '../../../../../companion_customer/routes/routes.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/others/custom_image_widget.dart';

class ResetPasswordCongratulationScreenMobile extends StatelessWidget {
  const ResetPasswordCongratulationScreenMobile({Key? key}) : super(key: key);

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
        Get.offAllNamed(Routes.signInScreenNannyDirect);
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
    return TitleHeading2Widget(
      text: Strings.congratulation.tr,
      padding: EdgeInsets.only(top: Dimensions.paddingSize),
    );
  }

  //congratulation subtitle text widget
  _congratulationSubTitleTextWidget(BuildContext context) {
    return TitleHeading4Widget(
      textAlign: TextAlign.center,
      text: Strings.successfullyUpdatedPassword.tr,
      padding: EdgeInsets.only(
          top: Dimensions.paddingSize * 0.33,
          bottom: Dimensions.paddingSize * 0.833),
      fontWeight: FontWeight.w600,
      color: Get.isDarkMode
          ? CustomColor.primaryDarkTextColor.withOpacity(0.30)
          : CustomColor.primaryLightTextColor.withOpacity(0.30),
    );
  }
}
