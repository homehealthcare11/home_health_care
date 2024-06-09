import '../../../controller/address/address_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/inputs/custom_input_widget.dart';
import '/companion_customer/controller/service_request/service_request_controller.dart';

class AddHomeMobileResponsive extends StatelessWidget {
  AddHomeMobileResponsive({
    super.key,
  });

  final AddressController controller = Get.put(AddressController());

  final serviceController = Get.put(ServiceRequestController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
      appBar: CustomAppBar(
        Strings.addHome.tr,
        onTap: () {
          Get.back();
        },
        leadingPadding: EdgeInsets.only(
          left: Dimensions.paddingSize,
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.paddingSize * 0.8,
            right: Dimensions.paddingSize * 0.8),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      _textInputWidget(context, controller.flatNoTextController,
                          Strings.flatNo.tr, Strings.enterFlatNo.tr),
                      _textInputWidget(
                          context,
                          controller.streetNoTextController,
                          Strings.street.tr,
                          Strings.enterStreetNo.tr),
                      _textInputWidget(context, controller.cityTextController,
                          Strings.city.tr, Strings.enterCity),
                    ],
                  ),
                  horizontalSpace(Dimensions.widthSize * 1.6),
                  Column(
                    children: [
                      _textInputWidget(
                          context,
                          controller.houseNoTextController,
                          Strings.houseNo.tr,
                          Strings.enterHouseNo.tr),
                      _textInputWidget(context, controller.areaTextController,
                          Strings.area.tr, Strings.enterAreaNo.tr),
                      _zipCodeInputWidget(
                          context,
                          controller.zipCodeTextController,
                          Strings.zipCode.tr,
                          Strings.enterZipCode.tr),
                    ],
                  )
                ],
              ),
              _textStateInputWidget(
                  context, controller.stateTextController, Strings.state.tr),
              verticalSpace(Dimensions.heightSize * 2),
              _saveAddressButton(context),
            ],
          ),
        ),
      ),
    );
  }

// text input field
  _textInputWidget(BuildContext context, TextEditingController controller,
      String text, String hintText) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.421,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          TitleHeading3Widget(
            text: text,
            fontWeight: FontWeight.w500,
            color: CustomColor.blackColor,
            padding: EdgeInsets.only(top: Dimensions.paddingSize * 0.667),
          ),
          verticalSpace(Dimensions.heightSize * 0.667),
          CustomInputWidget(
            controller: controller,
            hintText: hintText,
            borderColor: CustomColor.blackColor.withOpacity(0.15),
            paddings: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
            color: Colors.transparent,
            // width: MediaQuery.of(context).size.width * 0,
          ),
        ],
      ),
    );
  }

  _textStateInputWidget(
      BuildContext context, TextEditingController controller, String text) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          TitleHeading3Widget(
            text: text,
            fontWeight: FontWeight.w500,
            color: CustomColor.blackColor,
            padding: EdgeInsets.only(top: Dimensions.paddingSize * 0.667),
          ),
          verticalSpace(Dimensions.heightSize * 0.667),
          CustomInputWidget(
            controller: controller,
            hintText: Strings.enterState,
            borderColor: CustomColor.blackColor.withOpacity(0.15),
            paddings: EdgeInsets.only(left: Dimensions.paddingSize),
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }

  _saveAddressButton(BuildContext context) {
    return PrimaryButton(
      title: Strings.savedAddress.tr,
      onPressed: () {
        if (formKey.currentState!.validate()) {
          debugPrint("🎨🎨🎨🎨🎨🎨🎨🎨 ${serviceController.choice.toString()}");
          if (serviceController.choice == 0) {
            Get.toNamed(Routes.bookingSchedule);
          } else {
            Get.toNamed(Routes.serviceRequestScreen);
          }

          debugPrint(controller.combinedText());
        }
      },
      borderColor: CustomColor.primaryLightColor,
      buttonColor: CustomColor.primaryLightColor,
    );
  }

  _zipCodeInputWidget(BuildContext context, TextEditingController controller,
      String text, String hintText) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.421,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          TitleHeading3Widget(
            text: text,
            fontWeight: FontWeight.w500,
            color: CustomColor.blackColor,
            padding: EdgeInsets.only(top: Dimensions.paddingSize * 0.667),
          ),
          verticalSpace(Dimensions.heightSize * 0.667),
          CustomInputWidget(
            controller: controller,
            hintText: hintText,
            borderColor: CustomColor.blackColor.withOpacity(0.15),
            paddings: EdgeInsets.only(left: Dimensions.paddingSize),
            color: Colors.transparent,
            keyboardType: TextInputType.text,
            // width: MediaQuery.of(context).size.width * 0,
          ),
        ],
      ),
    );
  }
}
