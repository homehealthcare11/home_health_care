import '../../../controller/address_controller/address_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/inputs/custom_input_widget.dart';

class AddHomeScreenMobile extends StatelessWidget {
  AddHomeScreenMobile({Key? key}) : super(key: key);

  final controller = Get.put(AddressController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        controller.addressTitle.value,
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
            paddings: EdgeInsets.only(left: Dimensions.paddingSize),
            color: Colors.transparent,
            // width: MediaQuery.of(context).size.width * 0,
          ),
        ],
      ),
    );
  } // text input field

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
            keyboardType: const TextInputType.numberWithOptions(),
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
            // width: MediaQuery.of(context).size.width * 0,
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
          controller.goToSaveAddressCongratulationScreen();
        }
      },
      borderColor: CustomColor.primaryLightColor,
      buttonColor: CustomColor.primaryLightColor,
    );
  }
}
