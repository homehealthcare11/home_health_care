import '../../../../../companion_direct/widgets/inputs/password_input_widget.dart';
import '/backend/utils/custom_loading_api.dart';
import '../../../../controller/sign_in/reset_password_customer/reset_password_controller.dart';
import '../../../../custom_assets/assets.gen.dart';
import '../../../../utils/basic_screen_imports.dart';


class ResetPasswordMobileResponsive extends StatelessWidget {
  ResetPasswordMobileResponsive({
    super.key,
  });

  final ResetPasswordController controller = Get.put(ResetPasswordController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(Dimensions.heightSize * 4.68),
          _resetPasswordText(context),
          _inputFieldWidget(context),
        ],
      ),
    );
  }

//new password text and input field
  // confirm password text and input field

  _inputFieldWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
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
      ),
    );
  }

//new password
  _newPasswordInputWidget(BuildContext context) {
    return PasswordInputWidget(
      hintText: Strings.password.tr,
      icon: Assets.icon.password,
      controller: controller.newPasswordController,
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
    );
  }

//confirm password
  _confirmPasswordInputWidget(BuildContext context) {
    return PasswordInputWidget(
      hintText: Strings.password.tr,
      icon: Assets.icon.password,
      controller: controller.confirmPasswordController,
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
    );
  }

//new password text widget
  _newPasswordTextWidget(BuildContext context) {
    return TitleHeading3Widget(
      text: Strings.newPassword.tr,
      fontWeight: FontWeight.w500,
      textAlign: TextAlign.start,
      padding: EdgeInsets.only(bottom: Dimensions.paddingSize * 0.42),
    );
  }

//confirm password text
  _confirmPasswordTextWidget(BuildContext context) {
    return TitleHeading3Widget(
      text: Strings.confirmPassword.tr,
      fontWeight: FontWeight.w500,
      textAlign: TextAlign.start,
      padding: EdgeInsets.only(
          bottom: Dimensions.paddingSize * 0.42,
          top: Dimensions.paddingSize * 0.68),
    );
  }

//reset password text
  _resetPasswordText(BuildContext context) {
    return TitleHeading2Widget(
      text: Strings.resetPassword.tr,
    );
  }

//reset password button
  _resetPasswordButtonWidget(BuildContext context) {
    return Obx(() {
      return controller.isLoading
          ? const CustomLoadingAPI()
          : PrimaryButton(
              title: Strings.resetPassword.tr,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  controller.resetPasswordPrecess(
                    password: controller.newPasswordController.text,
                    passwordConfirmation:
                        controller.confirmPasswordController.text,
                  );
                }
              },
              borderColor: Theme.of(context).primaryColor,
              buttonColor: Theme.of(context).primaryColor,
            );
    });
  }
}
