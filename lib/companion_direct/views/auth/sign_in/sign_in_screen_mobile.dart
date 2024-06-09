import 'package:flutter/gestures.dart';
import '/backend/utils/custom_loading_api.dart';
import '/companion_customer/language/language_controller.dart';

import '../../../../custom_assets/assets.gen.dart';
import '../../../../companion_customer/widgets/logo_widget.dart';
import '../../../controller/auth/sign_in/sign_in_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/inputs/password_input_widget.dart';


class SignInScreenMobile extends StatelessWidget {
  SignInScreenMobile({Key? key}) : super(key: key);

  final controller = Get.put(SignInController());
  final signInformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _bodyWidget(context),
    );
  }

  // here in body widget all the widget are listed
  _bodyWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
      child: ListView(
        children: [
          _appLogoWidget(context),
          _welcomeTextWidget(context),
          _inputAndButtonWidget(context),
          _doNotHaveAnAccount(context),
        ],
      ),
    );
  }

  //app logo widget
  _appLogoWidget(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * .15,
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeVertical * 2,
          vertical: 0.h),
      child: LogoWidget(
        width: MediaQuery.sizeOf(context).width * 0.7,
        height: MediaQuery.sizeOf(context).height * 0.3,
      ),
    );
  }

  //welcome text Widget
  _welcomeTextWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TitleHeading1Widget(
              text: Strings.welcome.tr,
              color: Get.isDarkMode
                  ? CustomColor.blackColor
                  : CustomColor.secondaryLightColor,
            ),
            horizontalSpace(Dimensions.widthSize * 0.5),
            TitleHeading1Widget(
              text: Strings.back.tr,
              color: Get.isDarkMode
                  ? CustomColor.blackColor
                  : CustomColor.primaryLightColor,
            ),
          ],
        ),
        verticalSpace(Dimensions.heightSize * .5),
        CustomTitleHeadingWidget(
          text: "If you want to get service you can join us by Get Services, or if you want to earn money by providing medical services you can join us by Become a Companion",
          textAlign: TextAlign.start,
          style: Get.isDarkMode
              ? CustomStyle.darkHeading5TextStyle.copyWith(
                  color: CustomColor.primaryLightTextColor.withOpacity(.30),
                  fontWeight: FontWeight.w600)
              : CustomStyle.lightHeading5TextStyle.copyWith(
                  color: CustomColor.primaryLightTextColor.withOpacity(.30),
                  fontWeight: FontWeight.w600),
        ),
        verticalSpace(Dimensions.heightSize * 1.5),
      ],
    );
  }

  //email and password input field  button widgets
  _inputAndButtonWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: .5,
            offset: const Offset(0, 0),
          ),
        ],
        color: CustomColor.whiteColor,
        borderRadius: BorderRadius.circular(Dimensions.radius * 2),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(Dimensions.heightSize * 1.5),
            TitleHeading3Widget(
              text: Strings.signIn.tr,
              color: Get.isDarkMode
                  ? CustomColor.primaryDarkTextColor.withOpacity(.60)
                  : CustomColor.primaryLightTextColor.withOpacity(.60),
            ),
            verticalSpace(Dimensions.heightSize),
            _loginWidget(
              context,
            ),
            _forgotPasswordWidget(context, controller),
            verticalSpace(Dimensions.heightSize * 1.8),
            _buttonWidget(context, controller),
          ],
        ),
      ),
    );
  }

  //login input field widget
  _loginWidget(BuildContext context) {
    return Form(
      key: signInformKey,
      child: Column(
        children: [
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
          verticalSpace(Dimensions.heightSize * 1.33),
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
          verticalSpace(Dimensions.heightSize * .5),
        ],
      ),
    );
  }

  //forgot password button widget
  _forgotPasswordWidget(BuildContext context, SignInController controller) {
    return GestureDetector(
      onTap: () {
        controller.goToForgotPasswordScreen();
      },
      child: Row(
        mainAxisAlignment: mainEnd,
        children: [
          CustomTitleHeadingWidget(
            text: Strings.forgotPassword.tr,
            style: Get.isDarkMode
                ? CustomStyle.darkHeading5TextStyle.copyWith(
                    color: CustomColor.secondaryDarkColor,
                    fontSize: Dimensions.headingTextSize6,
                    fontWeight: FontWeight.w600)
                : CustomStyle.lightHeading5TextStyle.copyWith(
                    color: CustomColor.secondaryLightColor,
                    fontSize: Dimensions.headingTextSize6,
                    fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  //sign in button widget
  _buttonWidget(BuildContext context, SignInController controller) {
    return Column(
      children: [
        Obx(() {
          return controller.isLoading
              ? const CustomLoadingAPI()
              : PrimaryButton(
                  title: Strings.signIn.tr,
                  fontWeight: FontWeight.normal,
                  btnTextColor: Get.isDarkMode
                      ? CustomColor.primaryBGDarkColor
                      : CustomColor.primaryBGLightColor,
                  fontSize: Dimensions.headingTextSize3 * .88,
                  onPressed: () {
                    if (signInformKey.currentState!.validate()) {
                      controller.onSignIn;
                      // controller.goToDashboardScreen();
                    }
                  },
                  borderColor: Get.isDarkMode
                      ? CustomColor.primaryDarkColor
                      : CustomColor.primaryLightColor,
                  buttonColor: Get.isDarkMode
                      ? CustomColor.primaryDarkColor
                      : CustomColor.primaryLightColor,
                );
        }),
        verticalSpace(Dimensions.heightSize * 1.58),
      ],
    );
  }

//don't have an account and sign up button widget
  _doNotHaveAnAccount(BuildContext context) {
    final languageController = Get.put(LanguageController());
    return Center(
      child: Container(
        margin: EdgeInsets.only(
            top: Dimensions.paddingSize * .66, bottom: Dimensions.paddingSize),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: languageController
                    .getTranslation(Strings.donTHaveAnAccount.tr),
                style: Get.isDarkMode
                    ? CustomStyle.darkHeading5TextStyle.copyWith(
                        color:
                            CustomColor.primaryDarkTextColor.withOpacity(.30),
                        fontWeight: FontWeight.w600)
                    : CustomStyle.lightHeading5TextStyle.copyWith(
                        color:
                            CustomColor.primaryLightTextColor.withOpacity(.30),
                        fontWeight: FontWeight.w600),
              ),
              WidgetSpan(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSize * 0.15,
                  ),
                ),
              ),
              TextSpan(
                text: languageController.getTranslation(Strings.signUp.tr),
                style: Get.isDarkMode
                    ? CustomStyle.darkHeading5TextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: CustomColor.primaryDarkColor)
                    : CustomStyle.lightHeading5TextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: CustomColor.primaryLightColor),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    controller.goToSignUpScreen();
                  },
              )
            ],
          ),
        ),
      ),
    );
  }
}
