import '/backend/utils/custom_loading_api.dart';

import '../../../../companion_customer/utils/basic_screen_imports.dart';
import '../../../../companion_customer/widgets/appbar/custom_app_bar.dart';
import '../../../controller/money_out/money_out_controller.dart';
import '../../../widgets/money_out/withdraw_custom_preview_widget.dart';

class MoneyOutPreviewMobileScreenLayout extends StatelessWidget {
  MoneyOutPreviewMobileScreenLayout({
    super.key,
  });

  final controller = Get.put(MoneyOutController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.history.tr,
        onTap: () {
          Get.back();
        },
        leadingPadding: EdgeInsets.only(
          left: Dimensions.paddingSize,
        ),
      ),
      body: Column(
        children: [
          WithdrawCustomPreviewWidget(),
          _confirmButtonWidget(context),
        ],
      ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.8),
    );
  }

  _confirmButtonWidget(BuildContext context) {
    return Obx(
      () => controller.isLoading
          ? const CustomLoadingAPI()
          : PrimaryButton(
              title: Strings.confirm,
              onPressed: () {
                controller.confirmProcess();
              },
              borderColor: CustomColor.primaryLightColor,
              buttonColor: CustomColor.primaryLightColor,
            ),
    );
  }
}
