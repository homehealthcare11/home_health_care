import '/backend/utils/custom_loading_api.dart';
import '/companion_customer/language/language_controller.dart';

import '../../../../controller/auth/sign_up/sign_up_otp_verification_controller/sign_up_otp_verification_controller.dart';
import '../../../../controller/auth/sign_up/sign_up_screen_controller/sign_up_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/appbar/custom_app_bar.dart';
import '../../../../widgets/inputs/sign_up_otp_input_widget.dart';
import '../../../../widgets/text_labels/title_heading5_widget.dart';

class SignUpEmailOtpVerificationScreenMobile extends StatelessWidget {
  SignUpEmailOtpVerificationScreenMobile({
    super.key,
  });

  final signUpEmailOtpFormKey = GlobalKey<FormState>();
  final controller = Get.put(SignUpOtpVerificationController());
  final controllerSignUp = Get.put(NannySignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("",
          leadingPadding: EdgeInsets.only(left: Dimensions.paddingSize),
          onTap: () {
        Get.back();
      }),
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _bodyWidget(context),
    );
  }

  //body widget
  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.paddingSize, right: Dimensions.paddingSize),
      child: ListView(
        children: [
          verticalSpace(Dimensions.heightSize * 3),
          _otpVerificationTextWidget(context),
          _otpVerificationEmailTextWidget(context),
          _otpInputWidget(context),
          _timerWidget(context),
          _submitButtonWidget(context),
          _cancelButtonWidget(context),
        ],
      ),
    );
  }

  //Otp verification text widget
  _otpVerificationTextWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        verticalSpace(Dimensions.heightSize * 6.68),
        TitleHeading1Widget(
          text: Strings.emailVerification.tr,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  //otp input widget
  _otpInputWidget(BuildContext context) {
    return Column(
      children: [
        verticalSpace(Dimensions.heightSize * 2.667),
        SignUpOtpInputWidget(
          controller: controller,
          signUpFormKey: signUpEmailOtpFormKey,
        ),
      ],
    );
  }

  //otp verification subString and user provided email text widget
  _otpVerificationEmailTextWidget(BuildContext context) {
    final languageController = Get.put(LanguageController());
    return TitleHeading4Widget(
      text:
          "${languageController.getTranslation(Strings.enterTheOtpCodeSendTo.tr)}"
          "\n ${controllerSignUp.emailController.text.tr} ",
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode
          ? CustomColor.primaryDarkTextColor
          : CustomColor.primaryLightTextColor.withOpacity(0.3),
    );
  }

  _timerWidget(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.access_time_outlined,
                color: CustomColor.primaryLightColor,
              ),
              verticalSpace(Dimensions.widthSize * 4),
              horizontalSpace(Dimensions.widthSize),
              CustomTitleHeadingWidget(
                text:
                    '0${controller.minuteRemaining.value}:${controller.secondsRemaining.value}',
                style: Get.isDarkMode
                    ? CustomStyle.darkHeading5TextStyle
                    : CustomStyle.lightHeading5TextStyle,
              ),
            ],
          ),
          controller.secondsRemaining.value > 0
              ? SizedBox(
                  height: Dimensions.heightSize * 2.5,
                )
              : _textAndTextButtonWidget(context),
        ],
      ),
    );
  }

  _textAndTextButtonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: Dimensions.heightSize * 6, bottom: Dimensions.heightSize * 2),
      child: Row(
        mainAxisAlignment: mainCenter,
        children: [
          CustomTitleHeadingWidget(
            text: Strings.didNotGetCode.tr,
            style: Get.isDarkMode
                ? CustomStyle.darkHeading5TextStyle.copyWith(
                    color: CustomColor.primaryDarkTextColor,
                    fontSize: Dimensions.headingTextSize4)
                : CustomStyle.lightHeading5TextStyle.copyWith(
                    color: CustomColor.primaryLightTextColor,
                    fontSize: Dimensions.headingTextSize4),
          ),
          horizontalSpace(Dimensions.widthSize),
          InkWell(
            onTap: controller.resendCode,
            child: CustomTitleHeadingWidget(
              text: Strings.resend.tr,
              style: Get.isDarkMode
                  ? CustomStyle.darkHeading5TextStyle.copyWith(
                      color: CustomColor.primaryDarkColor,
                      fontSize: Dimensions.headingTextSize4)
                  : CustomStyle.lightHeading5TextStyle.copyWith(
                      color: CustomColor.primaryLightColor,
                      fontSize: Dimensions.headingTextSize4),
            ),
          ),
        ],
      ),
    );
  }

//submit button
  _submitButtonWidget(BuildContext context) {
    return Column(
      children: [
        verticalSpace(Dimensions.heightSize),
        Obx(() {
          return controller.isLoading
              ? const CustomLoadingAPI()
              : PrimaryButton(
                  title: Strings.submit.tr,
                  onPressed: () {
                    if (signUpEmailOtpFormKey.currentState!.validate()) {
                      if (controller.pinCodeController.text.isNotEmpty) {
                        controller.emailVerificationProcess(
                          code: controller.pinCodeController.text,
                        );
                      }
                    }
                  },
                  borderColor: Theme.of(context).primaryColor,
                  buttonColor: Theme.of(context).primaryColor);
        }),
      ],
    );
  }

  //cancel button
  _cancelButtonWidget(BuildContext context) {
    return Column(
      children: [
        verticalSpace(Dimensions.heightSize * 2),
        Center(
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: TitleHeading5Widget(
              text: Strings.cancel.tr,
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
