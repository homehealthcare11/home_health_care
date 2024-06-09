import '/companion_customer/language/language_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../backend/utils/custom_loading_api.dart';
import '../../../../companion_customer/utils/basic_screen_imports.dart';
import '../../../../companion_customer/widgets/appbar/custom_app_bar.dart';
import '../../../../companion_customer/widgets/title_subtitle_widget.dart';
import '../../../controller/sign_in/two_fa_verification_controller.dart';

class UserTwoFaVerificationMobileScreenLayout extends StatelessWidget {
  const UserTwoFaVerificationMobileScreenLayout({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final UserTwoFaVerificationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          alwaysShowBackButton: false, Strings.twoFaVerification.tr, onTap: () {
        Get.back();
      }),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: crossCenter,
        children: [
          verticalSpace(Dimensions.heightSize * 2),
          _otpWidget(context),
        ],
      ),
    );
  }

  _buttonWidget(context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.marginSizeVertical,
      ),
      child: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
                title: Strings.submit.tr,
                onPressed: () {
                  controller.onSubmit;
                },
                borderColor: CustomColor.primaryLightColor,
                buttonColor: CustomColor.primaryLightColor,
              ),
      ),
    );
  }

  _otpWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSizeHorizontal * 0.8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius * 4),
          topRight: Radius.circular(Dimensions.radius * 4),
        ),
      ),
      child: Column(
        children: [
          const TitleSubTitleWidget(
            title: Strings.verificationCode,
            subTitle: Strings.enterTheTwoFaVerification,
            isCenterText: true,
          ),
          _otpInputWidget(context),
          _buttonWidget(context),
        ],
      ),
    );
  }

  _otpInputWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimensions.paddingSize * 1.5),
      child: PinCodeTextField(
        appContext: context,
        backgroundColor: Colors.transparent,
        textStyle: Get.isDarkMode
            ? CustomStyle.darkHeading2TextStyle
            : CustomStyle.lightHeading2TextStyle,
        enableActiveFill: true,
        pastedTextStyle: TextStyle(
          color: Colors.orange.shade600,
          fontWeight: FontWeight.bold,
        ),
        length: 6,
        obscureText: false,
        blinkWhenObscuring: true,
        animationType: AnimationType.fade,
        validator: (v) {
          if (v!.length < 3) {
            return Get.find<LanguageController>()
                .getTranslation(Strings.pleaseFillOutTheField);
          } else {
            return null;
          }
        },
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          fieldHeight: 48,
          fieldWidth: 50,
          inactiveColor: Colors.transparent,
          activeColor: Colors.transparent,
          selectedColor: Colors.transparent,
          inactiveFillColor: CustomColor.primaryLightColor,
          activeFillColor: CustomColor.primaryLightColor,
          selectedFillColor: CustomColor.primaryLightColor,
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
        ),
        cursorColor: CustomColor.blackColor,
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
    );
  }
}
