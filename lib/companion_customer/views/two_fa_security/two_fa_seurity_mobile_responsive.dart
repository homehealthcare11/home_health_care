import '../../controller/two_fa_security/two_fa_security_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/appbar/custom_app_bar.dart';
import '../../widgets/profile/input_field_widget_profile.dart';


class TwoFaSecurityScreenMobile extends StatelessWidget {
  TwoFaSecurityScreenMobile({Key? key}) : super(key: key);
  final controller = Get.put(TwoFaSecurityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.twoFASecurity.tr,
        onTap: () {
          Get.back();
        },
        leadingPadding: EdgeInsets.only(
          left: Dimensions.paddingSize,
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.paddingSize, right: Dimensions.paddingSize),
        child: Column(
          children: [
            _textInputWidget(context, controller.phoneNumberController,
                Strings.phoneNumber.tr),
            verticalSpace(Dimensions.heightSize * 3.333),
            _enableButtonWidget(context),
          ],
        ),
      ),
    );
  }

  //phone number input field
  _textInputWidget(
      BuildContext context, TextEditingController controller, String text) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          verticalSpace(Dimensions.heightSize * 0.667),
          InputFieldWidgetProfile(
            keyboardTypeC: TextInputType.number,
            controller: controller,
            labelText: Strings.phoneNumber.tr,
            hint: ' 687 1235 935',
          ),
        ],
      ),
    );
  }

// enable button widget
  _enableButtonWidget(BuildContext context) {
    return PrimaryButton(
      title: Strings.enableFaSecurity.tr,
      onPressed: () {
        controller.goToSomeScreen();
      },
      borderColor: Theme.of(context).primaryColor,
      buttonColor: Theme.of(context).primaryColor,
    );
  }
}
