import '../../../../../backend/utils/custom_loading_api.dart';
import '../../../../../backend/utils/custom_snackbar.dart';
import '../../../../../custom_assets/assets.gen.dart';
import '../../../../controller/drawer/drawer_menu_controller/change_password_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/appbar/custom_app_bar.dart';
import '../../../../widgets/inputs/password_input_widget.dart';

class ChangePasswordScreenMobile extends StatelessWidget {
  ChangePasswordScreenMobile({Key? key}) : super(key: key);
  final controller = Get.put(ChangePasswordController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.changePassword.tr,
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
        child: Form(
          key: formKey,
          child: Column(
            children: [
              _textInputWidget(context, controller.oldPasswordController,
                  Strings.oldPassword.tr, Strings.oldPassword.tr),
              _textInputWidget(context, controller.newPasswordController,
                  Strings.newPassword.tr, Strings.password.tr),
              _textInputWidget(context, controller.confirmPasswordController,
                  Strings.confirmPassword.tr, Strings.password.tr),
              verticalSpace(Dimensions.heightSize * 3.33),
              _changePasswordButtonWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  //password input field
  _textInputWidget(BuildContext context, TextEditingController controller,
      String text, String hintText) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          TitleHeading3Widget(
            text: text,
            fontWeight: FontWeight.w500,
            color: CustomColor.blackColor,
            padding: EdgeInsets.only(top: Dimensions.paddingSize * 0.667),
          ),
          verticalSpace(Dimensions.heightSize * 0.667),
          PasswordInputWidget(
            hintText: hintText,
            icon: Assets.icon.password,
            controller: controller,
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

  _changePasswordButtonWidget(BuildContext context) {
    return Obx(() => controller.isLoading
        ? const CustomLoadingAPI()
        : PrimaryButton(
            title: Strings.changePassword.tr,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                controller.resetPasswordPrecess().then((value) =>
                    CustomSnackBar.success(
                        Strings.successfullyUpdatedPassword.tr));
              }
            },
            borderColor: Theme.of(context).primaryColor,
            buttonColor: Theme.of(context).primaryColor,
          ));
  }
}
