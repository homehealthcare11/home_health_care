import '../../../../../companion_direct/widgets/inputs/primary_text_input_widget.dart';
import '../../../../controller/sign_in/forgot_password/forgot_password_controller.dart';
import '../../../../controller/sign_in/sign_in_controller.dart';
import '../../../../custom_assets/assets.gen.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/appbar/back_button.dart';
import '../../../../widgets/text_labels/title_heading5_widget.dart';
import '/backend/utils/custom_loading_api.dart';

class ForgotPasswordScreenMobileResponsive extends StatelessWidget {
  ForgotPasswordScreenMobileResponsive({
    super.key,
  });

  final SignInUserController controller = Get.put(SignInUserController());
  final formKey = GlobalKey<FormState>();
  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.paddingSize, right: Dimensions.paddingSize),
      child: Column(
        mainAxisAlignment: mainStart,
        crossAxisAlignment: crossStart,
        children: [
          verticalSpace(Dimensions.heightSize * 3),
          BackButtonWidget(onTap: () {
            Get.back();
          }),
          verticalSpace(Dimensions.heightSize * 6.68),
          _forgetPasswordTextWidget(context),
          _emailVerificationDesWidget(context),
          verticalSpace(Dimensions.heightSize * 2.667),
          _emailInputWidget(context),
          verticalSpace(Dimensions.heightSize * 2.667),
          _submitButtonWidget(context),
          verticalSpace(Dimensions.heightSize * 2),
          _cancelButtonWidget(context),
        ],
      ),
    );
  }

  // email verification description
  _emailVerificationDesWidget(BuildContext context) {
    return TitleHeading4Widget(
      // padding: EdgeInsets.only(left: Dimensions.paddingSize, right: Dimensions.paddingSize),
      text: Strings.forgotPasswordDes.tr,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode
          ? CustomColor.primaryDarkTextColor
          : CustomColor.primaryLightTextColor.withOpacity(0.3),
    );
  }

//submit button
  _submitButtonWidget(BuildContext context) {
    return Obx(() {
      return forgotPasswordController.isLoading
          ? const CustomLoadingAPI()
          : PrimaryButton(
              title: Strings.forgetPassword.tr,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  forgotPasswordController.forgotPasswordProcess(
                    email: forgotPasswordController.emailController.text,
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
              : CustomColor.primaryLightTextColor.withOpacity(0.30)),
    ));
  }

  //email address
  _emailInputWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: PrimaryTextInputWidget(
        keyboardType: TextInputType.emailAddress,
        icon: Assets.icon.email,
        hintText: Strings.emailAddress.tr,
        controller: forgotPasswordController.emailController,
        borderColor: Get.isDarkMode
            ? CustomColor.primaryDarkTextColor.withOpacity(.15)
            : CustomColor.primaryLightTextColor.withOpacity(.15),
        color: Get.isDarkMode
            ? CustomColor.primaryBGDarkColor
            : CustomColor.primaryBGLightColor,
        paddings: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSizeHorizontal * .5),
      ),
    );
  }

// forgot password text
  _forgetPasswordTextWidget(BuildContext context) {
    return TitleHeading1Widget(
      text: Strings.forgotPassword.tr,
      padding: EdgeInsets.only(bottom: Dimensions.heightSize * 0.25),
    );
  }
}
