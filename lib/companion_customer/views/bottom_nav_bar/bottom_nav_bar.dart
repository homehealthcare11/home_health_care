import 'package:iconsax/iconsax.dart';
import 'package:sitterhub/companion_direct/donate/donate_screen.dart';

import '../../custom_assets/assets.gen.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/others/custom_image_widget.dart';
import '../home_screen/baby_sitter_screen.dart';
import '../profile_screen/profile_screen.dart';
import '/companion_customer/language/language_controller.dart';
import '/companion_customer/widgets/drawer/drawer_widget.dart';
import '/companion_customer/widgets/logo_widget.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    Stack(
      clipBehavior: Clip.none,
      children: [
        const BabySitter(),
        Container(
          height: 100,
          color: CustomColor.secondaryDarkColor,
          child: Row(
            mainAxisAlignment: mainSpaceBet,
            crossAxisAlignment: crossStart,
            children: [
              Builder(builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 50),
                    child: Icon(
                      Iconsax.element_4,
                      size: Dimensions.heightSize * 2,
                      color: CustomColor.whiteColor,
                      weight: Dimensions.headingTextSize1,
                    ),
                  ),
                );
              }),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  "assets/logo/logo_without_bg.png",
                  height: 800.h,
                  width: 250.w,),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.serviceCartScreen);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, top: 50),
                  child: Icon(
                    Iconsax.shopping_cart,
                    size: Dimensions.heightSize * 2,
                    color: CustomColor.whiteColor,
                    weight: Dimensions.headingTextSize1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    const DonateScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Scaffold(
      body: _bodyWidget(context),
      drawer: DrawerWidget(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius * 2),
            topRight: Radius.circular(Dimensions.radius * 2),
          ),
        ),
        child: Obx(() => Get.find<LanguageController>().isLoading
            ? Container()
            : BottomNavigationBar(
                elevation: 0.5,
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: CustomStyle.lightHeading5TextStyle
                    .copyWith(fontWeight: FontWeight.w600),
                unselectedLabelStyle: CustomStyle.lightHeading5TextStyle
                    .copyWith(fontWeight: FontWeight.w600),
                showSelectedLabels: true,
                showUnselectedLabels: true,
                unselectedItemColor:
                    CustomColor.primaryLightTextColor.withOpacity(0.30),
                selectedItemColor: CustomColor.primaryLightColor,
                currentIndex: _currentIndex,
                onTap: (int index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: CustomImageWidget(
                        path: Assets.icon.home2,
                        height: isTablet()
                            ? MediaQuery.sizeOf(context).height * 0.035
                            : null,
                        color:
                            CustomColor.primaryLightTextColor.withOpacity(0.30),
                      ),
                      label: Get.find<LanguageController>()
                          .getTranslation(Strings.home.tr),
                      activeIcon: CustomImageWidget(
                        path: Assets.icon.home2,
                        height: isTablet()
                            ? MediaQuery.sizeOf(context).height * 0.035
                            : null,
                        color: CustomColor.primaryLightColor,
                      )),
                  BottomNavigationBarItem(
                      icon: CustomImageWidget(
                        path: Assets.icon.donate,
                        height: isTablet()
                            ? MediaQuery.sizeOf(context).height * 0.035
                            : null,
                        color:
                            CustomColor.primaryLightTextColor.withOpacity(0.30),
                      ),
                      label: Get.find<LanguageController>()
                          .getTranslation(Strings.donate.tr),
                      activeIcon: CustomImageWidget(
                        path: Assets.icon.donate,
                        color: CustomColor.primaryLightColor,
                        height: isTablet()
                            ? MediaQuery.sizeOf(context).height * 0.035
                            : null,
                      )),
                  BottomNavigationBarItem(
                      icon: CustomImageWidget(
                        path: Assets.icon.account,
                        height: isTablet()
                            ? MediaQuery.sizeOf(context).height * 0.035
                            : null,
                        color:
                        CustomColor.primaryLightTextColor.withOpacity(0.30),
                      ),
                      label: Get.find<LanguageController>()
                          .getTranslation(Strings.account.tr),
                      activeIcon: CustomImageWidget(
                        path: Assets.icon.account,
                        color: CustomColor.primaryLightColor,
                        height: isTablet()
                            ? MediaQuery.sizeOf(context).height * 0.035
                            : null,
                      )),
                ],
              )),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return _tabs[_currentIndex];
  }
}
