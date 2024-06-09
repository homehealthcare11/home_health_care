import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:iconsax/iconsax.dart';

import '../../../backend/services/api_endpoint.dart';
import '../../../backend/utils/custom_loading_api.dart';
import '../../../companion_customer/routes/routes.dart';
import '../../../companion_customer/utils/basic_screen_imports.dart';
import '../../../companion_customer/widgets/appbar/custom_app_bar.dart';

class PrivacyPolicyMobileScreen extends StatelessWidget {
  PrivacyPolicyMobileScreen({super.key});
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.privacyPolicy.tr,
        centerTitle: true,
        action: [
          InkWell(
            onTap: () {
              Get.offAllNamed(Routes.dashboardScreen);
            },
            child: Padding(
              padding: EdgeInsets.only(
                right: Dimensions.paddingSize,
              ),
              child: const Icon(
                Iconsax.home_25,
                // fill: 10,
                color: CustomColor.primaryLightColor,
              ),
            ),
          )
        ],
        onTap: () {
          Get.close(1);
        },
        padding: EdgeInsets.all(Dimensions.paddingSize),
        alwaysShowBackButton: true,
        leadingPadding: EdgeInsets.all(Dimensions.paddingSize * 0.4),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri('${ApiEndpoint.mainDomain}/link/privacy-policy'),
            ),
            onWebViewCreated: (controller) {},
            onLoadStart: (controller, url) {
              isLoading.value = true;
            },
            onLoadStop: (controller, url) {
              isLoading.value = false;
            },
          ),
          ValueListenableBuilder<bool>(
            valueListenable: isLoading,
            builder: (context, isLoading, _) {
              return isLoading
                  ? const Center(child: CustomLoadingAPI())
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
