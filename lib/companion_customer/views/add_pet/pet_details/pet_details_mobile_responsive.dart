import '../../../../backend/services/api_endpoint.dart';
import '../../../../backend/utils/custom_loading_api.dart';
import '../../../../backend/utils/custom_snackbar.dart';
import '../../../controller/my_baby_and_pets/my_baby_and_pets_controller.dart';
import '../../../controller/update_pet/update_pet_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/appbar/secondary_appbar.dart';
import '../../../widgets/baby_card/baby_foods_input_widget.dart';
import '../../../widgets/profile/input_drop_down.dart';
import '../../../widgets/profile/input_field_widget_profile.dart';
import '../../../widgets/profile/pet_profile_image_widget.dart';

class PetDetailsMobileResponsive extends StatelessWidget {
  PetDetailsMobileResponsive({
    super.key,
  });

  final controller = Get.put(UpdatePetController());
  final myBabyPetController = Get.put(MyBabyAndPetController());
  final int index = Get.arguments;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var data = myBabyPetController.profileModel.data.myPet;
    return Scaffold(
      appBar: SecondaryAppBar(
        isCenter: false,
        data[index].professionTypeDetails.petName,
        subTitle: data[index].professionTypeDetails.petAge,
        onTap: () {
          Get.back();
        },
        leadingPadding: EdgeInsets.only(
          left: Dimensions.paddingSize,
        ),
      ),
      body: Obx(() => controller.babyPetController.isLoading
          ? const CustomLoadingAPI()
          : _bodyWidget(context)),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: Dimensions.paddingSize,
            right: Dimensions.paddingSize,
          ),
          child: Column(
            children: [
              _imageWidget(context),
              _inputWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  // image picker
  _imageWidget(BuildContext context) {
    var data = myBabyPetController.profileModel.data.myPet;
    return PetProfileViewWidget(
      withButton: true,
      img:
          "${ApiEndpoint.mainDomain}/${myBabyPetController.profileModel.data.imagePath}/${data[index].image}",
    );
  }

  _inputWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          verticalSpace(Dimensions.heightSize * 2),
          InputFieldWidgetProfile(
            controller: controller.babyNameController,
            hint: Strings.enterPetName.tr,
            labelText: Strings.petName.tr,
          ),
          verticalSpace(Dimensions.heightSize * 1.33),
          _genderAndAge(context),
          verticalSpace(Dimensions.heightSize * 1.33),
          InputFieldWidgetProfile(
            controller: controller.petBreedController,
            hint: Strings.enterPetBreed.tr,
            labelText: Strings.petBreed.tr,
          ),
          verticalSpace(Dimensions.heightSize * 1.33),
          _ageAndWeight(context),
          verticalSpace(Dimensions.heightSize * 1.33),
          _babyFoods(context),
          verticalSpace(Dimensions.heightSize * 3.33),
          _updateProfileButton(context),
          verticalSpace(Dimensions.heightSize * 1.33),
          _deleteProfileButton(context),
          verticalSpace(Dimensions.heightSize * 3.33),
        ],
      ),
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
                itemsList: controller.gender,
                selectMethod: controller.countryMethod,
                onChanged: (p0) => controller.countryMethod.value = p0!,
              ),
            ],
          ),
        )
      ],
    );
  }

  _selectText(BuildContext context, String text1) {
    return TitleHeading3Widget(
      text: text1,
      fontWeight: FontWeight.w500,
      padding: EdgeInsets.only(bottom: Dimensions.paddingSize * 0.333),
    );
  }

  //baby foods description widget
  _babyFoods(BuildContext context) {
    return InputFieldWidgetProfileBaby(
      controller: controller.babyFoodsController,
      hint: Strings.petFood.tr,
      labelText: Strings.petFood.tr,
    );
  }

// update profile button
  _updateProfileButton(BuildContext context) {
    return Obx(() {
      return controller.isUpdateLoading
          ? const CustomLoadingAPI()
          : PrimaryButton(
              title: Strings.updatePet.tr,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (controller.imageController.isImagePathSet.value) {
                    controller
                        .profileUpdateWithImageProcess()
                        .then((value) => Get.back())
                        .then(
                          (value) =>
                              CustomSnackBar.success(Strings.successfulMsg.tr),
                        )
                        .then(
                          (value) => myBabyPetController.getProfileData(),
                        );
                  } else {
                    controller
                        .profileUpdateWithOutImageProcess()
                        .then((value) => Get.back())
                        .then(
                          (value) =>
                              CustomSnackBar.success(Strings.successfulMsg.tr),
                        )
                        .then(
                          (value) => myBabyPetController.getProfileData(),
                        );
                  }
                }
              },
              borderColor: CustomColor.primaryLightColor,
              buttonColor: CustomColor.primaryLightColor,
            );
    });
  }

  _ageAndWeight(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InputFieldWidgetProfile(
            controller: controller.petAgeController,
            hint: Strings.petAge.tr,
            labelText: Strings.petAge.tr,
          ),
        ),
        horizontalSpace(Dimensions.widthSize * 2),
        Expanded(
          child: InputFieldWidgetProfile(
            controller: controller.petWeightController,
            hint: Strings.petWeight.tr,
            labelText: Strings.petWeight.tr,
          ),
        )
      ],
    );
  }

  _deleteProfileButton(BuildContext context) {
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
            backgroundColor: Colors.transparent,
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
                    color: CustomColor.whiteColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 1.4),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: crossCenter,
                    children: [
                      SizedBox(height: Dimensions.heightSize * 2),
                      TitleHeading2Widget(text: Strings.delete.tr),
                      verticalSpace(Dimensions.heightSize * 1),
                      TitleHeading4Widget(text: Strings.logMessageSignOut.tr),
                      verticalSpace(Dimensions.heightSize * 1),
                      Row(
                        mainAxisAlignment: mainSpaceBet,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .30,
                            child: PrimaryButton(
                              title: Strings.no.tr,
                              onPressed: () {
                                Get.back();
                              },
                              borderColor: CustomColor.primaryLightColor,
                              buttonColor: CustomColor.primaryLightColor,
                            ),
                          ),
                          horizontalSpace(Dimensions.widthSize),
                          Obx(() => controller.isDeleteLoading
                              ? SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .30,
                                  child: const CustomLoadingAPI())
                              : SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .30,
                                  child: PrimaryButton(
                                    title: Strings.yes.tr,
                                    onPressed: () {
                                      controller
                                          .deleteBabyProcess()
                                          .then((value) => Get.offAllNamed(
                                              Routes.myBabyPetsScreen))
                                          .then((value) => myBabyPetController
                                              .getProfileData())
                                          .then((value) =>
                                              CustomSnackBar.success(Strings
                                                  .successfullyDeleted.tr));
                                    },
                                    borderColor: CustomColor.deleteButtonColor,
                                    buttonColor: CustomColor.deleteButtonColor,
                                  ),
                                )),
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
