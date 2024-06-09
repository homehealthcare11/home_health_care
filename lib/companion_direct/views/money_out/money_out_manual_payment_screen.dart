import 'package:flutter_html/flutter_html.dart';
import '/backend/utils/custom_loading_api.dart';

import '../../../companion_customer/routes/routes.dart';
import '../../../companion_customer/widgets/appbar/custom_app_bar.dart';
import '../../../companion_customer/widgets/buttons/primary_button.dart';
import '../../controller/money_out/money_out_controller.dart';
import '../../utils/basic_widget_imports.dart';

class MoneyOutManualPaymentScreen extends StatelessWidget {
  MoneyOutManualPaymentScreen({super.key});

  final controller = Get.put(MoneyOutController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.evidenceNote.tr,
        onTap: () {
          Get.back();
        },
        leadingPadding: EdgeInsets.only(
          left: Dimensions.paddingSize,
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize * 0.7,
        vertical: Dimensions.paddingSize * 0.7,
      ),
      child: Form(
        key: formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              decoration: BoxDecoration(
                  color: CustomColor.primaryLightColor,
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimensions.radius))),
              child: Html(
                data: """
              ${controller.moneyOutInsertModel.data.details}
                """,
                shrinkWrap: true,
                style: {
                  "p.fancy": Style(
                    textAlign: TextAlign.center,
                    backgroundColor: Colors.green,
                    color: Colors.blue,
                    margin: Margins(
                        left: Margin(50, Unit.px), right: Margin.auto()),
                    width: Width(300, Unit.px),
                    fontWeight: FontWeight.w900,
                  ),
                },
              ),
            ),
            verticalSpace(Dimensions.heightSize),
            ...controller.inputFields.map((element) {
              return element;
            }),
            _buttonWidget(context)
          ],
        ),
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical),
      child: Obx(
        () => controller.isConfirmLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
                title: Strings.submit,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Get.toNamed(Routes.moneyOutPreviewScreen);
                  }
                },
                borderColor: CustomColor.primaryLightColor,
                buttonColor: CustomColor.primaryLightColor,
              ),
      ),
    );
  }
}
