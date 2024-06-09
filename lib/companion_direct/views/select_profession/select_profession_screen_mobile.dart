import 'package:flutter/foundation.dart';

import '../../../companion_customer/routes/routes.dart';
import '../../../companion_direct/widgets/others/slider_widget_age.dart';
import '../../controller/select_profession_controller/select_profession_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/appbar/custom_app_bar.dart';
import '../../widgets/inputs/choice_widget.dart';
import '../../widgets/inputs/slider_widget_age.dart';
import '/backend/utils/custom_loading_api.dart';

class SelectProfessionScreenMobile extends StatefulWidget {
  const SelectProfessionScreenMobile({Key? key}) : super(key: key);

  @override
  State<SelectProfessionScreenMobile> createState() =>
      _SelectProfessionScreenMobileState();
}

class _SelectProfessionScreenMobileState
    extends State<SelectProfessionScreenMobile> {
  final controller = Get.put(SelectProfessionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.selectProfession.tr,
        leadingPadding: EdgeInsets.only(left: Dimensions.paddingSize),
        onTap: () {
          Get.back();
        },
      ),
      body: Obx(() => controller.isLoading
          ? const CustomLoadingAPI()
          : _bodyWidget(context)),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => ListView(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.widthSize * 2),
          children: [
            _babySitterCardWidget(context),
            _babySitterWidget(),
            //
            _petSitterCardWidget(context),
            _petSitterWidget(context),
            //
            _buttonWidget(context),
          ],
        ),
      ),
    );
  }

  // baby sitter card and button
  _babySitterCardWidget(BuildContext context) {
    return Card(
      child: SizedBox(
        height: Dimensions.heightSize * 4.167,
        child: Padding(
          padding: EdgeInsets.only(
              left: Dimensions.paddingSize * 0.8,
              right: Dimensions.paddingSize * 0.7),
          child: Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              TitleHeading3Widget(
                // text: Strings.babySitter.tr,
                text: "Elderly Care",
                fontWeight: FontWeight.w600,
              ),
              _checkBoxBaby(context)
            ],
          ),
        ),
      ),
    );
  }

  //baby sitter widgets
  _babySitterWidget() {
    return Visibility(
      visible: !controller.isCheckedBaby.value,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          _genderWidget(context),
          _babyAgeRangeWidget(context),
          _numberOfKidWidget(context),
        ],
      ),
    );
  }

  // check box baby
  _checkBoxBaby(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: () {
            controller.isCheckedBaby.value = !controller.isCheckedBaby.value;

            if (!controller.isCheckedBaby.value) {
              controller.isCheckedPet.value = true;
            } else {
              controller.isCheckedPet.value = false;
            }
            if (kDebugMode) {
              print(controller.isCheckedBaby.value);
            }
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(Dimensions.radius * 5),
                ),
                border: Border.all(
                    color: CustomColor.secondaryLightColor, width: 2.0)),
            child: Padding(
              padding: EdgeInsets.all(Dimensions.paddingSize * 0.1),
              child: CircleAvatar(
                radius: Dimensions.radius * 0.7,
                backgroundColor: controller.isCheckedBaby.value
                    ? CustomColor.whiteColor
                    : CustomColor.secondaryLightColor,
              ),
            ),
          ),
        ));
  }

  // pet sitter card and button widget
  _petSitterCardWidget(BuildContext context) {
    return Card(
      child: SizedBox(
        height: Dimensions.heightSize * 4.167,
        child: Padding(
          padding: EdgeInsets.only(
              left: Dimensions.paddingSize * 0.8,
              right: Dimensions.paddingSize * 0.7),
          child: Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              TitleHeading3Widget(
                // text: Strings.petSitter.tr,
                text: "Other Care",
                fontWeight: FontWeight.w600,
              ),
              _checkBoxPet(context)
            ],
          ),
        ),
      ),
    );
  }

  // check box in monthly booking
  _checkBoxPet(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: () {
            controller.isCheckedPet.value = !controller.isCheckedPet.value;
            if (!controller.isCheckedBaby.value) {
              controller.isCheckedBaby.value = true;
            } else {
              controller.isCheckedBaby.value = false;
            }
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(Dimensions.radius * 5),
                ),
                border: Border.all(
                    color: CustomColor.secondaryLightColor, width: 2.0)),
            child: Padding(
              padding: EdgeInsets.all(Dimensions.paddingSize * 0.1),
              child: CircleAvatar(
                radius: Dimensions.radius * 0.7,
                backgroundColor: controller.isCheckedPet.value
                    ? CustomColor.whiteColor
                    : CustomColor.secondaryLightColor,
              ),
            ),
          ),
        ));
  }

  _petSitterWidget(BuildContext context) {
    return Visibility(
      visible: !controller.isCheckedPet.value,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          _patientTypeWidget(context),
          _patientGenderWidget(context),
          _patientAgeRangeWidget(context),
          _numberOfPatientWidget(context),
        ],
      ),
    );
  }

  _genderWidget(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(Dimensions.heightSize),
          TitleHeading3Widget(
            text: Strings.gender.tr,
            fontWeight: FontWeight.w500,
          ),
          verticalSpace(Dimensions.heightSize * .5),
          Wrap(
            children: List.generate(
                controller.babyGender.length,
                (index) => Obx(
                      () => ChoiceWidget(
                        fontSize: Dimensions.headingTextSize3,
                        fontWeight: FontWeight.w500,
                        text: controller.babyGender[index],
                        textColor: Get.isDarkMode
                            ? controller.isBabyGenderSelected.value == index
                                ? CustomColor.secondaryDarkTextColor
                                : CustomColor.primaryDarkTextColor
                                    .withOpacity(.40)

                            //light mode
                            : controller.isBabyGenderSelected.value == index
                                ? CustomColor.secondaryLightTextColor
                                : CustomColor.primaryLightTextColor
                                    .withOpacity(.40),
                        onTap: () {
                          controller.isBabyGenderSelected.value = index;
                        },
                        containerColor: Get.isDarkMode
                            ? controller.isBabyGenderSelected.value == index
                                ? CustomColor.primaryDarkTextColor
                                : CustomColor.transparentColor
                            : controller.isBabyGenderSelected.value == index
                                ? CustomColor.secondaryLightColor
                                : CustomColor
                                    .primaryLightScaffoldBackgroundColor,
                        borderColor: Get.isDarkMode
                            ? controller.isBabyGenderSelected.value == index
                                ? CustomColor.secondaryDarkColor
                                : CustomColor.primaryDarkTextColor
                                    .withOpacity(.15)
                            : controller.isBabyGenderSelected.value == index
                                ? CustomColor.secondaryLightColor
                                : CustomColor.primaryDarkTextColor
                                    .withOpacity(.15),
                      ),
                    )),
          )
        ],
      ),
    );
  }

  _babyAgeRangeWidget(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(Dimensions.heightSize),
          TitleHeading3Widget(
            text: Strings.age.tr,
            fontWeight: FontWeight.w500,
          ),
          SliderWidgetAge(
            sliderPointerValue: controller.sliderValueAge.toDouble(),
            dataRanges: controller.age,
          ),
          verticalSpace(Dimensions.heightSize * .5),
        ],
      ),
    );
  }

  _numberOfKidWidget(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(Dimensions.heightSize),
          TitleHeading3Widget(
            text: Strings.numberOfKid.tr,
            fontWeight: FontWeight.w500,
          ),
          verticalSpace(Dimensions.heightSize * .5),
          Wrap(
            children: List.generate(
                controller.numberOfKid.length,
                (index) => Obx(
                      () => ChoiceWidget(
                        fontSize: Dimensions.headingTextSize3,
                        fontWeight: FontWeight.w500,
                        text: controller.numberOfKid[index],
                        textColor: Get.isDarkMode
                            ? controller.isNumberOfKidSelected.value == index
                                ? CustomColor.secondaryDarkTextColor
                                : CustomColor.primaryDarkTextColor
                                    .withOpacity(.40)

                            //light mode
                            : controller.isNumberOfKidSelected.value == index
                                ? CustomColor.secondaryLightTextColor
                                : CustomColor.primaryLightTextColor
                                    .withOpacity(.40),
                        onTap: () {
                          controller.isNumberOfKidSelected.value = index;
                        },
                        containerColor: Get.isDarkMode
                            ? controller.isNumberOfKidSelected.value == index
                                ? CustomColor.primaryDarkTextColor
                                : CustomColor.transparentColor
                            : controller.isNumberOfKidSelected.value == index
                                ? CustomColor.secondaryLightColor
                                : CustomColor
                                    .primaryLightScaffoldBackgroundColor,
                        borderColor: Get.isDarkMode
                            ? controller.isNumberOfKidSelected.value == index
                                ? CustomColor.secondaryDarkColor
                                : CustomColor.primaryDarkTextColor
                                    .withOpacity(.15)
                            : controller.isNumberOfKidSelected.value == index
                                ? CustomColor.secondaryLightColor
                                : CustomColor.primaryDarkTextColor
                                    .withOpacity(.15),
                      ),
                    )),
          )
        ],
      ),
    );
  }

  _patientTypeWidget(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(Dimensions.heightSize),
          TitleHeading3Widget(
            text: "Patient Type",
            fontWeight: FontWeight.w500,
          ),
          verticalSpace(Dimensions.heightSize * .5),
          Wrap(
            children: List.generate(
                controller.patientType.length,
                (index) => Obx(
                      () => ChoiceWidget(
                        fontSize: Dimensions.headingTextSize3,
                        fontWeight: FontWeight.w500,
                        text: controller.patientType[index],
                        textColor: Get.isDarkMode
                            ? controller.isPetTypeSelected.value == index
                                ? CustomColor.secondaryDarkTextColor
                                : CustomColor.primaryDarkTextColor
                                    .withOpacity(.40)

                            //light mode
                            : controller.isPetTypeSelected.value == index
                                ? CustomColor.secondaryLightTextColor
                                : CustomColor.primaryLightTextColor
                                    .withOpacity(.40),
                        onTap: () {
                          controller.isPetTypeSelected.value = index;
                        },
                        containerColor: Get.isDarkMode
                            ? controller.isPetTypeSelected.value == index
                                ? CustomColor.primaryDarkTextColor
                                : CustomColor.transparentColor
                            : controller.isPetTypeSelected.value == index
                                ? CustomColor.secondaryLightColor
                                : CustomColor
                                    .primaryLightScaffoldBackgroundColor,
                        borderColor: Get.isDarkMode
                            ? controller.isPetTypeSelected.value == index
                                ? CustomColor.secondaryDarkColor
                                : CustomColor.primaryDarkTextColor
                                    .withOpacity(.15)
                            : controller.isPetTypeSelected.value == index
                                ? CustomColor.secondaryLightColor
                                : CustomColor.primaryDarkTextColor
                                    .withOpacity(.15),
                      ),
                    )),
          ),
        ],
      ),
    );
  }

  _patientGenderWidget(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(Dimensions.heightSize),
          TitleHeading3Widget(
            text: "Patient Gender",
            fontWeight: FontWeight.w500,
          ),
          verticalSpace(Dimensions.heightSize * .5),
          Wrap(
            children: List.generate(
                controller.patientGender.length,
                (index) => Obx(
                      () => ChoiceWidget(
                        fontSize: Dimensions.headingTextSize3,
                        fontWeight: FontWeight.w500,
                        text: controller.patientGender[index],
                        textColor: Get.isDarkMode
                            ? controller.isPetGenderSelected.value == index
                                ? CustomColor.secondaryDarkTextColor
                                : CustomColor.primaryDarkTextColor
                                    .withOpacity(.40)

                            //light mode
                            : controller.isPetGenderSelected.value == index
                                ? CustomColor.secondaryLightTextColor
                                : CustomColor.primaryLightTextColor
                                    .withOpacity(.40),
                        onTap: () {
                          controller.isPetGenderSelected.value = index;
                        },
                        containerColor: Get.isDarkMode
                            ? controller.isPetGenderSelected.value == index
                                ? CustomColor.primaryDarkTextColor
                                : CustomColor.transparentColor
                            : controller.isPetGenderSelected.value == index
                                ? CustomColor.secondaryLightColor
                                : CustomColor
                                    .primaryLightScaffoldBackgroundColor,
                        borderColor: Get.isDarkMode
                            ? controller.isPetGenderSelected.value == index
                                ? CustomColor.secondaryDarkColor
                                : CustomColor.primaryDarkTextColor
                                    .withOpacity(.15)
                            : controller.isPetGenderSelected.value == index
                                ? CustomColor.secondaryLightColor
                                : CustomColor.primaryDarkTextColor
                                    .withOpacity(.15),
                      ),
                    )),
          )
        ],
      ),
    );
  }

  _patientAgeRangeWidget(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(Dimensions.heightSize),
          TitleHeading3Widget(
            text: "Patient Age",
            fontWeight: FontWeight.w500,
          ),
          SliderAgeWidget(
            sliderPointerValue: controller.sliderValueAge.toDouble(),
            dataRanges: controller.age,
          ),
          verticalSpace(Dimensions.heightSize * .5),
        ],
      ),
    );
  }

  _numberOfPatientWidget(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(Dimensions.heightSize),
          TitleHeading3Widget(
            // text: Strings.numberOfPet.tr,
            text: "Number of Patients",
            fontWeight: FontWeight.w500,
          ),
          verticalSpace(Dimensions.heightSize * .5),
          Wrap(
            children: List.generate(
              controller.numberOfPatient.length,
              (index) => Obx(
                () => ChoiceWidget(
                  fontSize: Dimensions.headingTextSize3,
                  fontWeight: FontWeight.w500,
                  text: controller.numberOfPatient[index],
                  textColor: Get.isDarkMode
                      ? controller.isNumberOfPetSelected.value == index
                          ? CustomColor.secondaryDarkTextColor
                          : CustomColor.primaryDarkTextColor.withOpacity(.40)

                      //light mode
                      : controller.isNumberOfPetSelected.value == index
                          ? CustomColor.secondaryLightTextColor
                          : CustomColor.primaryLightTextColor.withOpacity(.40),
                  onTap: () {
                    controller.isNumberOfPetSelected.value = index;
                  },
                  containerColor: Get.isDarkMode
                      ? controller.isNumberOfPetSelected.value == index
                          ? CustomColor.primaryDarkTextColor
                          : CustomColor.transparentColor
                      : controller.isNumberOfPetSelected.value == index
                          ? CustomColor.secondaryLightColor
                          : CustomColor.primaryLightScaffoldBackgroundColor,
                  borderColor: Get.isDarkMode
                      ? controller.isNumberOfPetSelected.value == index
                          ? CustomColor.secondaryDarkColor
                          : CustomColor.primaryDarkTextColor.withOpacity(.15)
                      : controller.isNumberOfPetSelected.value == index
                          ? CustomColor.secondaryLightColor
                          : CustomColor.primaryDarkTextColor.withOpacity(.15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //proceed button
  _buttonWidget(BuildContext context) {
    return Column(
      children: [
        verticalSpace(Dimensions.heightSize * 2),
        PrimaryButton(
          title: Strings.professionUpdate.tr,
          onPressed: () {
            debugPrint(controller.controller.kycCheck.toString());

            Get.toNamed(Routes.workDetailsScreen);
          },
          borderColor: CustomColor.primaryLightColor,
          buttonColor: CustomColor.primaryLightColor,
        ),
      ],
    );
  }
}
