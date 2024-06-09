import '../../utils/basic_screen_imports.dart';
import '/backend/local_storage/local_storage.dart';
import '/backend/utils/custom_loading_api.dart';
import '/companion_customer/controller/basic_settings/basic_settings_controller.dart';

class SplashScreenMobileLayout extends StatelessWidget {
  SplashScreenMobileLayout({super.key});

  final controller = Get.put(BasicSettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Get.isDarkMode ? CustomColor.blackColor : CustomColor.whiteColor,
      // body: Obx(() => controller.isLoading
      //     ? const CustomLoadingAPI()
      //     : Image.network(
      //         LocalStorage.getSplashImage().toString(),
      //         width: MediaQuery.of(context).size.width,
      //         height: MediaQuery.of(context).size.height,
      //       )),
      body: Container(
        height: MediaQuery.of(context).size.height,
    width: double.infinity,
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/onboard/splash.png"),
    fit: BoxFit.cover,
    ),
    ),)
    );
  }
}
