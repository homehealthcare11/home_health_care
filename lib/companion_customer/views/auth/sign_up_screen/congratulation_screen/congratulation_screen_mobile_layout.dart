import '../../../../custom_assets/assets.gen.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/others/custom_image_widget.dart';

class CongratulationScreenMobileLayout extends StatelessWidget {
  const CongratulationScreenMobileLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.paddingSize, right: Dimensions.paddingSize),
        child: Column(
          mainAxisAlignment: mainCenter,
          children: [
            CustomImageWidget(
              path: Assets.clipart.congratulations,
              height: MediaQuery.of(context).size.height * 0.24,
              width: MediaQuery.of(context).size.width * 0.52,
            ),
            TitleHeading1Widget(
              text: Strings.congratulation.tr,
              padding: EdgeInsets.only(top: Dimensions.paddingSize),
            ),
            TitleHeading3Widget(
              textAlign: TextAlign.center,
              text: Strings.signUpDes.tr,
              padding: EdgeInsets.only(
                  top: Dimensions.paddingSize * 0.33,
                  bottom: Dimensions.paddingSize * 0.833),
              fontWeight: FontWeight.w500,
              color: Get.isDarkMode
                  ? CustomColor.primaryDarkTextColor.withOpacity(0.30)
                  : CustomColor.primaryLightTextColor.withOpacity(0.30),
            ),
            _okayButtonWidget(context),
          ],
        ),
      ),
    );
  }

  _okayButtonWidget(BuildContext context) {
    return PrimaryButton(
      title: Strings.okay.tr,
      onPressed: () {
        Get.offAllNamed(Routes.bottomNavBar);
      },
      borderColor: Theme.of(context).primaryColor,
      buttonColor: Theme.of(context).primaryColor,
    );
  }
}
