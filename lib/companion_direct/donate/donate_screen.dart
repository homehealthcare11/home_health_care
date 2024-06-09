

import 'package:sitterhub/companion_direct/donate/donate_webview_screen.dart';

import '../../companion_customer/utils/basic_widget_imports.dart';
import '../../companion_customer/widgets/appbar/custom_app_bar.dart';
import '../../companion_customer/widgets/text_labels/title_heading5_widget.dart';

class DonateScreen extends StatefulWidget {
  const DonateScreen({super.key});

  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        "Donate Now",
          alwaysShowBackButton: false,
        leadingPadding: EdgeInsets.only(left: Dimensions.paddingSize),
        onTap: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Center(
          child: InkWell(
            onTap: (){
              Get.to(DonateWebView());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Image.asset("assets/onboard/donate_img.jpeg",
                height: MediaQuery.of(context).size.height * 0.8,),
            ),
          ),
        ),
      ),
    );
  }
}
