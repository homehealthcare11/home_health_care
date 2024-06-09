import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconsax/iconsax.dart';

import '../../../backend/local_storage/local_storage.dart';
import '../../../backend/services/api_endpoint.dart';
import '../../../backend/utils/custom_loading_api.dart';
import '../../../companion_direct/donate/donate_screen.dart';
import '../../../helper/user_choise_helper.dart';
import '../../../companion_customer/controller/log_out_controller.dart';
import '../../../companion_customer/controller/profile/profile_controller.dart';
import '../../../companion_direct/widgets/buttons/primary_button.dart';
import '../../../companion_direct/widgets/drawer/drawer_settings_title_widget.dart';
import '../../custom_assets/assets.gen.dart';
import '../../routes/routes.dart';
import '../../utils/basic_widget_imports.dart';
import '../../widgets/drawer/drawer_title_widget.dart';
import '../logo_widget.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key? key}) : super(key: key);
  final controller = Get.put(ProfileController);
  final appSettingController = Get.put(LogOutController());
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Drawer(
      width: isTablet() ? MediaQuery.sizeOf(context).width * 0.75 : null,
      child: Container(
        decoration: BoxDecoration(
          color:
              Get.isDarkMode ? CustomColor.blackColor : const Color(0xffF4F6FC),
        ),
        child: _allItemListView(context),
      ),
    );
  }

  _allItemListView(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(Dimensions.heightSize),
            Row(
              children: [
                horizontalSpace(Dimensions.widthSize * 2),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Iconsax.arrow_left),
                ),
                horizontalSpace(Dimensions.widthSize * 3),
                LogoWidget(
                  width: Dimensions.widthSize * 15,
                  height: Dimensions.heightSize * 5,
                ),
              ],
            ),
            _userImage(context),
          ],
        ),
        _drawerItems(context),
      ],
    )
        .animate()
        .fadeIn(duration: 900.ms, delay: 300.ms)
        .shimmer(blendMode: BlendMode.srcOver, color: Colors.white12)
        .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad);
  }

  _userImage(BuildContext context) {
    var data = profileController.profileModel.data;
    final image =
        '${ApiEndpoint.mainDomain}/${data.imagePath}/${data.user.image}';
    final defaultImage = '${ApiEndpoint.mainDomain}/${data.defaultImage}';
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: Dimensions.marginSizeVertical),
          width: MediaQuery.of(context).size.width * 0.37,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Theme.of(context).primaryColor, width: 3),
          ),
          child: Center(
            child: CircleAvatar(
              radius: Dimensions.radius * 5.8,
              backgroundColor: Colors.transparent,
              child: CircleAvatar(
                backgroundColor:
                    CustomColor.secondaryLightColor.withOpacity(0.3),
                radius: Dimensions.radius * 5.5,
                backgroundImage:
                    NetworkImage(data.user.image != '' ? image : defaultImage),
                // AssetImage(
                //   Assets.onboard.onboard.path,
                // ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.heightSize,
        ),
        TitleHeading2Widget(
            text: profileController.profileModel.data.user.firstname == ""
                ? 'Ave'
                : profileController.profileModel.data.user.firstname),
        SizedBox(
          height: Dimensions.heightSize * 0.2,
        ),
        TitleHeading4Widget(
          text: profileController.profileModel.data.user.email == ""
              ? "aveniluan@gmail.com"
              : profileController.profileModel.data.user.email,
          opacity: 0.9,
          color: CustomColor.primaryLightTextColor.withOpacity(0.5),
        ),
        SizedBox(
          height: Dimensions.heightSize * 1.8,
        ),
      ],
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
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Builder(
              builder: (context) {
                var width = MediaQuery.of(context).size.width * 0.90;
                return Container(
                  width: width * 0.84,
                  margin: EdgeInsets.all(Dimensions.paddingSize * 0.3),
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
                      TitleHeading2Widget(text: Strings.signOut.tr),
                      verticalSpace(Dimensions.heightSize * 2),
                      TitleHeading4Widget(text: Strings.logMessageSignOut.tr),
                      verticalSpace(Dimensions.heightSize * 1.75),
                      Row(
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              fontSize: Dimensions.headingTextSize6,
                              title: Strings.cancel.tr,
                              onPressed: () {
                                Get.back();
                              },
                              borderColor: CustomColor.deleteButtonColor,
                              buttonColor: CustomColor.deleteButtonColor,
                            ),
                          ),
                          horizontalSpace(Dimensions.widthSize * 1),
                          Obx(() => appSettingController.isLoading
                              ? const Expanded(child: CustomLoadingAPI())
                              : Expanded(
                                  child: PrimaryButton(
                                    title: Strings.signOut.tr,
                                    fontSize: Dimensions.headingTextSize6,
                                    onPressed: () {
                                      appSettingController.logOutProcess().then(
                                          (value) => UserChoiceHelper
                                              .removeUserChoice());

                                      LocalStorage.logout();
                                    },
                                    borderColor: Theme.of(context).primaryColor,
                                    buttonColor: Theme.of(context).primaryColor,
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

  _drawerItems(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.64,
      child: Column(
        children: [
          DrawerTileWidgets(
              img: Assets.icon.notification,
              title: Strings.notification.tr,
              onTap: () {
                Get.toNamed(Routes.notificationScreen);
              }),
          DrawerTileWidgets(
              img: Assets.icon.twoFaSecurity,
              title: Strings.twoFaVerification.tr,
              onTap: () {
                Get.toNamed(Routes.userTwoFaScreen);
              }),
          DrawerTileWidgets(
              img: Assets.icon.changePassword,
              title: Strings.changePassword.tr,
              onTap: () {
                Get.toNamed(Routes.changePasswordScreen);
              }),
          DrawerTileWidgets(
              img: Assets.icon.aboutUs,
              title: Strings.aboutUs.tr,
              onTap: () {
                Get.toNamed(Routes.userAboutUs);
              }),
          // DrawerTileWidgets(
          //     img: Assets.icon.donate,
          //     title: "Donate Now",
          //     onTap: () {
          //       Get.to(DonateScreen());
          //     }),

          DrawerTileWidgets(
              img: Assets.icon.privacyPolicy,
              title: Strings.privacyPolicy.tr,
              onTap: () {
                Get.toNamed(Routes.userPrivacy);
              }),
          DrawerSettingsTileWidgets(
            img: Assets.icon.settingTwo,
            title: Strings.settings.tr,
            onTap: () {
              Get.toNamed(Routes.settingScreen);
            },
          ),
          DrawerTileWidgets(
            img: Assets.icon.signOut,
            title: Strings.signOut.tr,
            onTap: () {
              _logOutDialogueWidget(context);
            },
          ),
        ],
      ),
    );
  }
}
