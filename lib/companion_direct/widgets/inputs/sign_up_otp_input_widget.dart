import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../controller/auth/sign_up/sign_up_otp_verification_controller/sign_up_otp_verification_controller.dart';
import '../../utils/basic_screen_imports.dart';

class SignUpOtpInputWidget extends StatelessWidget {
  const SignUpOtpInputWidget({
    super.key,
    required this.signUpFormKey,
    required this.controller,
  });

  final GlobalKey<FormState> signUpFormKey;
  final SignUpOtpVerificationController controller;

  // final Theme.of(context).primaryColor =
  //     Get.isDarkMode ? CustomColor.whiteColor : CustomColor.primaryBGDarkColor;

  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery
          .sizeOf(context)
          .shortestSide >= 650;
    }


    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.89,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: Form(
        key: signUpFormKey,
        child: PinCodeTextField(
          appContext: context,
          backgroundColor: Colors.transparent,
          textStyle: TextStyle(
            color: Theme
                .of(context)
                .primaryColor,
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
              return Strings.pleaseFillOutTheField;
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
            activeColor: Theme
                .of(context)
                .primaryColor,
            selectedColor: Theme
                .of(context)
                .primaryColor,
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          cursorColor: Get.isDarkMode
              ? CustomColor.whiteColor
              : CustomColor.primaryLightTextColor,
          animationDuration: const Duration(milliseconds: 300),
          errorAnimationController: controller.errorController,
          controller: controller.pinCodeController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
}