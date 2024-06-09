import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../companion_customer/controller/sign_up/sign_up_otp_verification/sign_up_otp_verification_controller.dart';
import '../../../../../companion_customer/widgets/text_labels/title_heading5_widget.dart';
import '../../../../language/language_controller.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/appbar/back_button.dart';
import '/backend/utils/custom_loading_api.dart';

class EmailVerificationMobileResponsive extends StatelessWidget {
  EmailVerificationMobileResponsive({
    super.key,
  });

  final formKey = GlobalKey<FormState>();
  final controller = Get.put(SignUpOtpVerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.paddingSize, right: Dimensions.paddingSize),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: mainStart,
          crossAxisAlignment: crossStart,
          children: [
            verticalSpace(Dimensions.heightSize * 3),
            BackButtonWidget(onTap: () {
              Get.back();
            }),
            verticalSpace(Dimensions.heightSize * 6.68),
            TitleHeading1Widget(
              text: Strings.emailVerification.tr,
            ),
            _emailVerificationDesWidget(context),
            verticalSpace(Dimensions.heightSize * 2.667),
            _otpInputWidget(context),
            _timerWidget(context),
            _submitButtonWidget(context),
            verticalSpace(Dimensions.heightSize * 2),
            _cancelButtonWidget(context),
          ],
        ),
      ),
    );
  }

  //otp input widget
  _otpInputWidget(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.89,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: Form(
        key: formKey,
        child: PinCodeTextField(
          appContext: context,
          backgroundColor: Colors.transparent,
          textStyle: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
          pastedTextStyle: TextStyle(
            color: Colors.orange.shade600,
            fontWeight: FontWeight.bold,
          ),
          length: 6,
          obscureText: false,
          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          validator: (String? value) {
            if (value!.isEmpty) {
              return Get.find<LanguageController>()
                  .getTranslation(Strings.pleaseFillOutTheField);
            } else {
              return null;
            }
          },
          pinTheme: PinTheme(
            borderWidth: Dimensions.widthSize * 0.2,
            shape: PinCodeFieldShape.box,
            fieldHeight: isTablet() ? 100 : 52,
            fieldWidth: isTablet() ? 100 : 47,
            activeFillColor: Colors.transparent,
            inactiveColor: CustomColor.primaryLightTextColor.withOpacity(0.15),
            activeColor: Theme.of(context).primaryColor,
            selectedColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          cursorColor: Get.isDarkMode
              ? CustomColor.whiteColor
              : CustomColor.secondaryDarkColor,
          animationDuration: const Duration(milliseconds: 300),
          errorAnimationController: controller.errorController,
          controller: controller.pinCodeController,
          keyboardType: TextInputType.number,
          onCompleted: (v) {},
          onChanged: (value) {
            controller.changeCurrentText(value);
          },
          beforeTextPaste: (text) {
            return true;
          },
        ),
      ),
    );
  }

  _emailVerificationDesWidget(BuildContext context) {
    return TitleHeading4Widget(
      text: Strings.emailVerificationDes.tr,
      fontWeight: FontWeight.w500,
      color: Get.isDarkMode
          ? CustomColor.primaryDarkTextColor
          : CustomColor.primaryLightTextColor.withOpacity(0.3),
    );
  }

//submit button
  _submitButtonWidget(BuildContext context) {
    return Obx(() {
      return controller.isLoading
          ? const CustomLoadingAPI()
          : PrimaryButton(
              title: Strings.submit.tr,
              onPressed: () {
                if (controller.pinCodeController.text.isNotEmpty) {
                  controller.emailVerificationProcess(
                    code: controller.pinCodeController.text,
                  );
                }
              },
              borderColor: Theme.of(context).primaryColor,
              buttonColor: Theme.of(context).primaryColor);
    });
  }

  //cancel button
  _cancelButtonWidget(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Get.offAllNamed(Routes.signInScreen);
        },
        child: TitleHeading5Widget(
          text: Strings.cancel.tr,
          color: Get.isDarkMode
              ? CustomColor.primaryDarkTextColor.withOpacity(0.30)
              : CustomColor.primaryLightTextColor.withOpacity(0.30),
        ),
      ),
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
}
