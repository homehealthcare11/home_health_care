import 'package:flutter/foundation.dart';
import 'package:sitterhub/companion_customer/widgets/logo_widget.dart';

import '../../../../backend/utils/custom_loading_api.dart';
import '../../../../backend/utils/custom_snackbar.dart';
import '../../../../companion_direct/widgets/inputs/password_input_widget.dart';
import '../../../../companion_direct/widgets/inputs/primary_text_input_widget.dart';
import '../../../../companion_direct/widgets/inputs/secondary_text_input_widget.dart';
import '../../../controller/sign_up/sign_up_controller.dart';
import '../../../custom_assets/assets.gen.dart';
import '../../../language/language_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/address_drop_down_widget.dart';
import '../../../widgets/checkbox/sign_up_check_box_widget.dart';
import '../../../widgets/custom_clipper/custom_clipper.dart';
import '../../../widgets/others/custom_image_widget.dart';
import '../../../widgets/text_labels/title_heading5_widget.dart';
import '../../terms/terms_use_screen.dart';
import '/companion_customer/widgets/country_drop_down_custom.dart';

class SignupScreenMobileResponsive extends StatelessWidget {
  SignupScreenMobileResponsive({
    super.key,
  });

  final formKey = GlobalKey<FormState>();
  final forgotPasswordFormKey = GlobalKey<FormState>();
  final SignUpController controller = Get.put(SignUpController());

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
      body: Obx(() => controller.isServiceAreaLoading
          ? const CustomLoadingAPI()
          : _bodyWidget(context)),
    );
  }

  _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Stack(
            children: [
              CustomClipPath(),
              Container(
                height: MediaQuery.of(context).size.height * .35,
                color: Colors.white.withOpacity(0.6),
              ),
              Center(
                child: LogoWidget(
                  height: MediaQuery.sizeOf(context).height * 0.33,
                  width: MediaQuery.sizeOf(context).width * 0.6,
                ),
              ),
            ],
          ),
          _welcomeTextWidget(context),
          _inputAndButtonWidget(context),
          verticalSpace(Dimensions.heightSize * 3.33),
          _signInTextAndButtonWidget(context),
        ],
      ),
    );
  }

  //texts of sign up screen
  _welcomeTextWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.paddingSize, right: Dimensions.paddingSize),
      child: Column(
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
              horizontalSpace(Dimensions.widthSize * 0.4),
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
      ),
    );
  }

  //text inputs and button
  _inputAndButtonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.paddingSize, right: Dimensions.paddingSize),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          color: CustomColor.whiteColor,
          borderRadius: BorderRadius.circular(Dimensions.radius * 2),
        ),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.5),
          child: Column(
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
              _signUpInputWidget(
                context,
              ),
              _privacyPolicyWidget(context, controller),
              verticalSpace(Dimensions.heightSize * 2),
              _signUpButtonWidget(context),
              verticalSpace(Dimensions.heightSize),
            ],
          ),
        ),
      ),
    );
  }

  //sign up inputs widget
  _signUpInputWidget(BuildContext context) {
    return Form(
      key: formKey,
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
          AddressDropDown(
            itemsList: controller.serviceArea,
            selectMethod: controller.selectArea,
            onChanged: (p0) {
              controller.selectArea.value = p0!;
            },
            label: Strings.city,
            maxHeight: MediaQuery.sizeOf(context).height * 0.33,
          ),
          verticalSpace(Dimensions.heightSize * 1.33),
          PrimaryTextInputWidget(
            keyboardType: TextInputType.emailAddress,
            icon: Assets.icon.address2,
            hintText: Strings.state.tr,
            controller: controller.stateController,
            borderColor: inputBorderColor,
            color: inputFieldColor,
            paddings: EdgeInsets.symmetric(
                horizontal: Dimensions.marginSizeHorizontal * .5),
          ),
          verticalSpace(Dimensions.heightSize * 1.33),
          PrimaryTextInputWidget(
            keyboardType: TextInputType.emailAddress,
            icon: Assets.icon.address2,
            hintText: Strings.address.tr,
            controller: controller.addressController,
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

  _privacyPolicyWidget(BuildContext context, SignUpController controller) {
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
                ? CustomStyle.darkHeading1TextStyle.copyWith(
                    color: CustomColor.primaryDarkTextColor.withOpacity(.30),
                    letterSpacing: .01,
                    wordSpacing: .01)
                : CustomStyle.lightHeading5TextStyle.copyWith(
                    color: CustomColor.primaryLightTextColor.withOpacity(.30),
                    letterSpacing: .01,
                    wordSpacing: .01,
                  ),
          ),
          horizontalSpace(Dimensions.widthSize * 0.5),
          GestureDetector(
            onTap: () {
              Get.to(TermsAndConditionScreen());
            },
            child: CustomTitleHeadingWidget(
              text: Strings.termsOfUsePrivacyPolicyWarning.tr,
              style: Get.isDarkMode
                  ? CustomStyle.darkHeading1TextStyle.copyWith(
                      color: CustomColor.secondaryDarkColor,
                      fontSize: Dimensions.headingTextSize6,
                      letterSpacing: .01,
                      wordSpacing: .01)
                  : CustomStyle.lightHeading5TextStyle.copyWith(
                      color: CustomColor.secondaryLightColor,
                      fontSize: Dimensions.headingTextSize6,
                      letterSpacing: .01,
                      wordSpacing: .01),
            ).paddingOnly(top: 1.5.h),
          ),
        ],
      ),
    );
  }

  // sign up button
  _signUpButtonWidget(BuildContext context) {
    return Obx(() {
      return controller.isLoading
          ? const CustomLoadingAPI()
          : PrimaryButton(
              title: Strings.signUp.tr,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (controller.isSelected.value == false) {
                    controller.signUpProcess(
                      firstName: controller.firstNameController.text,
                      lastName: controller.lastNameController.text,
                      email: controller.emailController.text,
                      password: controller.passwordController.text,
                      city: controller.selectArea.value,
                      country: controller.selectCountry!,
                      state: controller.stateController.text,
                      address: controller.addressController.text,
                    );
                  } else {
                    CustomSnackBar.error(Get.find<LanguageController>()
                        .getTranslation(Strings.termsCheck));
                  }
                }
              },
              borderColor: CustomColor.primaryLightColor,
              buttonColor: CustomColor.primaryLightColor,
            );
    });
  }

  //text and sign in button
  _signInTextAndButtonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.paddingSize,
        right: Dimensions.paddingSize,
        bottom: Dimensions.paddingSize,
      ),
      child: Row(
        mainAxisAlignment: mainCenter,
        children: [
          TitleHeading5Widget(
            text: Strings.alreadyHaveAnAccount.tr,
            fontWeight: FontWeight.w600,
            color: CustomColor.primaryLightTextColor.withOpacity(0.30),
          ),
          horizontalSpace(Dimensions.widthSize * 0.1),
          InkWell(
              onTap: () {
                controller.gotoSignInScreen();
              },
              child: TitleHeading5Widget(
                text: Strings.signIn.tr,
                fontWeight: FontWeight.w600,
                color: CustomColor.primaryLightColor,
              )),
        ],
      ),
    );
  }
}
