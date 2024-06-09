import '../../controller/basic_settings/basic_settings_controller.dart';
import '../../controller/onboard_controller/onboard_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../data/onboard_data.dart';
import '../../extensions/glass_widget.dart';
import '../../language/language_drop_down.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/others/custom_image_widget.dart';
import '/backend/utils/custom_loading_api.dart';
import '/companion_customer/language/language_controller.dart';

class OnboardScreenMobileResponsive extends StatelessWidget {
  OnboardScreenMobileResponsive({
    super.key,
  });

  final appSettingController = Get.put(BasicSettingsController());
  final _controller = Get.put(OnBoardController());
  final textColor = Get.isDarkMode
      ? CustomColor.secondaryDarkTextColor
      : CustomColor.secondaryLightTextColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Obx(() => appSettingController.isLoading ||
              Get.find<LanguageController>().isLoading
          ? const CustomLoadingAPI()
          : _bodyWidget(context)),
    );
  }

// all elements contained in body widget
  _bodyWidget(BuildContext context) {
    bool isTablet() {
      return MediaQuery.of(context).size.shortestSide >= 600;
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: [
              Container(
              decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage("assets/onboard/${index+1}.png"),
              fit: BoxFit.fitHeight,
                            ),
                            // gradient: LinearGradient(
                            //     begin: Alignment.bottomCenter,
                            //     end: Alignment.topCenter,
                            //     colors: [
                            //       CustomColor.secondaryLightColor,
                            //       CustomColor.secondaryLightColor.withOpacity(0.0)
                            //     ])
                            ),),
                  Column(
                    mainAxisAlignment: mainEnd,
                    children: [
                      verticalSpace(Dimensions.heightSize * 1.5),
                      // TitleHeading1Widget(
                      //   text: onboardData[index].title,
                      //   color: textColor,
                      // ),
                      // verticalSpace(Dimensions.heightSize * 0.75),
                      // TitleHeading4Widget(
                      //   text: onboardData[index].description,
                      //   padding: EdgeInsets.only(
                      //     left: Dimensions.paddingSize,
                      //     right: Dimensions.paddingSize,
                      //   ),
                      //   color: textColor.withOpacity(0.60),
                      //   fontWeight: FontWeight.w600,
                      //   textAlign: TextAlign.center,
                      // ),
                      // verticalSpace(Dimensions.heightSize * 8),
                    ],
                  ),
                ],
              );
            },
            physics: const ClampingScrollPhysics(),
            controller: _controller.pageController,
            onPageChanged: _controller.selectedIndex,
            itemCount: onboardData.length,
          ),
        ),
        Positioned(
          bottom: Dimensions.heightSize * 2,
          child: SizedBox(
            height: Dimensions.heightSize * 4.33,
            width: Dimensions.widthSize * 17.8,
            child: PrimaryButton(
              title: Strings.getStarted.tr,
              icon: CustomImageWidget(
                path: Assets.icon.doubleArrow,
                height: 23.h,
                width: 24.w,
              ).paddingOnly(bottom: 5.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius * 10)),
              onPressed: () {
                Get.offAllNamed(Routes.welcomeScreen);
              },
              borderColor: Get.isDarkMode
                  ? CustomColor.blackColor.withOpacity(0.6)
                  : CustomColor.whiteColor.withOpacity(0.1),
              buttonColor: Get.isDarkMode
                  ? CustomColor.blackColor.withOpacity(0.6)
                  : CustomColor.whiteColor.withOpacity(0.15),
            ),
          ),
        ),
        Positioned(
          bottom: isTablet()
              ? MediaQuery.sizeOf(context).height * 0.5
              : Dimensions.heightSize * 15,
          child: _dotContainerWidget(context),
        ),
        Positioned(
            top: Dimensions.heightSize * 3,
            right: Dimensions.widthSize * 1.5,
            child: ChangeLanguageWidget(
              isHome: true,
            ))
      ],
    );
  }

  //showing changing dots
  _dotContainerWidget(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            onboardData.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.only(right: 10.w),
              height: 8.h,
              width: 8.w,
              decoration: BoxDecoration(
                color: index == _controller.selectedIndex.value
                    ? CustomColor.whiteColor
                    : CustomColor.whiteColor.withOpacity(0.6),
                border: Border.all(
                  color: index == _controller.selectedIndex.value
                      ? CustomColor.whiteColor
                      : CustomColor.whiteColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ));
  }
}
