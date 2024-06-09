import '/companion_customer/language/language_controller.dart';

import '../../../../../backend/local_storage/local_storage.dart';
import '../../../../../backend/utils/custom_loading_api.dart';
import '../../../../../backend/utils/custom_snackbar.dart';
import '../../../../../companion_customer/routes/routes.dart';
import '../../../../../companion_customer/utils/basic_screen_imports.dart';
import '../../../../../companion_customer/widgets/profile/input_field_widget_profile.dart';
import '../../../../controller/dashboard/profile_controller/profile_controller.dart';
import '../../../../widgets/appbar/custom_app_bar.dart';
import '../../../../widgets/dropdown/country_dropdown_profile.dart';
import '../../../../widgets/image_picker/profile_image_view.dart';
import '../../../../widgets/inputs/phone_number_input_widget.dart';

class UpdateProfileScreenMobile extends StatelessWidget {
  UpdateProfileScreenMobile({Key? key}) : super(key: key);

  final updateProfileFormKey = GlobalKey<FormState>();
  final controller = Get.put(NannyProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Strings.updateProfile.tr,
          leadingPadding: EdgeInsets.only(left: Dimensions.paddingSize),
          onTap: () {
        Get.back();
      }),
      body: controller.isLoading
          ? const CustomLoadingAPI()
          : _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.6),
      children: [
        _imageWidget(),
        // _titleSubtitle(context),
        _inputWidget(context),
        verticalSpace(Dimensions.heightSize * 3.33),
        _buttonWidget(context),
        verticalSpace(Dimensions.heightSize * 1.33),
        _deleteButtonWidget(context),
        verticalSpace(Dimensions.heightSize * 3.33),
      ],
    );
  }

  _imageWidget() {
    return ImagePickerWidget();
  }

  _inputWidget(BuildContext context) {
    return Form(
      key: updateProfileFormKey,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Row(
            children: [
              Expanded(
                child: InputFieldWidgetProfile(
                  controller: controller.firstNameController,
                  hint: "Ave",
                  labelText: Strings.firstName.tr,
                ),
              ),
              horizontalSpace(Dimensions.widthSize),
              Expanded(
                child: InputFieldWidgetProfile(
                  controller: controller.lastNameController,
                  hint: "Niluan",
                  labelText: Strings.lastName.tr,
                ),
              ),
            ],
          ),
          verticalSpace(Dimensions.heightSize),
          InputFieldWidgetProfile(
            controller: controller.emailController,
            hint: "aveniluan@gmail.com",
            labelText: Strings.emailAddress.tr,
            readOnly: true,
          ),
          verticalSpace(Dimensions.heightSize * 0.5),
          NumberInputWidget(
            controller: controller.phoneController,
            countryCode: controller.phoneCode.toString(),
            label: Strings.mobileNumber.tr,
            hint: Strings.mobileNumber.tr,
            keyBoardType: TextInputType.number,
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
                    ProfileCountryDropDown(
                      prefix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: Dimensions.widthSize * .20,
                            height: Dimensions.heightSize * 1,
                            color: CustomColor.primaryLightTextColor
                                .withOpacity(.15),
                          ),
                          horizontalSpace(Dimensions.widthSize),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              horizontalSpace(Dimensions.widthSize),
              Expanded(
                child: InputFieldWidgetProfile(
                  controller: controller.stateController,
                  hint: Strings.state.tr,
                  labelText: Strings.state.tr,
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
                  hint: Strings.city.tr,
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
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Obx(() {
      return controller.isUpdateLoading
          ? const CustomLoadingAPI()
          : PrimaryButton(
              title: Strings.updateProfile.tr,
              onPressed: () {
                if (controller.imageController.isImagePathSet.value) {
                  controller
                      .profileUpdateWithImageProcess()
                      .then(
                        (value) => CustomSnackBar.success(
                          Get.find<LanguageController>()
                              .getTranslation(Strings.successfulMsg),
                        ),
                      )
                      .then((value) => Get.offAllNamed(Routes.dashboardScreen));
                } else {
                  controller
                      .profileUpdateWithOutImageProcess()
                      .then(
                        (value) => CustomSnackBar.success(
                          Get.find<LanguageController>()
                              .getTranslation(Strings.successfulMsg),
                        ),
                      )
                      .then((value) => Get.offAllNamed(Routes.dashboardScreen));
                }
              },
              borderColor: Theme.of(context).primaryColor,
              buttonColor: Theme.of(context).primaryColor,
            );
    });
  }

  //delete button
  _deleteButtonWidget(BuildContext context) {
    return controller.isDeleteLoading
        ? const CustomLoadingAPI()
        : PrimaryButton(
            title: Strings.delete.tr,
            onPressed: () {
              _logOutDialogueWidget(context);
            },
            borderColor: CustomColor.deleteButtonColor,
            buttonColor: CustomColor.deleteButtonColor,
          );
  }

//delete warning popup
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
