import '../../custom_assets/assets.gen.dart';
import '../../companion_direct/widgets/others/custom_image_widget.dart';
import '../controller/babby_sitter/baby_sitter_controller.dart';
import '../utils/basic_screen_imports.dart';
import '../widgets/text_labels/title_heading5_widget.dart';
import 'area_drop_down.dart';

class NannyAlertDialog extends StatelessWidget {
  NannyAlertDialog({Key? key}) : super(key: key);
  final controller = Get.put(BabySitterController());

  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return AlertDialog(
      alignment: Alignment.center,
      insetPadding: EdgeInsets.all(Dimensions.paddingSize * 0.5),
      surfaceTintColor: CustomColor.whiteColor,
      contentPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Builder(
        builder: (context) {
          return Container(
            height: isTablet()
                ? MediaQuery.of(context).size.height * 0.55
                : MediaQuery.of(context).size.height * 0.45,
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.widthSize,
                vertical: Dimensions.heightSize * 1.5),
            color: Colors.transparent,
            child: Obx(
              () => Column(
                crossAxisAlignment: crossEnd,
                children: [
                  _crossButtonWidget(context),
                  verticalSpace(Dimensions.heightSize),
                  Row(
                    mainAxisAlignment: mainSpaceBet,
                    children: [
                      _serviceAreaWidget(context),
                      _pricingWidget(context),
                    ],
                  ),
                  verticalSpace(Dimensions.heightSize),
                  Row(
                    children: [
                      _workExperienceWidget(context),
                      _workCapabilityWidget(context),
                    ],
                  ),
                  verticalSpace(Dimensions.heightSize),
                  Row(
                    children: [
                      _serviceType(context),
                    ],
                  ),
                  const Spacer(),
                  _filterButtonWidget(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  //pricing
  _pricingWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      mainAxisAlignment: mainStart,
      children: [
        TitleHeading5Widget(
          text: Strings.professionType.tr,
          fontWeight: FontWeight.w500,
        ),
        verticalSpace(Dimensions.heightSize * 0.67),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                controller.isChecked1.value = true;
                controller.isChecked2.value = false;
                controller.professionType.value = "0";
              },
              child: Container(
                decoration: BoxDecoration(
                  color: controller.isChecked1.value
                      ? CustomColor.secondaryLightColor
                      : CustomColor.whiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dimensions.radius * 2),
                  ),
                  border: Border.all(color: CustomColor.secondaryLightColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: SizedBox(
                    width: Dimensions.widthSize * 6,
                    child: TitleHeading5Widget(
                      maxLines: 1,
                      fontSize: Dimensions.headingTextSize6,
                      textAlign: TextAlign.center,
                      text: Strings.babySitter.tr,
                      color: controller.isChecked1.value
                          ? CustomColor.whiteColor
                          : CustomColor.secondaryLightColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            horizontalSpace(Dimensions.widthSize * 0.75),
            GestureDetector(
              onTap: () {
                controller.isChecked1.value = false;
                controller.isChecked2.value = true;
                controller.professionType.value = "1";
              },
              child: Container(
                decoration: BoxDecoration(
                  color: controller.isChecked2.value
                      ? CustomColor.secondaryLightColor
                      : CustomColor.whiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dimensions.radius * 2),
                  ),
                  border: Border.all(color: CustomColor.secondaryLightColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: SizedBox(
                    width: Dimensions.widthSize * 6,
                    child: TitleHeading5Widget(
                      textAlign: TextAlign.center,
                      text: Strings.petSitter.tr,
                      fontSize: Dimensions.headingTextSize6,
                      color: controller.isChecked2.value
                          ? CustomColor.whiteColor
                          : CustomColor.secondaryLightColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  //service area
  _serviceAreaWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TitleHeading5Widget(
          text: Strings.serviceArea.tr,
          fontWeight: FontWeight.w500,
        ),
        verticalSpace(Dimensions.heightSize * 0.5),
        Padding(
          padding: EdgeInsets.only(right: Dimensions.paddingSize * 0),
          child: AreaDropDown(
            width: MediaQuery.sizeOf(context).width * 0.4,
            itemsList: controller.serviceAreaList,
            selectMethod: controller.serviceArea,
            onChanged: (p0) {
              controller.serviceArea.value = p0!;
              debugPrint("💜🔮👾💜🔮👾 ${controller.serviceArea.value}");
            },
          ),
        ),
      ],
    );
  }

  //work experience list
  _workExperienceWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TitleHeading5Widget(
          text: Strings.workExperience.tr,
          fontWeight: FontWeight.w500,
        ),
        verticalSpace(Dimensions.heightSize * 0.5),
        Padding(
          padding: EdgeInsets.only(right: Dimensions.paddingSize * 0.5),
          child: AreaDropDown(
            itemsList: controller.workExperienceList,
            selectMethod: controller.workExperience,
            onChanged: (p0) => controller.workExperience.value = p0!,
            width: MediaQuery.sizeOf(context).width * 0.4,
          ),
        ),
      ],
    );
  }

  // cross button widget
  _crossButtonWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize * 0.8,
        ),
        child: CustomImageWidget(
          path: Assets.icon.cross,
          height: 15.h,
          width: 15.w,
        ),
      ),
    );
  }

  _workCapabilityWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TitleHeading5Widget(
          text: Strings.workCapability.tr,
          fontWeight: FontWeight.w500,
        ),
        verticalSpace(Dimensions.heightSize * 0.5),
        Padding(
          padding: EdgeInsets.only(
            right: Dimensions.paddingSize * 0.5,
          ),
          child: AreaDropDown(
            width: MediaQuery.sizeOf(context).width * 0.4,
            itemsList: controller.workCapabilityList,
            selectMethod: controller.workCapability,
            onChanged: (p0) {
              controller.workCapability.value = p0!;
            },
          ),
        ),
      ],
    );
  }

  _serviceType(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TitleHeading5Widget(
          text: Strings.typeOfCharge.tr,
          fontWeight: FontWeight.w500,
        ),
        verticalSpace(Dimensions.heightSize * 0.5),
        Padding(
          padding: EdgeInsets.only(right: Dimensions.paddingSize * 0.5),
          child: AreaDropDown(
            width: MediaQuery.sizeOf(context).width * 0.4,
            itemsList: controller.chargeList,
            selectMethod: controller.charge,
            onChanged: (p0) => controller.charge.value = p0!,
          ),
        ),
      ],
    );
  }

  _filterButtonWidget(BuildContext context) {
    for (int i = 0; i < controller.serviceAreaList.length; i++) {
      if (controller.serviceAreaList[i].contains(controller.serviceArea)) {
        controller.slug.value = controller.slugList[i];
      }
    }
    debugPrint("💜🔮👾💜🔮👾 ${controller.slug.value}");
    return PrimaryButton(
        title: Strings.applyFilter.tr,
        onPressed: () {
          controller.getNannyList(
              "?area=${controller.slug.value}&profession_type=${controller.professionType.value}&work_capability=${controller.workCapability}&work_experience=${controller.workExperience}&charge=${controller.charge}");
          Get.back();
        },
        borderColor: CustomColor.primaryLightColor,
        buttonColor: CustomColor.primaryLightColor);
  }
}
