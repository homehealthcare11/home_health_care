import '/companion_customer/controller/address/address_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/appbar/custom_app_bar.dart';
import '../../widgets/others/custom_image_widget.dart';

class SavedAddressMobileResponsive extends StatelessWidget {
  SavedAddressMobileResponsive({
    super.key,
  });

  final controller = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.savedAddress.tr,
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
      padding: EdgeInsets.only(
          left: Dimensions.paddingSize, right: Dimensions.paddingSize),
      child: Column(
        children: [
          Card(
            surfaceTintColor: CustomColor.whiteColor,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              margin: EdgeInsets.only(top: Dimensions.paddingSize * 0.82),
              child: Column(
                children: [
                  Row(
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
                          ),
                          SizedBox(
                            width: Dimensions.widthSize * 20,
                            child: TitleHeading4Widget(
                              maxLines: 3,
                              text: controller.combinedText(),
                              fontWeight: FontWeight.w500,
                              color: CustomColor.primaryLightTextColor
                                  .withOpacity(0.30),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  _dividerLineWidget(context),
                  Row(
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
                            text: Strings.office.tr,
                            fontWeight: FontWeight.w600,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // divider line widget
  _dividerLineWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.paddingSize * 0.8,
          right: Dimensions.paddingSize * 0.8,
          top: Dimensions.paddingSize * 0.5,
          bottom: Dimensions.paddingSize * 0.8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: CustomColor.primaryLightTextColor.withOpacity(0.05),
              width: 1),
        ),
      ),
    );
  }
}
