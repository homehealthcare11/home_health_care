import '/backend/utils/custom_loading_api.dart';

import '../../../../../custom_assets/assets.gen.dart';
import '../../../../controller/auth/sign_in/forgot_password_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/appbar/back_button.dart';
import '../../../../widgets/text_labels/title_heading5_widget.dart';

class ForgotPasswordScreenMobile extends StatelessWidget {
  ForgotPasswordScreenMobile({
    super.key,
  });

  final ForgotPasswordController controller =
      Get.put(ForgotPasswordController());
  final forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  //body method all the widget listed here
  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.paddingSize, right: Dimensions.paddingSize),
      child: Column(
        mainAxisAlignment: mainStart,
        crossAxisAlignment: crossStart,
        children: [
          verticalSpace(Dimensions.heightSize * 3),
          BackButtonWidget(
            onTap: () {
              Get.back();
            },
          ),
          _forgetPasswordTextWidget(context),
          _emailVerificationSubtitleWidget(context),
          _emailInputWidget(context),
          _submitButtonWidget(context),
          _cancelButtonWidget(context),
        ],
      ),
    );
  }

  // forgot password text widget
  _forgetPasswordTextWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.heightSize * 4.5),
      child: TitleHeading1Widget(
        text: Strings.forgotPassword.tr,
        padding: EdgeInsets.only(bottom: Dimensions.heightSize * 0.25),
      ),
    );
  }

  //email verification substring text widget
  _emailVerificationSubtitleWidget(BuildContext context) {
    return TitleHeading4Widget(
      // padding: EdgeInsets.only(left: Dimensions.paddingSize, right: Dimensions.paddingSize),
      text: Strings.forgotPasswordDes.tr,
      fontWeight: FontWeight.w600,
      fontSize: Dimensions.headingTextSize5,
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
              title: Strings.forgotPasswordTwo.tr,
              onPressed: () {
                if (forgotPasswordFormKey.currentState!.validate()) {
                  controller.forgotPasswordProcess(
                    email: controller.emailController.text,
                  );
                }
              },
              borderColor: Theme.of(context).primaryColor,
              buttonColor: Theme.of(context).primaryColor);
    });
  }

  //cancel button
  _cancelButtonWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Container(
        margin: EdgeInsets.only(top: Dimensions.heightSize * 2),
        child: Center(
          child: TitleHeading5Widget(
            text: Strings.cancel.tr,
            color: Get.isDarkMode
                ? CustomColor.primaryDarkTextColor.withOpacity(0.30)
                : CustomColor.primaryLightTextColor.withOpacity(0.30),
          ),
        ),
      ),
    );
  }

  //email address input widget
  _emailInputWidget(BuildContext context) {
    return Form(
      key: forgotPasswordFormKey,
      child: Column(
        children: [
          verticalSpace(Dimensions.heightSize * 2),
          PrimaryTextInputWidget(
            keyboardType: TextInputType.emailAddress,
            icon: Assets.icon.email,
            hintText: Strings.emailAddress.tr,
            controller: controller.emailController,
            borderColor: Get.isDarkMode
                ? CustomColor.primaryDarkTextColor.withOpacity(.15)
                : CustomColor.primaryLightTextColor.withOpacity(.15),
            color: Get.isDarkMode
                ? CustomColor.primaryBGDarkColor
                : CustomColor.primaryBGLightColor,
            paddings: EdgeInsets.symmetric(
                horizontal: Dimensions.marginSizeHorizontal * .5),
          ),
          verticalSpace(Dimensions.heightSize * 2.667),
        ],
      ),
    );
  }
}
