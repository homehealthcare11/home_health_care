import '../../../../../custom_assets/assets.gen.dart';
import '../../../../../companion_customer/routes/routes.dart';
import '../../../../controller/auth/sign_in/reset_password_controller/reset_password_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/inputs/password_input_widget.dart';

class ResetPasswordScreenMobile extends StatelessWidget {
  ResetPasswordScreenMobile({Key? key}) : super(key: key);

  final controller = Get.put(ResetPasswordController());
  final resetNewPasswordFormKey = GlobalKey<FormState>();
  final resetConfirmPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.signInScreenNannyDirect);
        return true;
      },
      child: Scaffold(
        body: _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(Dimensions.heightSize * 3.5),
          _resetPasswordText(context),
          _inputFieldWidget(context),
        ],
      ),
    );
  }

  _inputFieldWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.paddingSize,
        right: Dimensions.paddingSize,
        top: Dimensions.paddingSize * 1.33,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          _newPasswordTextWidget(context),
          _newPasswordInputWidget(context),
          _confirmPasswordTextWidget(context),
          _confirmPasswordInputWidget(context),
          verticalSpace(Dimensions.paddingSize * 1.25),
          _resetPasswordButtonWidget(context),
        ],
      ),
    );
  }

  //reset password text Widget
  _resetPasswordText(BuildContext context) {
    return TitleHeading2Widget(
      text: Strings.resetPassword.tr,
    );
  }

//new password text widget
  _newPasswordTextWidget(BuildContext context) {
    return TitleHeading3Widget(
      text: Strings.newPassword.tr,
      fontWeight: FontWeight.w500,
      textAlign: TextAlign.start,
      color: Get.isDarkMode
          ? CustomColor.primaryDarkTextColor.withOpacity(.50)
          : CustomColor.primaryLightTextColor.withOpacity(.50),
      padding: EdgeInsets.only(bottom: Dimensions.paddingSize * 0.42),
    );
  }

//new password input widget
  _newPasswordInputWidget(BuildContext context) {
    return Form(
      key: resetNewPasswordFormKey,
      child: Column(
        children: [
          PasswordInputWidget(
            hintText: Strings.password.tr,
            icon: Assets.icon.password,
            controller: controller.passwordController,
            borderColor: Get.isDarkMode
                ? CustomColor.primaryDarkTextColor.withOpacity(.15)
                : CustomColor.primaryLightTextColor.withOpacity(.15),
            color: Get.isDarkMode
                ? CustomColor.primaryBGDarkColor
                : CustomColor.primaryBGLightColor,
            suffixColor: Get.isDarkMode
                ? CustomColor.primaryDarkTextColor.withOpacity(.30)
                : CustomColor.primaryLightTextColor.withOpacity(.30),
            paddings: EdgeInsets.symmetric(
                horizontal: Dimensions.marginSizeHorizontal * .54),
          ),
        ],
      ),
    );
  }

  //confirm password text
  _confirmPasswordTextWidget(BuildContext context) {
    return TitleHeading3Widget(
      text: Strings.confirmPassword.tr,
      fontWeight: FontWeight.w500,
      textAlign: TextAlign.start,
      color: Get.isDarkMode
          ? CustomColor.primaryDarkTextColor.withOpacity(.50)
          : CustomColor.primaryLightTextColor.withOpacity(.50),
      padding: EdgeInsets.only(
          bottom: Dimensions.paddingSize * 0.42,
          top: Dimensions.paddingSize * 0.68),
    );
  }

//confirm password input widget
  _confirmPasswordInputWidget(BuildContext context) {
    return Form(
      key: resetConfirmPasswordFormKey,
      child: Column(
        children: [
          PasswordInputWidget(
            hintText: Strings.password.tr,
            icon: Assets.icon.password,
            controller: controller.confirmPassword,
            borderColor: Get.isDarkMode
                ? CustomColor.primaryDarkTextColor.withOpacity(.15)
                : CustomColor.primaryLightTextColor.withOpacity(.15),
            color: Get.isDarkMode
                ? CustomColor.primaryBGDarkColor
                : CustomColor.primaryBGLightColor,
            suffixColor: Get.isDarkMode
                ? CustomColor.primaryDarkTextColor.withOpacity(.30)
                : CustomColor.primaryLightTextColor.withOpacity(1),
            paddings: EdgeInsets.symmetric(
                horizontal: Dimensions.marginSizeHorizontal * .54),
          ),
        ],
      ),
    );
  }

//reset password button
  _resetPasswordButtonWidget(BuildContext context) {
    return PrimaryButton(
      title: Strings.resetPassword.tr,
      onPressed: () {
        if (resetNewPasswordFormKey.currentState!.validate() &&
            resetConfirmPasswordFormKey.currentState!.validate()) {
          controller.resetPasswordPrecess(
            password: controller.passwordController.text,
            passwordConfirmation: controller.confirmPassword.text,
          );
          // controller.goToCongratulationScreen();
        }
      },
      borderColor: Theme.of(context).primaryColor,
      buttonColor: Theme.of(context).primaryColor,
    );
  }
}
