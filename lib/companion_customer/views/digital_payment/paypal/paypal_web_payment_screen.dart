import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../backend/utils/custom_loading_api.dart';
import '../../../congratulation/congratulation_screen.dart';
import '../../../routes/routes.dart';
import '../../../utils/basic_widget_imports.dart';
import '/companion_customer/controller/digital_payment_controller/digital_payment_controller.dart';
import '/companion_customer/widgets/appbar/custom_app_bar.dart';

// ignore: must_be_immutable
class PaypalWebPaymentScreen extends StatelessWidget {
  PaypalWebPaymentScreen({super.key});

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
            Strings.paypal.tr,
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
            if (url.toString().contains('success') ||
                url.toString().contains('success/response') ||
                url.toString().contains('complete') ||
                url.toString().contains('sslcommerz/success') ||
                url.toString().contains('stripe/payment/success/')) {
              debugPrint("Onload start success");
            }
            debugPrint(url.toString());
          },
          initialUrlRequest: URLRequest(
            url: WebUri(controller.paymentURL.value),
          ),
          onProgressChanged:
              (InAppWebViewController controller, int progress) {},
          onLoadStop: (controller, url) {
            isLoading.value = false;
            if (url.toString().contains('success')) {
              Get.to(
                () => const CongratulationScreen(
                  title: Strings.congratulation,
                  subTitle: Strings.successPayment,
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
