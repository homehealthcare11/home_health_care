import '/backend/utils/custom_snackbar.dart';
import '/companion_customer/controller/two_fa_verification/two_fa_verification_controller.dart';
import '/companion_customer/utils/basic_screen_imports.dart';
import '/companion_customer/widgets/appbar/custom_app_bar.dart';
import '/companion_customer/widgets/title_subtitle_widget.dart';
import '../../../backend/utils/custom_loading_api.dart';

class TwoFaVerificationMobileScreenLayout extends StatelessWidget {
  TwoFaVerificationMobileScreenLayout({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(TwoFaVerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.twoFaVerification.tr,
        onTap: () {
          Get.back();
        },
        leadingPadding: EdgeInsets.only(
          left: Dimensions.paddingSize,
        ),
      ),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: mainCenter,
      children: [
        _qrCodeWidget(context),
        _titleSubTitleWidget(context),
        _enableButtonWidget(context),
      ],
    ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.8);
  }

  _enableButtonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.marginSizeVertical),
      child: Obx(
        () => controller.isSubmitLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
                // isLoading: controller.isSubmitLoading,
                title: controller.status.value == 0
                    ? Strings.enable
                    : Strings.disable,
                onPressed: () {
                  controller
                      .twoFaSubmitApiProcess()
                      .then((value) => Get.back())
                      .then(
                        (value) => controller.status.value == 0
                            ? CustomSnackBar.success(Strings.twoFaEnabled.tr)
                            : CustomSnackBar.error(Strings.twoFaDisabled.tr),
                      );
                },
                borderColor: CustomColor.primaryLightColor,
                buttonColor: CustomColor.primaryLightColor,
              ),
      ),
    );
  }

  _titleSubTitleWidget(BuildContext context) {
    return TitleSubTitleWidget(
      title: Strings.enableFaSecurity.tr,
      subTitle: controller.alert.value,
      isCenterText: true,
      subTitleFontSize: Dimensions.headingTextSize4 * 0.9,
    );
  }

  _qrCodeWidget(BuildContext context) {
    return Image.network(
      controller.qrCode.value,
      scale: 1.2,
    ).paddingOnly(bottom: Dimensions.marginSizeVertical * 0.5);
  }
}
