import '../../../backend/utils/custom_loading_api.dart';
import '../../../companion_customer/routes/routes.dart';
import '../../../companion_direct/controller/select_profession_controller/select_profession_controller.dart';
import '../../../companion_direct/widgets/others/slider_work_capability_widget.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/appbar/custom_app_bar.dart';
import '../../widgets/inputs/charge_input_widget.dart';
import '../../widgets/inputs/choice_widget.dart';
import '../../widgets/others/slider_widget.dart';
import '/companion_customer/language/language_controller.dart';

class WorkDetailsScreenMobile extends StatelessWidget {
  WorkDetailsScreenMobile({Key? key}) : super(key: key);

  final controller = Get.put(SelectProfessionController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          leadingPadding: EdgeInsets.all(Dimensions.paddingSize * 0.4),
          Strings.workDetail.tr, onTap: () {
        Get.back();
      }),
      body: Obx(() {
        return controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context);
      }),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
        child: ListView(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.widthSize * 2),
      children: [
        _workExperienceWidget(context),
        _workCapability(context),
        _serviceAreaWidget(context),
        _typeOfCharge(context),
        _charge(context),
        verticalSpace(Dimensions.heightSize),
        _bioWidget(context, Strings.writeSomethingAboutYou.tr),
        _buttonWidget(context),
      ],
    ));
  }

  //proceed button
  _buttonWidget(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => controller.isUpdateLoading
              ? const CustomLoadingAPI()
              : PrimaryButton(
                  title: Strings.updateWorkDetails.tr,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (controller.controller.kycCheck == true) {
                        debugPrint('status = 0');
                        debugPrint(controller.controller.kycCheck.toString());
                        // controller.
                        controller.selectProfessionProcess().then(
                            (value) => Get.offAllNamed(Routes.dashboardScreen));
                      } else {
                        debugPrint('status = 1');
                        debugPrint(controller.controller.kycCheck.toString());
                        controller.updateProfession();
                      }
                    }
                  },
                  borderColor: CustomColor.primaryLightColor,
                  buttonColor: CustomColor.primaryLightColor,
                ),
        ),
        verticalSpace(Dimensions.heightSize * 4),
      ],
    );
  }

  _workExperienceWidget(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(Dimensions.heightSize),
          TitleHeading3Widget(
            text: Strings.workExperience.tr,
            fontWeight: FontWeight.w500,
          ),
          SliderWidget(
            sliderPointerValue: controller.sliderValue.toDouble(),
            dataRanges: controller.experience,
          ),
          verticalSpace(Dimensions.heightSize * .5),
        ],
      ),
    );
  }

  _workCapability(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(Dimensions.heightSize),
          TitleHeading3Widget(
            text: Strings.workCapability.tr,
            fontWeight: FontWeight.w500,
          ),
          SliderCapabilityWidget(
            sliderPointerValue: controller.sliderValueCapability.toDouble(),
            dataRanges: controller.capability,
          ),
          verticalSpace(Dimensions.heightSize * .5),
        ],
      ),
    );
  }

  _serviceAreaWidget(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(Dimensions.heightSize),
          TitleHeading3Widget(
            text: Strings.serviceArea.tr,
            fontWeight: FontWeight.w500,
          ),
          verticalSpace(Dimensions.heightSize * .5),
          Wrap(
            children: List.generate(
              controller.serviceArea.length,
              (index) => Obx(
                () => ChoiceWidget(
                  fontSize: Dimensions.headingTextSize3,
                  fontWeight: FontWeight.w500,
                  text: controller.serviceArea[index],
                  textColor: Get.isDarkMode
                      ? controller.isServiceAreaSelected.value == index
                          ? CustomColor.secondaryDarkTextColor
                          : CustomColor.primaryDarkTextColor.withOpacity(.40)
                      //light mode
                      : controller.isServiceAreaSelected.value == index
                          ? CustomColor.secondaryLightTextColor
                          : CustomColor.primaryLightTextColor.withOpacity(.40),
                  onTap: () {
                    controller.isServiceAreaSelected.value = index;
                  },
                  containerColor: Get.isDarkMode
                      ? controller.isServiceAreaSelected.value == index
                          ? CustomColor.primaryDarkTextColor
                          : CustomColor.transparentColor
                      : controller.isServiceAreaSelected.value == index
                          ? CustomColor.secondaryLightColor
                          : CustomColor.primaryLightScaffoldBackgroundColor,
                  borderColor: Get.isDarkMode
                      ? controller.isServiceAreaSelected.value == index
                          ? CustomColor.secondaryDarkColor
                          : CustomColor.primaryDarkTextColor.withOpacity(.15)
                      : controller.isServiceAreaSelected.value == index
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

  _typeOfCharge(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(Dimensions.heightSize),
          TitleHeading3Widget(
            text: Strings.typeOfCharge.tr,
            fontWeight: FontWeight.w500,
          ),
          verticalSpace(Dimensions.heightSize * .5),
          Wrap(
            children: List.generate(
              controller.typeOfCharge.length,
              (index) => Obx(
                () => ChoiceWidget(
                  fontSize: Dimensions.headingTextSize3,
                  fontWeight: FontWeight.w500,
                  text: controller.typeOfCharge[index],
                  textColor: Get.isDarkMode
                      ? controller.isTypeOfChargeSelected.value == index
                          ? CustomColor.secondaryDarkTextColor
                          : CustomColor.primaryDarkTextColor.withOpacity(.40)

                      //light mode
                      : controller.isTypeOfChargeSelected.value == index
                          ? CustomColor.secondaryLightTextColor
                          : CustomColor.primaryLightTextColor.withOpacity(.40),
                  onTap: () {
                    controller.isTypeOfChargeSelected.value = index;
                  },
                  containerColor: Get.isDarkMode
                      ? controller.isTypeOfChargeSelected.value == index
                          ? CustomColor.primaryDarkTextColor
                          : CustomColor.transparentColor
                      : controller.isTypeOfChargeSelected.value == index
                          ? CustomColor.secondaryLightColor
                          : CustomColor.primaryLightScaffoldBackgroundColor,
                  borderColor: Get.isDarkMode
                      ? controller.isTypeOfChargeSelected.value == index
                          ? CustomColor.secondaryDarkColor
                          : CustomColor.primaryDarkTextColor.withOpacity(.15)
                      : controller.isTypeOfChargeSelected.value == index
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

  _charge(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(Dimensions.heightSize),
          TitleHeading3Widget(
            text: Strings.charge.tr,
            fontWeight: FontWeight.w500,
          ),
          verticalSpace(Dimensions.heightSize * .5),
          ChargeInputWidget(
            controller: controller.chargeController,
            keyboardType: TextInputType.number,
            hintText: '0.00',
          ),
        ],
      ),
    );
  }

  _bioWidget(BuildContext context, String hintText) {
    final languageController = Get.put(LanguageController());
    return SizedBox(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleHeading3Widget(
              text: Strings.bio.tr,
              fontWeight: FontWeight.w500,
            ),
            verticalSpace(Dimensions.heightSize * .5),
            SizedBox(
              child: TextFormField(
                maxLines: 7,
                style: CustomStyle.darkHeading4TextStyle.copyWith(
                  color: CustomColor.primaryDarkTextColor.withOpacity(1),
                  fontWeight: FontWeight.w600,
                ),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return Strings.pleaseFillOutTheField;
                  } else {
                    return null;
                  }
                },
                controller: controller.bioController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimensions.radius),
                    borderSide: BorderSide(
                        color:
                            CustomColor.primaryLightTextColor.withOpacity(0.15),
                        width: Dimensions.heightSize * .15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimensions.radius),
                    borderSide: BorderSide(
                        color: CustomColor.primaryLightColor.withOpacity(0.7),
                        width: Dimensions.heightSize * .15),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimensions.radius),
                    borderSide: const BorderSide(color: Colors.red, width: 1),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimensions.radius),
                    borderSide: const BorderSide(color: Colors.red, width: 1),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.only(
                      left: 15, right: 15, top: 14, bottom: 10),
                  hintText: languageController.getTranslation(hintText),
                  hintStyle: CustomStyle.darkHeading4TextStyle.copyWith(
                    color: CustomColor.primaryLightTextColor.withOpacity(.30),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            verticalSpace(
              Dimensions.heightSize * 2,
            ),
          ],
        ),
      ),
    );
  }
}
