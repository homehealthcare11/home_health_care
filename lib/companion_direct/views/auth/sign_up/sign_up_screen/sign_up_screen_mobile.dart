import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import '/companion_direct/widgets/dropdown/country_dropdown.dart';
import '../../../../../companion_customer/views/terms/terms_use_screen.dart';

import '/companion_customer/language/language_controller.dart';
import '/companion_customer/widgets/logo_widget.dart';

import '/backend/utils/custom_loading_api.dart';
import '/backend/utils/custom_snackbar.dart';
import '/companion_direct/controller/auth/sign_up/sign_up_screen_controller/sign_up_controller.dart';
import '../../../../../custom_assets/assets.gen.dart';
import '../../../../utils/basic_screen_imports.dart';

import '../../../../widgets/inputs/check_box_widget.dart';
import '../../../../widgets/inputs/password_input_widget.dart';
import '../../../../widgets/inputs/secondary_text_input_widget.dart';
import '../../../../widgets/others/custom_image_widget.dart';

class SignUpScreenMobile extends StatelessWidget {
  SignUpScreenMobile({Key? key}) : super(key: key);
  final signUpFormKey = GlobalKey<FormState>();
  final controller = Get.put(NannySignUpController());
  final Color inputBorderColor = Get.isDarkMode
      ? CustomColor.primaryDarkTextColor.withOpacity(.15)
      : CustomColor.primaryLightTextColor.withOpacity(.15);

  final Color inputFieldColor = Get.isDarkMode
      ? CustomColor.primaryBGDarkColor
      : CustomColor.primaryBGLightColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSizeHorizontal * .8),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          _appLogoWidget(context),
          verticalSpace(6.h),
          _createAccountTextWidget(context),
          _inputAndButtonWidget(context),
          _existingAccountWidget(context),
        ],
      ),
    );
  }

  //app logo widget
  _appLogoWidget(BuildContext context) {
    return LogoWidget(
      height: MediaQuery.of(context).size.height * .3, width: MediaQuery.sizeOf(context).width,
    );
  }

  //welcome text Widget
  _createAccountTextWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TitleHeading1Widget(
              text: Strings.create.tr,
              color: Get.isDarkMode
                  ? CustomColor.blackColor
                  : CustomColor.secondaryLightColor,
            ),
            horizontalSpace(Dimensions.widthSize * 0.5),
            TitleHeading1Widget(
              text: Strings.account.tr,
              color: Get.isDarkMode
                  ? CustomColor.blackColor
                  : CustomColor.primaryLightColor,
            ),
          ],
        ),
        verticalSpace(Dimensions.heightSize * .5),
        CustomTitleHeadingWidget(
          text: Strings.signUpWelcomeText.tr,
          textAlign: TextAlign.start,
          style: Get.isDarkMode
              ? CustomStyle.darkHeading4TextStyle.copyWith(
                  color: CustomColor.primaryLightTextColor.withOpacity(.30),
                )
              : CustomStyle.lightHeading4TextStyle.copyWith(
                  color: CustomColor.primaryLightTextColor.withOpacity(.30),
                ),
        ),
        verticalSpace(Dimensions.heightSize * 1.5),
      ],
    );
  }

  // input field & button widgets
  _inputAndButtonWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(4, 4),
          ),
        ],
        color: CustomColor.whiteColor,
        borderRadius: BorderRadius.circular(Dimensions.radius * 2),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * .7),
        child: Column(
          mainAxisSize: mainMin,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(Dimensions.heightSize * 1.5),
            TitleHeading2Widget(
              text: Strings.signUp.tr,
              color: Get.isDarkMode
                  ? CustomColor.primaryDarkTextColor.withOpacity(.60)
                  : CustomColor.primaryLightTextColor.withOpacity(.60),
            ),
            verticalSpace(Dimensions.heightSize),
            _loginWidget(
              context,
            ),
            _privacyPolicyWidget(context, controller),
            verticalSpace(Dimensions.heightSize * 1.8),
            _buttonWidget(context, controller),
            verticalSpace(Dimensions.heightSize),
          ],
        ),
      ),
    );
  }

  //login input field widget
  _loginWidget(BuildContext context) {
    return Form(
      key: signUpFormKey,
      child: Column(
        children: [
          Row(
            children: [
              //First name
              Expanded(
                child: SecondaryTextInputWidget(
                  icon: Assets.icon.user,
                  hintText: Strings.firstName.tr,
                  controller: controller.firstNameController,
                  borderColor: inputBorderColor,
                  color: inputFieldColor,
                  paddings: EdgeInsets.symmetric(
                      horizontal: Dimensions.marginSizeHorizontal * .4),
                ),
              ),
              horizontalSpace(Dimensions.widthSize),
              //lastname
              Expanded(
                child: SecondaryTextInputWidget(
                  keyboardType: TextInputType.emailAddress,
                  icon: Assets.icon.user,
                  hintText: Strings.lastName.tr,
                  controller: controller.lastNameController,
                  borderColor: inputBorderColor,
                  color: inputFieldColor,
                  paddings: EdgeInsets.symmetric(
                      horizontal: Dimensions.marginSizeHorizontal * .4),
                ),
              ),
            ],
          ),
          verticalSpace(Dimensions.heightSize * 1.33),
          //Email address
          PrimaryTextInputWidget(
            keyboardType: TextInputType.emailAddress,
            icon: Assets.icon.email,
            hintText: Strings.emailAddress.tr,
            controller: controller.emailController,
            borderColor: inputBorderColor,
            color: inputFieldColor,
            paddings: EdgeInsets.symmetric(
                horizontal: Dimensions.marginSizeHorizontal * .5),
          ),
          verticalSpace(Dimensions.heightSize * 1.33),
          //phone number
          PrimaryTextInputWidget(
            keyboardType: TextInputType.number,
            icon: Assets.icon.phoneNumber,
            hintText: Strings.phone.tr,
            controller: controller.phoneNumberController,
            borderColor: inputBorderColor,
            color: inputFieldColor,
            paddings: EdgeInsets.symmetric(
                horizontal: Dimensions.marginSizeHorizontal * .5),
          ),
          verticalSpace(Dimensions.heightSize * 1.33),

          CountryDropDown(
            prefix: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.zero,
                  child: CustomImageWidget(
                    path: Assets.icon.country,
                    color: CustomColor.primaryLightTextColor,
                  ),
                ),
                Container(
                    width: Dimensions.widthSize * .20,
                    height: Dimensions.heightSize * 1.4,
                    color: CustomColor.primaryLightTextColor.withOpacity(.15)),
                horizontalSpace(Dimensions.widthSize)
              ],
            ),
            selectMethod: controller.selectedCountry,

            itemsList: controller.country,
            onChanged: (value) {
              controller.selectedCountry.value = value!.name;

              if (kDebugMode) {
                print(controller.selectedCountry.value);
              }
            },
          ),
          verticalSpace(Dimensions.heightSize * 1.33),
          //password
          PasswordInputWidget(
            hintText: Strings.password.tr,
            icon: Assets.icon.password,
            controller: controller.passwordController,
            borderColor: inputBorderColor,
            color: inputFieldColor,
            suffixColor: Get.isDarkMode
                ? CustomColor.primaryDarkTextColor.withOpacity(.30)
                : CustomColor.primaryLightTextColor.withOpacity(.30),
            paddings: EdgeInsets.symmetric(
                horizontal: Dimensions.marginSizeHorizontal * .54),
          ),
          verticalSpace(Dimensions.heightSize * 1.33),
          //new password
          PasswordInputWidget(
            hintText: Strings.confirmPassword.tr,
            icon: Assets.icon.password,
            controller: controller.confirmPasswordController,
            borderColor: inputBorderColor,
            color: inputFieldColor,
            suffixColor: Get.isDarkMode
                ? CustomColor.primaryDarkTextColor.withOpacity(.30)
                : CustomColor.primaryLightTextColor.withOpacity(.30),
            paddings: EdgeInsets.symmetric(
                horizontal: Dimensions.marginSizeHorizontal * .54),
          ),
          verticalSpace(Dimensions.heightSize * .67),
        ],
      ),
    );
  }

  //privacy policy checkbox widget
  _privacyPolicyWidget(BuildContext context, NannySignUpController controller) {
    return FittedBox(
      child: Row(
        crossAxisAlignment: crossStart,
        children: [
          CheckBoxWidget(
            isChecked: controller.isSelected,
            onChecked: (value) {
              controller.isSelected.value = value;
            },
          ),
          horizontalSpace(Dimensions.widthSize * .25),
          CustomTitleHeadingWidget(
            text: Strings.privacyTextOne.tr,
            style: Get.isDarkMode
                ? CustomStyle.darkHeading6TextStyle.copyWith(
                    color: CustomColor.primaryDarkTextColor.withOpacity(.30),
                    letterSpacing: .01,
                    wordSpacing: .01)
                : CustomStyle.lightHeading6TextStyle.copyWith(
                    color: CustomColor.primaryLightTextColor.withOpacity(.30),
                    letterSpacing: .01,
                    wordSpacing: .01),
          ),
          horizontalSpace(Dimensions.widthSize * 0.5),
          GestureDetector(
            onTap: (){
              Get.to(TermsAndConditionScreen());
            },
            child: CustomTitleHeadingWidget(
              text: Strings.termsOfUsePrivacyPolicyWarning.tr,
              style: Get.isDarkMode
                  ? CustomStyle.darkHeading6TextStyle.copyWith(
                      color: CustomColor.secondaryDarkColor,
                      fontSize: Dimensions.headingTextSize6,
                      letterSpacing: .01,
                      wordSpacing: .01)
                  : CustomStyle.lightHeading6TextStyle.copyWith(
                      color: CustomColor.secondaryLightColor,
                      fontSize: Dimensions.headingTextSize6,
                      letterSpacing: .01,
                      wordSpacing: .01),
            ),
          ),
        ],
      ),
    );
  }

//sign up button widget
  _buttonWidget(BuildContext context, NannySignUpController controller) {
    return Obx(() {
      return controller.isLoading
          ? const CustomLoadingAPI()
          : PrimaryButton(
              title: Strings.signUp.tr,
              btnTextColor: Get.isDarkMode
                  ? CustomColor.primaryBGDarkColor
                  : CustomColor.primaryBGLightColor,
              fontSize: Dimensions.headingTextSize3 * .88,
              onPressed: () {
                if (controller.isSelected.value == false) {
                  if (signUpFormKey.currentState!.validate()) {
                    controller.signUpProcess(
                      firstName: controller.firstNameController.text,
                      mobile: controller.phoneNumberController.text,
                      countryDirect: controller.selectCountry.toString(),
                      lastName: controller.lastNameController.text,
                      email: controller.emailController.text,
                      password: controller.passwordController.text,
                    );
                  }
                } else {
                  CustomSnackBar.error(Get.find<LanguageController>().getTranslation(Strings.termsCheck));
                }
              },
              borderColor: Get.isDarkMode
                  ? CustomColor.primaryDarkColor
                  : CustomColor.primaryLightColor,
              buttonColor: Get.isDarkMode
                  ? CustomColor.primaryDarkColor
                  : CustomColor.primaryLightColor,
            );
    });
  }

  _existingAccountWidget(BuildContext context) {
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
                    .getTranslation(Strings.alreadyHaveAnAccount.tr),
                style: Get.isDarkMode
                    ? CustomStyle.darkHeading5TextStyle.copyWith(
                        color:
                            CustomColor.primaryDarkTextColor.withOpacity(.30))
                    : CustomStyle.lightHeading5TextStyle.copyWith(
                        color:
                            CustomColor.primaryLightTextColor.withOpacity(.30)),
              ),
              WidgetSpan(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSize * 0.15,
                  ),
                ),
              ),
              TextSpan(
                text: languageController.getTranslation(Strings.signIn.tr),
                style: Get.isDarkMode
                    ? CustomStyle.darkHeading4TextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: CustomColor.primaryDarkColor)
                    : CustomStyle.lightHeading4TextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: CustomColor.primaryLightColor),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    controller.goToSignInScreen();
                  },
              )
            ],
          ),
        ),
      ),
    );
  }
}
