import 'package:dropdown_button2/dropdown_button2.dart';

import '../../controller/digital_payment_controller/digital_payment_controller.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/appbar/custom_app_bar.dart';
import '/backend/model/service_cart_user/service_cart_user_model.dart';
import '/backend/utils/custom_loading_api.dart';
import '/companion_customer/controller/service_tracking/service_tracking_controller.dart';

class DigitalPaymentMobileResponsive extends StatelessWidget {
  DigitalPaymentMobileResponsive({
    super.key,
  });

  final controller = Get.put(DigitalPaymentController());
  final serviceTrackingController = Get.put(ServiceTrackingController());
  final int id = Get.arguments[0];
  final double amount = Get.arguments[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryLightScaffoldBackgroundColor,
      appBar: CustomAppBar(
        Strings.digitalPayment.tr,
        onTap: () {
          Get.back();
        },
        leadingPadding: EdgeInsets.only(
          left: Dimensions.paddingSize,
        ),
      ),
      body: Obx(() =>
          controller.isLoading || serviceTrackingController.isLoading
              ? const CustomLoadingAPI()
              : _bodyWidget(context)),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.paddingSize, right: Dimensions.paddingSize),
      child: ListView(
        children: [
          verticalSpace(Dimensions.heightSize * 5),
          _walletDropDownWidget(context),
          verticalSpace(Dimensions.heightSize * 3),
          _buttonWidget(context),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return PrimaryButton(
        title: Strings.payment.tr,
        onPressed: () {
          if (serviceTrackingController.selectPaymentMethod.value
              .contains("paypal")) {
            controller
                .userAddMoneyPaypalProcess(id,
                    serviceTrackingController.selectPaymentMethod.value, amount)
                .then(
                  (value) =>
                      Get.toNamed(Routes.paypalWebPaymentScreen, arguments: id),
                );
          } else {
            controller.userAddMoneyProcess(id,
                serviceTrackingController.selectPaymentMethod.value, amount);
            controller.paymentMethod.value =
                serviceTrackingController.selectPaymentMethodName.value;
          }
        },
        borderColor: CustomColor.primaryLightColor,
        buttonColor: CustomColor.primaryLightColor);
  }

  _walletDropDownWidget(BuildContext context) {
    var data = serviceTrackingController.serviceCartModel.data.paymentGateway;
    return Container(
      decoration: BoxDecoration(
          color: CustomColor.whiteColor,
          borderRadius: BorderRadius.circular(Dimensions.radius)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          enableFeedback: true,
          hint: Text(
            serviceTrackingController.selectPaymentMethodName.value,
            style: TextStyle(
              color: CustomColor.primaryLightColor,
              fontSize: Dimensions.headingTextSize4,
              fontWeight: FontWeight.w500,
            ),
          ),
          items: data.map<DropdownMenuItem<PaymentGateway>>(
            (value) {
              return DropdownMenuItem<PaymentGateway>(
                value: value,
                enabled: true,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: Dimensions.heightSize * 0.25),
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "${serviceTrackingController.serviceCartModel.data.baseUrl}/${serviceTrackingController.serviceCartModel.data.imagePath}/${value.gatewayImage}",
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    horizontalSpace(Dimensions.widthSize),
                    Text(
                      value.name,
                      style: TextStyle(
                        color: CustomColor.whiteColor,
                        fontSize: Dimensions.headingTextSize4,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
          onChanged: (PaymentGateway? value) {
            serviceTrackingController.selectPaymentMethod.value = value!.alias;
            serviceTrackingController.selectPaymentMethodName.value =
                value.name;
          },
          dropdownStyleData: const DropdownStyleData(
            decoration: BoxDecoration(
              color: CustomColor.primaryLightColor,
            ),
          ),
          buttonStyleData: ButtonStyleData(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: Dimensions.heightSize * 4,
            width: MediaQuery.sizeOf(context).width,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
    );
  }
}
