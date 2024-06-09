import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../backend/utils/custom_loading_api.dart';
import '../../../../companion_direct/utils/basic_screen_imports.dart';
import '../../../../companion_direct/widgets/appbar/custom_app_bar.dart';
import '../../../congratulation/congratulation_screen.dart';
import '../../../routes/routes.dart';
import '/companion_customer/controller/digital_payment_controller/digital_payment_controller.dart';

// ignore: must_be_immutable
class WebPaymentScreen extends StatelessWidget {
  WebPaymentScreen({super.key});
  final controller = Get.put(DigitalPaymentController());
  late InAppWebViewController webViewController;
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.bottomNavBar);
        return false;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: CustomAppBar(
            controller.paymentMethod.value,
            centerTitle: true,
            action: [
              InkWell(
                onTap: () {
                  Get.offAllNamed(Routes.bottomNavBar);
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
        ),
        body: Obx(
          () => controller.isLoading
              ? const CustomLoadingAPI()
              : _bodyWidget(context),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Stack(
      children: [
        InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri(controller.paymentMethodModel.data.url),
          ),
          onWebViewCreated: (controller) {
            webViewController = controller;
            controller.addJavaScriptHandler(
              handlerName: 'jsHandler',
              callback: (args) {
                // Handle JavaScript messages from WebView
              },
            );
          },
          onLoadStart: (controller, url) {
            isLoading.value = true;
            debugPrint(url.toString());
          },
          onProgressChanged:
              (InAppWebViewController controller, int progress) {},
          onLoadStop: (controller, url) {
            debugPrint("🌞🧃🍄🌱🍓 ${url.toString()}");
            isLoading.value = false;
            // Handle page load stop, e.g., hide loading indicator

            if (url.toString().contains('success/response') ||
                url.toString().contains('complete') ||
                url.toString().contains('status=successful') ||
                url.toString().contains('sslcommerz/success') ||
                url.toString().contains('stripe/payment/success/') || url.toString().contains('add-money/razor/callback?razorpay_order_id=order')) {
              debugPrint("Success");
              Get.to(
                () => CongratulationScreen(
                  title: Strings.congratulation.tr,
                  subTitle: Strings.successPayment.tr,
                  route: Routes.bottomNavBar,
                ),
              );
            }
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
    );
  }
}
