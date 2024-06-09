import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../companion_customer/utils/basic_screen_imports.dart';
import '../../controller/sign_in/otp_verification_sign_in/otp_verification_sign_in_controller.dart';
import '../../language/language_controller.dart';

class SignInOtpInputWidget extends StatelessWidget {
  const SignInOtpInputWidget({
    super.key,
    required this.formKey,
    required this.controller,
  });

  final GlobalKey<FormState> formKey;
  final SignInOtpVerificationController controller;

  @override
  Widget build(BuildContext context) {
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
              : CustomColor.primaryLightTextColor,
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
}
