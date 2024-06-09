import 'package:flutter/gestures.dart';

import '../../../../backend/utils/custom_loading_api.dart';
import '../../../../companion_direct/utils/basic_screen_imports.dart';
import '../../../../companion_direct/widgets/inputs/password_input_widget.dart';
import '../../../controller/sign_in/sign_in_controller.dart';
import '../../../custom_assets/assets.gen.dart';
import '../../../widgets/custom_clipper/custom_clipper.dart';
import '/companion_customer/language/language_controller.dart';
import '/companion_customer/widgets/logo_widget.dart';

class SignInScreenMobileResponsive extends StatelessWidget {
  SignInScreenMobileResponsive({Key? key}) : super(key: key);

  final controller = Get.put(SignInUserController());
  final formKey = GlobalKey<FormState>();
  final forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          _appLogoWidget(context),
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.paddingSize,
                right: Dimensions.paddingSize,
                top: Dimensions.paddingSize),
            child: Column(
              children: [
                _welcomeTextWidget(context),
                _inputAndButtonWidget(context),
                _doNotHaveAnAccount(context),
              ],
            ),
          )
        ],
      ),
    );
  }

//app logo
  _appLogoWidget(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Stack(
      children: [
        isTablet()
            ? Stack(
      children: [
        CustomClipPath(),
        Container(
          height: MediaQuery.of(context).size.height * .55,
          color: Colors.white.withOpacity(0.6),
        ),
        Center(
          child: LogoWidget(
            height: MediaQuery.sizeOf(context).height * 0.44,
            width: MediaQuery.sizeOf(context).width * 0.8,
          ),
        ),
      ],
    )
            :   Stack(
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
        Center(
          child: LogoWidget(
            height: 230.h,
            width: 208.w,
          ),
        ),
      ],
    );
  }

//welcome text of sign in
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
            horizontalSpace(Dimensions.widthSize),
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
          // text: Strings.signInWelcomeText.tr,
          text: "If you want to get service you can join us by Get Services, or if you want to earn money by providing medical services you can join us by Become a Companion",
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

  //input field

  _inputAndButtonWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 1,
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
            TitleHeading2Widget(
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
            verticalSpace(Dimensions.heightSize),
          ],
        ),
      ),
    );
  }

// login input field
  _loginWidget(BuildContext context) {
    return Form(
      key: formKey,
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
          verticalSpace(Dimensions.heightSize),
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
          verticalSpace(Dimensions.heightSize * 0.5)
        ],
      ),
    );
  }

// forgot password button
  _forgotPasswordWidget(BuildContext context, SignInUserController controller) {
    return GestureDetector(
      onTap: () {
        controller.gotoForgotPasswordScreen();
      },
      child: Row(
        mainAxisAlignment: mainEnd,
        children: [
          CustomTitleHeadingWidget(
            text: Strings.forgotPassword.tr,
            style: Get.isDarkMode
                ? CustomStyle.darkHeading5TextStyle
                    .copyWith(color: CustomColor.secondaryDarkColor)
                : CustomStyle.lightHeading5TextStyle
                    .copyWith(color: CustomColor.secondaryLightColor),
          ),
        ],
      ),
    );
  }

//sign in button
  _buttonWidget(BuildContext context, SignInUserController controller) {
    return Obx(() {
      return controller.isLoading
          ? const CustomLoadingAPI()
          : PrimaryButton(
              title: Strings.signIn.tr,
              buttonTextColor: CustomColor.primaryLightColor,
              fontSize: Dimensions.headingTextSize3 * .88,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  controller.signInProcess(
                    email: controller.emailController.text,
                    password: controller.passwordController.text,
                  );
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

//don't have account text and sign up button
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
                    .getTranslation(Strings.haveNotAccount.tr),
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
                text: languageController.getTranslation(Strings.signUp.tr),
                style: Get.isDarkMode
                    ? CustomStyle.darkHeading4TextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: CustomColor.primaryDarkColor)
                    : CustomStyle.lightHeading4TextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: CustomColor.primaryLightColor),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    controller.gotoSignUpScreen();
                  },
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.transparent;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(103.4, -109.4);
    path_1.lineTo(364.20000000000005, -181.7);
    path_1.cubicTo(460.50000000000006, -208.39999999999998, 560.3000000000001,
        -151.89999999999998, 587, -55.599999999999994);
    path_1.lineTo(600.5, -6.8999999999999915);
    path_1.cubicTo(627.2, 89.4, 570.7, 189.2, 474.4, 215.90000000000003);
    path_1.lineTo(213.59999999999997, 288.20000000000005);
    path_1.cubicTo(117.3, 314.9, 17.5, 258.4, -9.2, 162.1);
    path_1.lineTo(-22.7, 113.39999999999999);
    path_1.cubicTo(-49.4, 17, 7.1, -82.7, 103.4, -109.4);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff64CDCE).withOpacity(0.30);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
