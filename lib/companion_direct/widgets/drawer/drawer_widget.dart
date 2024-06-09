import 'package:flutter_animate/flutter_animate.dart';
import 'package:sitterhub/companion_direct/donate/donate_screen.dart';

import '../../../../backend/utils/custom_loading_api.dart';
import '../../../backend/services/api_endpoint.dart';
import '../../../custom_assets/assets.gen.dart';
import '../../../helper/user_choise_helper.dart';
import '../../../companion_customer/routes/routes.dart';
import '../../controller/auth/logout/logout_controller.dart';
import '../../controller/dashboard/profile_controller/profile_controller.dart';
import '../../local_storage/local_storage.dart';
import '../../utils/basic_widget_imports.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/drawer/drawer_title_widget.dart';
import '../others/custom_image_widget.dart';
import '/companion_customer/widgets/logo_widget.dart';
import 'drawer_settings_title_widget.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key? key}) : super(key: key);

  final controller = Get.put(NannyProfileController());
  final logOutController = Get.put(LogOutController());

  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Drawer(
      width: isTablet() ? MediaQuery.sizeOf(context).width * 0.75 : null,
      elevation: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimensions.radius * 2),
            bottomRight: Radius.circular(Dimensions.radius * 2),
          ),
          color:
              Get.isDarkMode ? CustomColor.blackColor : const Color(0xffF4F6FC),
        ),
        child: LocalStorage.isLoggedIn()
            ? _allItemListView(context)
            : _guestUserItemsListView(context),
      ),
    );
  }

  _allItemListView(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

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
                    child: CustomImageWidget(
                      path: Assets.icon.arrowBack,
                      height: isTablet() ? 25 : 16,
                    )),
                horizontalSpace(Dimensions.widthSize * 3),
                LogoWidget(
                  width: Dimensions.widthSize * 15,
                  height: Dimensions.heightSize * 8,
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
    var data = controller.profileModel.data;
    final image =
        '${ApiEndpoint.mainDomain}/${data.imagePath}/${data.nanny.image}';
    final defaultImage = '${ApiEndpoint.mainDomain}/${data.defaultImage}';
    String text = controller.firstNameController.text;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 18.h),
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
                  radius: Dimensions.radius * 5.5,
                  backgroundImage: NetworkImage(
                      data.nanny.image != '' ? image : defaultImage),
                )),
          ),
        ),
        SizedBox(
          height: Dimensions.heightSize,
        ),
        TitleHeading2Widget(
            text:
                "${text[0].toUpperCase()}${text.substring(1, text.length)} ${data.nanny.lastname}"),
        SizedBox(
          height: Dimensions.heightSize * 0.2,
        ),
        TitleHeading4Widget(
          text: data.nanny.email,
          opacity: 0.9,
          color: CustomColor.primaryLightTextColor.withOpacity(0.5),
        ),
        SizedBox(
          height: Dimensions.heightSize * 1.8,
        ),
      ],
    );
  }

  _drawerItems(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      child: Column(
        children: [
          DrawerTileWidgets(
              img: Assets.icon.notification,
              title: Strings.notification,
              onTap: () {
                Get.toNamed(Routes.nannyNotificationScreen);
              }),
          //
          //2FA security screen
          //
          DrawerTileWidgets(
              img: Assets.icon.security2fa,
              title: Strings.twoFaVerification.tr,
              onTap: () {
                Get.toNamed(Routes.nannyTwoFaScreen);
              }),
          //
          //Change Password Screen
          //
          DrawerTileWidgets(
              img: Assets.icon.changePassword,
              title: Strings.changePassword,
              onTap: () {
                Get.toNamed(Routes.nannyChangePasswordScreen);
              }),
          //
          //history screen
          //
          DrawerTileWidgets(
              img: Assets.icon.history,
              title: Strings.history,
              onTap: () {
                Get.toNamed(Routes.nannyHistoryScreen);
              }),

          DrawerTileWidgets(
              img: Assets.icon.aboutUs,
              title: Strings.aboutUs,
              onTap: () {
                Get.toNamed(Routes.nannyAboutUs);
              }),

          DrawerTileWidgets(
              img: Assets.icon.privacyPolicy,
              title: Strings.privacyPolicy,
              onTap: () {
                Get.toNamed(Routes.nannyPrivacy);
              }),
          DrawerSettingsTileWidgets(
            img: Assets.icon.settingTwo,
            title: Strings.settings.tr,
            onTap: () {
              Get.toNamed(Routes.settingScreenNanny);
            },
          ),

          DrawerSettingsTileWidgets(
            img: Assets.icon.withdraw,
            title: Strings.moneyOut.tr,
            onTap: () {
              Get.toNamed(Routes.nannyMoneyOutScreen);
            },
          ),
          DrawerTileWidgets(
            img: Assets.icon.signOut,
            title: Strings.signOut,
            onTap: () {
              _logOutDialogueWidget(context);
            },
          ),
        ],
      ),
    );
  }

  _guestUserItemsListView(context) {
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
                  child: CustomImageWidget(
                    path: Assets.icon.arrowBack,
                    height: 16,
                  ),
                ),
                horizontalSpace(Dimensions.widthSize * 3),
                LogoWidget(
                  width: Dimensions.widthSize * 13,
                  height: Dimensions.heightSize * 3,
                ),
              ],
            ),
          ],
        ),
        _guestUserDrawerItems(context),
      ],
    );
  }

  _guestUserDrawerItems(context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.64,
      child: Column(
        children: [
          //
          //notification Screen

          DrawerTileWidgets(
              img: Assets.icon.notification,
              title: Strings.notification,
              onTap: () {
                Get.toNamed(Routes.nannyNotificationScreen);
              }),
          //
          //about us
          //
          DrawerTileWidgets(
              img: Assets.icon.aboutUs, title: Strings.aboutUs, onTap: () {}),
          //
          //privacy policy
          //
          DrawerTileWidgets(
              img: Assets.icon.privacyPolicy,
              title: Strings.privacyPolicy,
              onTap: () {}),
          //
          //sign up
          //
          DrawerTileWidgets(
            img: Assets.icon.signOut,
            title: Strings.signUp,
            onTap: () {
              Get.offAllNamed(Routes.signUpScreen);
            },
          ),
        ],
      ),
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
                              title: Strings.cancel.tr,
                              fontSize: Dimensions.headingTextSize6,
                              onPressed: () {
                                Get.back();
                              },
                              borderColor: CustomColor.primaryLightColor,
                              buttonColor: CustomColor.primaryLightColor,
                            ),
                          ),
                          horizontalSpace(Dimensions.widthSize * 1),
                          Obx(
                            () => logOutController.isLoading
                                ? const Expanded(child: CustomLoadingAPI())
                                : Expanded(
                                    child: PrimaryButton(
                                      title: Strings.signOut.tr,
                                      fontSize: Dimensions.headingTextSize6,
                                      onPressed: () {
                                        logOutController.logOutProcess().then(
                                            (value) => UserChoiceHelper
                                                .removeUserChoice());
                                        LocalStorage.logout();
                                      },
                                      borderColor:
                                          CustomColor.deleteButtonColor,
                                      buttonColor:
                                          CustomColor.deleteButtonColor,
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
