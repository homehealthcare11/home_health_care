import '../../../../backend/local_storage/local_storage.dart';
import '../../../../backend/utils/custom_snackbar.dart';
import '../../../controller/profile/profile_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/drop_down/country_dropdown_profile_user.dart';
import '../../../widgets/image_picker/user_profile_image_view.dart';
import '../../../widgets/profile/input_field_widget_profile.dart';
import '/backend/utils/custom_loading_api.dart';
import '/companion_customer/language/language_controller.dart';

class UpdateProfileScreenMobile extends StatelessWidget {
  UpdateProfileScreenMobile({Key? key}) : super(key: key);

  final updateProfileFormKey = GlobalKey<FormState>();
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Strings.updateProfile.tr,
          leadingPadding: EdgeInsets.only(left: Dimensions.paddingSize),
          onTap: () {
        Get.offAllNamed(Routes.bottomNavBar);
      }),
      body: Obx(() {
        return controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context);
      }),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.6),
      children: [
        _imageWidget(),
        _inputWidget(context),
        verticalSpace(Dimensions.heightSize * 1.33),
        _buttonWidget(context),
        verticalSpace(Dimensions.heightSize * 1.33),
        _deleteButtonWidget(context),
        verticalSpace(Dimensions.heightSize * 3.33),
      ],
    );
  }

  _imageWidget() {
    return UserImagePickerWidget();
  }

  _inputWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Row(
          children: [
            Expanded(
              child: InputFieldWidgetProfile(
                controller: controller.firstNameController,
                hint: Strings.firstName.tr,
                labelText: Strings.firstName.tr,
              ),
            ),
            horizontalSpace(Dimensions.widthSize),
            Expanded(
              child: InputFieldWidgetProfile(
                controller: controller.lastNameController,
                hint: Strings.lastName.tr,
                labelText: Strings.lastName.tr,
              ),
            ),
          ],
        ),
        verticalSpace(Dimensions.heightSize),
        InputFieldWidgetProfile(
          controller: controller.emailController,
          hint: Strings.emailAddress.tr,
          labelText: Strings.emailAddress.tr,
          readOnly: true,
        ),
        verticalSpace(Dimensions.heightSize * 0.5),
        InputFieldWidgetProfile(
          controller: controller.phoneNumberController,
          labelText: Strings.mobileNumber.tr,
          hint: Strings.mobileNumber.tr,
          keyboardTypeC: TextInputType.number,
        ),
        verticalSpace(Dimensions.heightSize),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: crossStart,
                children: [
                  TitleHeading4Widget(
                    text: Strings.country.tr,
                    fontSize: Dimensions.headingTextSize3,
                    fontWeight: FontWeight.w500,
                  ),
                  verticalSpace(Dimensions.heightSize * 0.2),
                  UserProfileCountryDropDown(prefix: Container()),
                ],
              ),
            ),
            horizontalSpace(Dimensions.widthSize),
            Expanded(
              child: InputFieldWidgetProfile(
                controller: controller.stateController,
                hint: Strings.state.tr,
                labelText: Strings.state.tr,
                keyboardTypeC: TextInputType.text,
              ),
            ),
          ],
        ),
        verticalSpace(Dimensions.heightSize),
        Row(
          children: [
            Expanded(
              child: InputFieldWidgetProfile(
                controller: controller.zipCodeController,
                hint: Strings.zipCode.tr,
                labelText: Strings.zipCode.tr,
                keyboardTypeC: TextInputType.text,
              ),
            ),
            horizontalSpace(Dimensions.widthSize),
            Expanded(
              child: InputFieldWidgetProfile(
                controller: controller.cityController,
                hint: Strings.city,
                labelText: Strings.city.tr,
                keyboardTypeC: TextInputType.text,
              ),
            ),
          ],
        ),
        verticalSpace(Dimensions.heightSize),
        InputFieldWidgetProfile(
          controller: controller.addressController,
          hint: Strings.address.tr,
          labelText: Strings.address.tr,
          keyboardTypeC: TextInputType.text,
        ),
        verticalSpace(Dimensions.heightSize),
      ],
    );
  }

  _buttonWidget(BuildContext context) {
    final languageController = Get.put(LanguageController());
    return Column(
      children: [
        Obx(() {
          return controller.isUpdateLoading
              ? const CustomLoadingAPI()
              : PrimaryButton(
                  title: Strings.updateProfile.tr,
                  onPressed: () {
                    if (controller.imageController.isImagePathSet.value) {
                      controller
                          .profileUpdateWithImageProcess()
                          .then((value) => CustomSnackBar.success(
                              languageController
                                  .getTranslation(Strings.successfulMsg.tr)))
                          .then((value) => controller.getProfileData());
                    } else {
                      controller
                          .profileUpdateWithOutImageProcess()
                          .then(
                            (value) => CustomSnackBar.success(
                              languageController
                                  .getTranslation(Strings.successfulMsg.tr),
                            ),
                          )
                          .then((value) => controller.getProfileData());
                    }
                  },
                  borderColor: Theme.of(context).primaryColor,
                  buttonColor: Theme.of(context).primaryColor,
                );
        }),
      ],
    );
  }

  //delete button
  _deleteButtonWidget(BuildContext context) {
    return PrimaryButton(
      title: Strings.delete.tr,
      onPressed: () {
        _logOutDialogueWidget(context);
      },
      borderColor: CustomColor.deleteButtonColor,
      buttonColor: CustomColor.deleteButtonColor,
    );
  }

  _logOutDialogueWidget(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            alignment: Alignment.center,
            insetPadding: EdgeInsets.all(Dimensions.paddingSize * 0.3),
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Builder(
              builder: (context) {
                var width = MediaQuery.of(context).size.width;
                return Container(
                  width: width * 0.84,
                  margin: EdgeInsets.all(Dimensions.paddingSize * 0.5),
                  padding: EdgeInsets.all(Dimensions.paddingSize * 0.9),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 1.4),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: crossCenter,
                    children: [
                      SizedBox(height: Dimensions.heightSize * 2),
                      TitleHeading2Widget(text: Strings.delete.tr),
                      verticalSpace(Dimensions.heightSize * 2),
                      TitleHeading4Widget(
                          text: Strings.doYouWantToDelateYourAccount.tr),
                      verticalSpace(Dimensions.heightSize * 1.75),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .25,
                              child: PrimaryButton(
                                title: Strings.no.tr,
                                onPressed: () {
                                  Get.back();
                                },
                                borderColor: CustomColor.primaryLightColor,
                                buttonColor: CustomColor.primaryLightColor,
                              ),
                            ),
                          ),
                          horizontalSpace(Dimensions.widthSize * 1.5),
                          Expanded(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .25,
                              child: PrimaryButton(
                                title: Strings.yes.tr,
                                onPressed: () {
                                  controller.deleteProfileData().then((value) =>
                                      CustomSnackBar.success(
                                          Strings.successfullyDeleted.tr));
                                  Get.back();
                                  Get.back();
                                  LocalStorage.logout();
                                  Get.offNamedUntil(
                                      Routes.signInScreenNannyDirect,
                                      (route) => false);
                                },
                                borderColor: CustomColor.deleteButtonColor,
                                buttonColor: CustomColor.deleteButtonColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}
