import '../../../../../custom_assets/assets.gen.dart';
import '../../../../controller/address_controller/address_controller.dart';
import '../../../../controller/dashboard/profile_controller/saved_address_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/appbar/custom_app_bar.dart';
import '../../../../widgets/others/custom_image_widget.dart';

class SavedAddressScreenMobile extends StatelessWidget {
  SavedAddressScreenMobile({
    super.key,
  });

  final controller = Get.put(SavedAddressController());
  final addressController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryLightScaffoldBackgroundColor,
      appBar: CustomAppBar(
        Strings.savedAddress.tr,
        leadingPadding: EdgeInsets.only(left: Dimensions.paddingSize),
        onTap: () {
          Get.back();
        },
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * .90),
          child: Card(
            color: CustomColor.whiteColor,
            elevation: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.165,
              margin: EdgeInsets.only(top: Dimensions.paddingSize * 0.82),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // controller.goToAddCardScreen();
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.paddingSize * 0.875,
                              right: Dimensions.paddingSize * 0.584,
                              bottom: Dimensions.paddingSize * 0.5),
                          child: CustomImageWidget(path: Assets.icon.home),
                        ),
                        Column(
                          crossAxisAlignment: crossStart,
                          children: [
                            TitleHeading3Widget(
                              text: Strings.home.tr,
                              fontWeight: FontWeight.w600,
                              padding: EdgeInsets.only(
                                  bottom: Dimensions.paddingSize * 0.125),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .64,
                              child: TitleHeading4Widget(
                                text: Strings.dashboardAddress.tr,
                                fontWeight: FontWeight.w500,
                                color: CustomColor.primaryLightTextColor
                                    .withOpacity(0.30),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(Dimensions.paddingSize * 0.45),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Dimensions.paddingSize * 0.85,
                        right: Dimensions.paddingSize * 0.85),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: CustomColor.primaryLightTextColor
                                .withOpacity(0.06),
                            width: 1,
                          ),
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius)),
                    ),
                  ),
                  verticalSpace(Dimensions.paddingSize * 0.45),
                  GestureDetector(
                    onTap: () {
                      // controller.goToAddCardScreen();
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.paddingSize * 0.875,
                              right: Dimensions.paddingSize * 0.584,
                              bottom: Dimensions.paddingSize * 0.5),
                          child: CustomImageWidget(path: Assets.icon.office),
                        ),
                        Column(
                          crossAxisAlignment: crossStart,
                          children: [
                            TitleHeading3Widget(
                              text: Strings.other.tr,
                              fontWeight: FontWeight.w600,
                              padding: EdgeInsets.only(
                                  bottom: Dimensions.paddingSize * 0.125),
                            ),
                            TitleHeading4Widget(
                              text: Strings.addAddress.tr,
                              fontWeight: FontWeight.w500,
                              color: CustomColor.primaryLightTextColor
                                  .withOpacity(0.30),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        verticalSpace(Dimensions.heightSize),
        _buttonWidget(context)
      ],
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: Dimensions.marginSizeVertical,
          horizontal: Dimensions.paddingSize * .90),
      child: PrimaryButton(
        title: Strings.addNewAddress.tr,
        onPressed: () {
          addressController.addressTitle.value = "Add New Address";
          controller.goToAddressInputScreen();
        },
        borderColor: Theme.of(context).primaryColor,
        buttonColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
