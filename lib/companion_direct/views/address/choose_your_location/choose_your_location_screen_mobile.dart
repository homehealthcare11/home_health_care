import '../../../../custom_assets/assets.gen.dart';
import '../../../controller/address_controller/address_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/others/custom_image_widget.dart';
import '../../../widgets/others/search_box_widget.dart';

class ChooseYourLocationScreenMobile extends StatelessWidget {
  ChooseYourLocationScreenMobile({Key? key}) : super(key: key);
  final controller = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Strings.chooseYourLocation.tr,
          leadingPadding: EdgeInsets.only(left: Dimensions.paddingSize),
          onTap: () {
        Get.back();
      }),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.paddingSize, right: Dimensions.paddingSize),
        child: ListView(
          shrinkWrap: true,
          children: [
            _searchBoxWidget(context),
            _currentLocationButtonWidget(context),
            _setOnMapButtonWidget(context),
            _savedAddressTextWidget(context),
            _savedAddressInfoWidget(context),
          ],
        ),
      ),
    );
  }

// search box
  _searchBoxWidget(BuildContext context) {
    return Column(
      children: [
        verticalSpace(Dimensions.heightSize),
        SearchBoxWidget(hintText: Strings.searchHere.tr),
        verticalSpace(Dimensions.heightSize * 3.33),
      ],
    );
  }

//current location button
  _currentLocationButtonWidget(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
            title: Strings.currentLocation.tr,
            onPressed: () {},
            borderColor: CustomColor.primaryLightColor,
            buttonColor: CustomColor.primaryLightColor),
      ],
    );
  }

  //set on map button widget

  _setOnMapButtonWidget(BuildContext context) {
    return Column(
      children: [
        verticalSpace(Dimensions.heightSize * 1.33),
        PrimaryButton(
            title: Strings.setOnMap.tr,
            onPressed: () {
              controller.goToSetupLocationMap();
            },
            borderColor: CustomColor.secondaryLightColor,
            buttonColor: CustomColor.secondaryLightColor),
        verticalSpace(Dimensions.heightSize * 4.67),
      ],
    );
  }

//saved address text
  _savedAddressTextWidget(BuildContext context) {
    return TitleHeading3Widget(
      fontSize: Dimensions.headingTextSize2 * .95,
      text: Strings.savedAddress.tr,
      fontWeight: FontWeight.w600,
    );
  }

//saved address card info
  _savedAddressInfoWidget(BuildContext context) {
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.155,
        margin: EdgeInsets.only(top: Dimensions.paddingSize * 0.82),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                controller.addressTitle.value = "Add Home";
                controller.goToAddHomeScreen();
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
                      ),
                      TitleHeading4Widget(
                        text: Strings.addAddress.tr,
                        fontWeight: FontWeight.w500,
                        color:
                            CustomColor.primaryLightTextColor.withOpacity(0.30),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            verticalSpace(Dimensions.paddingSize * 0.5),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.paddingSize * 0.85,
                  right: Dimensions.paddingSize * 0.85),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          CustomColor.primaryLightTextColor.withOpacity(0.06),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(Dimensions.radius)),
              ),
            ),
            verticalSpace(Dimensions.paddingSize * 0.5),
            InkWell(
              onTap: () {
                controller.addressTitle.value = "Others";
                controller.goToAddHomeScreen();
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
                      ),
                      TitleHeading4Widget(
                        text: Strings.addAddress.tr,
                        fontWeight: FontWeight.w500,
                        color:
                            CustomColor.primaryLightTextColor.withOpacity(0.30),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
