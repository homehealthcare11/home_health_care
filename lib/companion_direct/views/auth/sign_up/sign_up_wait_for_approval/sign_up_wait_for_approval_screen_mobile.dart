import '../../../../../custom_assets/assets.gen.dart';
import '../../../../../companion_customer/routes/routes.dart';
import '../../../../controller/kyc_check_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '/companion_direct/controller/auth/sign_up/sign_up_kyc_verification_controller/sign_up_kyc_verification_controller.dart';
import '/companion_direct/widgets/others/custom_image_widget.dart';

class SignUpWaitForApprovalScreenMobile extends StatelessWidget {
  SignUpWaitForApprovalScreenMobile({Key? key}) : super(key: key);
  final controller = Get.put(SignUpKycVerificationController());
  final kycCheck = Get.put(KycCheckController());

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.welcomeScreen);
        return true;
      },
      child: Scaffold(
        body: _bodyWidget(context),
      ),
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
            _waitForApprovalTitleTextWidget(context),
            _waitForApprovalSubTitleTextWidget(context),
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
        // controller.isFormKyc = true;
        kycCheck.kycCheck = true;
        debugPrint(kycCheck.kycCheck.toString());
        Get.toNamed(Routes.selectProfessionScreen);
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

  //wait for approval text widget
  _waitForApprovalTitleTextWidget(BuildContext context) {
    return TitleHeading1Widget(
      text: Strings.waitForApproval.tr,
      padding: EdgeInsets.only(top: Dimensions.paddingSize),
    );
  }

  //wait for approval subtitle text widget
  _waitForApprovalSubTitleTextWidget(BuildContext context) {
    return TitleHeading3Widget(
      textAlign: TextAlign.center,
      text: Strings.waitForApprovalSubtitle.tr,
      padding: EdgeInsets.only(
          top: Dimensions.paddingSize * 0.33,
          bottom: Dimensions.paddingSize * 0.833),
      fontWeight: FontWeight.w500,
      fontSize: Dimensions.headingTextSize5,
      color: Get.isDarkMode
          ? CustomColor.primaryDarkTextColor.withOpacity(0.30)
          : CustomColor.primaryLightTextColor.withOpacity(0.30),
    );
  }
}
