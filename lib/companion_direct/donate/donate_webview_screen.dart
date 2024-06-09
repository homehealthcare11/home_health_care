import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:iconsax/iconsax.dart';

import '../../companion_customer/routes/routes.dart';
import '../../companion_customer/widgets/appbar/custom_app_bar.dart';
import '../utils/basic_screen_imports.dart';

class DonateWebView extends StatefulWidget {
  const DonateWebView({super.key});

  @override
  State<DonateWebView> createState() => _DonateWebViewState();
}

class _DonateWebViewState extends State<DonateWebView> {
  late InAppWebViewController webViewController;
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.bottomNavBar);
        return false;
      },
      child: Scaffold(
        appBar: PreferredSize(
      preferredSize: const Size.fromHeight(50.0),
      child: CustomAppBar(
        "Donate",
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
        body: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri("https://www.jood.om/en/Donate/Initiative/5062fae8-ce76-45c7-8cca-b1450000b145/"),
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
          },
        ),
      ),
    );
  }
}
