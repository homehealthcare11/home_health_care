import '/companion_customer/language/language_controller.dart';

import '../../../backend/utils/custom_loading_api.dart';
import '../../../backend/utils/custom_snackbar.dart';
import '../../controller/add_baby/add_baby_controller.dart';
import '../../controller/my_baby_and_pets/my_baby_and_pets_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/appbar/custom_app_bar.dart';
import '../../widgets/baby_card/baby_foods_input_widget.dart';
import '../../widgets/baby_card/baby_picture_upload.dart';
import '../../widgets/profile/input_drop_down.dart';
import '../../widgets/profile/input_field_widget_profile.dart';

class AddBabyMobileResponsive extends StatelessWidget {
  AddBabyMobileResponsive({
    super.key,
  });

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final controller = Get.put(AddBabyController());
  final myBabyPetController = Get.put(MyBabyAndPetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        "Add Patient",
        onTap: () {
          Get.close(1);
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
      child: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.only(
              left: Dimensions.paddingSize, right: Dimensions.paddingSize),
          child: Column(
            children: [
              verticalSpace(Dimensions.heightSize * 2),
              InputFieldWidgetProfile(
                controller: controller.babyNameController,
                hint: Strings.exName.tr,
                labelText: Strings.firstName.tr,
              ),
              verticalSpace(Dimensions.heightSize * 1.33),
              _genderAndAge(context),
              verticalSpace(Dimensions.heightSize * 1.33),
              _babyFoods(context),
              verticalSpace(Dimensions.heightSize * 1.33),
              _imagePickerWidget(context),
              verticalSpace(Dimensions.heightSize * 3.33),
              _addBabyButtonWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  _selectText(BuildContext context, String text1) {
    return TitleHeading3Widget(
      text: text1,
      fontWeight: FontWeight.w500,
      padding: EdgeInsets.only(bottom: Dimensions.paddingSize * 0.333),
    );
  }

  _genderAndAge(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              _selectText(context, Strings.gender.tr),
              InputDropDown(
                itemsList: controller.countryList,
                selectMethod: controller.countryMethod,
                onChanged: (p0) => controller.countryMethod.value = p0!,
              ),
            ],
          ),
        ),
        horizontalSpace(Dimensions.widthSize * 1.6),
        Expanded(
          child: InputFieldWidgetProfile(
            controller: controller.ageController,
            hint: Strings.exAge.tr,
            labelText: Strings.age.tr,
          ),
        )
      ],
    );
  }

  //baby foods description widget
  _babyFoods(BuildContext context) {
    return InputFieldWidgetProfileBaby(
      controller: controller.babyFoodsController,
      hint: Strings.enterBabyFoodList.tr,
      labelText: "Patient Food:",
    );
  }

  _imagePickerWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        _selectText(context, "Upload Patient Picture"),
        Obx(() => BabyPictureUpload(
              title: imgController.isImagePathSet.value
                  ? imgController.imagePath.split("-").last
                  : "Upload Patient Picture",
            )),
      ],
    );
  }

  // add baby button
  _addBabyButtonWidget(BuildContext context) {
    return Obx(() {
      return controller.isUpdateLoading
          ? const CustomLoadingAPI()
          : PrimaryButton(
              title: "Add Patient",
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (imgController.isImagePathSet.value) {
                    controller
                        .profileUpdateWithImageProcess()
                        .then((value) => myBabyPetController.getProfileData())
                        .then(
                          (value) => imgController.clearImagePath(),
                        )
                        .then((value) => controller.goToBabyDetailsScreen())
                        .then((value) =>
                            CustomSnackBar.success(Strings.successfulMsg.tr));
                  } else {
                    CustomSnackBar.error(Get.find<LanguageController>()
                        .getTranslation(Strings.uploadImage));
                  }
                }
                // controller.goToBabyDetailsScreen();
              },
              borderColor: CustomColor.primaryLightColor,
              buttonColor: CustomColor.primaryLightColor,
            );
    });
  }
}
