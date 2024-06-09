import '../../language/language_drop_down.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '/backend/utils/custom_loading_api.dart';
import '/companion_customer/language/language_controller.dart';
import '/companion_customer/widgets/appbar/custom_app_bar.dart';

class SettingsScreenMobile extends StatelessWidget {
  SettingsScreenMobile({super.key});

  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Get.close(1);
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: CustomAppBar(
          Strings.settings.tr,
          leadingPadding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize * 0.4,
          ),
          onTap: () {
            Get.offAllNamed(Routes.bottomNavBar);
          },
        ),
        body: Obx(() => languageController.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context)),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.paddingSize,
          right: Dimensions.paddingSize,
          top: Dimensions.paddingSize * 4),
      child: Column(
        mainAxisAlignment: mainStart,
        children: [
          Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              TitleHeading4Widget(
                padding:
                    EdgeInsets.symmetric(vertical: Dimensions.paddingSize * .2),
                text: Strings.change.tr,
                fontWeight: FontWeight.normal,
                fontSize: Dimensions.headingTextSize3,
              ),
              const Spacer(),
              ChangeLanguageWidget(),
              horizontalSpace(Dimensions.widthSize),
              // const CustomSwitchWidget()
            ],
          ),
        ],
      ),
    );
  }
}
