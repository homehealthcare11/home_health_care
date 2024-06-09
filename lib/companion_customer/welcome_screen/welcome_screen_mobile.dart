import '/companion_customer/widgets/logo_widget.dart';

import '../../helper/user_choise_helper.dart';

import '../routes/routes.dart';
import '../utils/basic_screen_imports.dart';

class WelcomeScreenMobile extends StatelessWidget {
  const WelcomeScreenMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  // body
  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
              left: Dimensions.paddingSize,
              right: Dimensions.paddingSize,
              top: Dimensions.paddingSize * 4),
          child: Center(
            child: Column(
              children: [
                _imageWidget(context),
                verticalSpace(Dimensions.heightSize * 2),
                _welcomeTextWidget(context),
                verticalSpace(Dimensions.heightSize * 0.33),
                _serviceTextWidget(context),
                verticalSpace(Dimensions.heightSize * 3.33),
                _buttonWidget(context, Strings.getServices.tr, () {
                  UserChoiceHelper.saveUserChoice(choice: 'NANNY_CUSTOMER')
                      .then((value) =>
                          debugPrint(UserChoiceHelper.getUserChoice()));

                  Get.toNamed(Routes.signInScreen);
                }, CustomColor.primaryLightColor),
                verticalSpace(Dimensions.heightSize * 1.33),
                _buttonWidget(context, "Become a Companion", () {
                  UserChoiceHelper.saveUserChoice(choice: 'NANNY_DIRECT');
                  Get.toNamed(Routes.signInScreenNannyDirect);
                }, CustomColor.secondaryLightColor),
                verticalSpace(Dimensions.heightSize * 3.33),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // logo image
  _imageWidget(BuildContext context) {
    return LogoWidget(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.35,
    );
  }

  // welcome text
  _welcomeTextWidget(BuildContext context) {
    return TitleHeading1Widget(text: "Welcome to Health Care");
  }

  //service text widget
  _serviceTextWidget(BuildContext context) {
    return TitleHeading4Widget(
      textAlign: TextAlign.center,
      // text: Strings.serviceText.tr,
      text: "If you want to get service you can join us by Get Services, or if you want to earn money by providing medical services you can join us by Become a Companion",
      color: CustomColor.primaryLightTextColor.withOpacity(0.30),
    );
  }

  // button widget

  _buttonWidget(BuildContext context, String text1, void Function() onPressed,
      Color color) {
    return PrimaryButton(
        title: text1,
        onPressed: onPressed,
        borderColor: color,
        buttonColor: color);
  }
}
