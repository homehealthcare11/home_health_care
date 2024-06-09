import '../../../../companion_customer/controller/address/address_controller.dart';
import '../../../../companion_customer/custom_assets/assets.gen.dart';
import '../../../../companion_customer/routes/routes.dart';
import '../../../../companion_customer/utils/basic_widget_imports.dart';
import '../../../../companion_customer/widgets/appbar/custom_app_bar.dart';
import '../../../../companion_customer/widgets/buttons/primary_button.dart';
import '../../../../companion_customer/widgets/others/custom_image_widget.dart';
import '../../../../companion_customer/widgets/search_box/search_box_widget.dart';

class ChooseYourLocationMobileScreen extends StatelessWidget {
  ChooseYourLocationMobileScreen({
    super.key,
  });

  final AddressController controller = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
      appBar: CustomAppBar(
        Strings.chooseYourLocation.tr,
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
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.paddingSize, right: Dimensions.paddingSize),
              child: Column(
                mainAxisAlignment: mainStart,
                crossAxisAlignment: crossStart,
                children: [
                  verticalSpace(Dimensions.heightSize * 2.25),
                  _searchBoxWidget(context),
                  verticalSpace(Dimensions.heightSize * 3.33),
                  _currentLocationButtonWidget(context),
                  verticalSpace(Dimensions.heightSize * 1.33),
                  _setOnMapButtonWidget(context),
                  verticalSpace(Dimensions.heightSize * 4.67),
                  _savedAddressTextWidget(context),
                  _savedAddressInfoWidget(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

// search box
  _searchBoxWidget(BuildContext context) {
    return SearchBoxWidget(hintText: Strings.searchHere.tr);
  }

//current location button
  _currentLocationButtonWidget(BuildContext context) {
    return PrimaryButton(
        title: Strings.currentLocation.tr,
        onPressed: () {},
        borderColor: CustomColor.primaryLightColor,
        buttonColor: CustomColor.primaryLightColor);
  }

  //set on map button widget

  _setOnMapButtonWidget(BuildContext context) {
    return PrimaryButton(
        title: Strings.setOnMap.tr,
        onPressed: () {
          Get.toNamed(Routes.setupLocation);
        },
        borderColor: CustomColor.secondaryLightColor,
        buttonColor: CustomColor.secondaryLightColor);
  }

//saved address text
  _savedAddressTextWidget(BuildContext context) {
    return TitleHeading2Widget(
      text: Strings.savedAddress.tr,
      fontWeight: FontWeight.w600,
    );
  }

//saved address card info
  _savedAddressInfoWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goToAddHomeScreen();
      },
      child: Card(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.155,
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
              _dividerLineWidget(context),
              verticalSpace(Dimensions.heightSize),
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
                        color:
                            CustomColor.primaryLightTextColor.withOpacity(0.30),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

// divider line
  _dividerLineWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.paddingSize * 0.8,
          right: Dimensions.paddingSize * 0.8,
          top: Dimensions.paddingSize * 0.4,
          bottom: Dimensions.paddingSize * 0.4),
      child: Container(
        decoration: BoxDecoration(
            color: CustomColor.primaryLightTextColor.withOpacity(0.15),
            border: Border.all(
                color: CustomColor.primaryLightTextColor.withOpacity(0.15),
                width: 0.5)),
      ),
    );
  }
}
