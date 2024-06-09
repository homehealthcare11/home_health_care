import '/companion_customer/language/language_controller.dart';

import '../../../backend/utils/custom_loading_api.dart';
import '../../../backend/utils/custom_snackbar.dart';
import '../../controller/add_pet/add_pet_controller.dart';
import '../../controller/my_baby_and_pets/my_baby_and_pets_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/appbar/custom_app_bar.dart';
import '../../widgets/baby_card/baby_foods_input_widget.dart';
import '../../widgets/pet_card/pet_picture_upload.dart';
import '../../widgets/profile/input_drop_down.dart';
import '../../widgets/profile/input_field_widget_profile.dart';

class AddPetMobileResponsive extends StatelessWidget {
  AddPetMobileResponsive({
    super.key,
  });

  final formKey = GlobalKey<FormState>();
  final controller = Get.put(AddPetController());
  final myBabyPetController = Get.put(MyBabyAndPetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.addPet.tr,
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
                hint: Strings.exPet.tr,
                labelText: Strings.petName.tr,
              ),
              verticalSpace(Dimensions.heightSize * 1.33),
              _genderAndAge(context),
              verticalSpace(Dimensions.heightSize * 1.33),
              _petBreed(context),
              verticalSpace(Dimensions.heightSize * 1.33),
              _ageAndWeight(context),
              verticalSpace(Dimensions.heightSize * 1.33),
              _babyFoods(context),
              verticalSpace(Dimensions.heightSize * 1.33),
              _imagePickerWidget(context),
              verticalSpace(Dimensions.heightSize * 3.33),
              _addBabyButtonWidget(context),
              verticalSpace(Dimensions.heightSize * 3.33),
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
              _selectText(context, Strings.petType.tr),
              InputDropDown(
                itemsList: controller.petType,
                selectMethod: controller.petMethod,
                onChanged: (p0) => controller.petMethod.value = p0!,
              ),
            ],
          ),
        ),
        horizontalSpace(Dimensions.widthSize * 1.6),
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
      ],
    );
  }

  //baby foods description widget
  _babyFoods(BuildContext context) {
    return InputFieldWidgetProfileBaby(
      controller: controller.babyFoodsController,
      hint: Strings.exPetFood.tr,
      labelText: Strings.petFood.tr,
    );
  }

  _imagePickerWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        _selectText(context, Strings.uploadPetPicture.tr),
        Obx(() => PetPictureUpload(
              title: imgController.isImagePathSet.value
                  ? imgController.imagePath.split("-").last
                  : Strings.uploadPetPicture.tr,
            )),
      ],
    );
  }

  // add baby button
  _addBabyButtonWidget(BuildContext context) {
    return Obx(() => controller.isUpdateLoading
        ? const CustomLoadingAPI()
        : PrimaryButton(
            title: Strings.addPet.tr,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                if (imgController.isImagePathSet.value) {
                  controller
                      .profileUpdateWithImageProcess()
                      .then((value) => myBabyPetController.getProfileData())
                      .then((value) => imgController.clearImagePath())
                      .then((value) => Get.back())
                      .then((value) => myBabyPetController.getProfileData())
                      .then(
                        (value) =>
                            CustomSnackBar.success(Strings.successfulMsg.tr),
                      );
                } else {
                  CustomSnackBar.error(Get.find<LanguageController>()
                      .getTranslation(Strings.uploadImage));
                }
              }
              // Get.back();
            },
            borderColor: CustomColor.primaryLightColor,
            buttonColor: CustomColor.primaryLightColor,
          ));
  }

  _petBreed(BuildContext context) {
    return InputFieldWidgetProfile(
      controller: controller.petBreedController,
      hint: Strings.exPetBreed.tr,
      labelText: Strings.petBreed.tr,
    );
  }

  _ageAndWeight(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InputFieldWidgetProfile(
            controller: controller.petAgeController,
            hint: Strings.exPetAge.tr,
            labelText: Strings.petAge.tr,
          ),
        ),
        horizontalSpace(Dimensions.widthSize * 2),
        Expanded(
          child: InputFieldWidgetProfile(
            controller: controller.petWeightController,
            hint: Strings.exPetWeight.tr,
            labelText: Strings.petWeight.tr,
          ),
        )
      ],
    );
  }
}
