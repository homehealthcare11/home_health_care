import '../../../../../../custom_assets/assets.gen.dart';
import '../../../../../controller/dashboard/profile_controller/digital_payment_controller.dart';
import '../../../../../utils/basic_screen_imports.dart';
import '../../../../../widgets/appbar/custom_app_bar.dart';
import '../../../../../widgets/others/custom_image_widget.dart';

class DigitalPaymentScreenMobile extends StatelessWidget {
  DigitalPaymentScreenMobile({
    super.key,
  });

  final controller = Get.put(DigitalPaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryLightScaffoldBackgroundColor,
      appBar: CustomAppBar(
        Strings.digitalPayment.tr,
        leadingPadding: EdgeInsets.only(left: Dimensions.paddingSize),
        onTap: () {
          Get.back();
        },
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * .90),
      child: Card(
        color: CustomColor.whiteColor,
        elevation: 0,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.155,
          margin: EdgeInsets.only(top: Dimensions.paddingSize * 0.82),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  controller.goToAddCardScreen();
                },
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.paddingSize * 0.875,
                          right: Dimensions.paddingSize * 0.584,
                          bottom: Dimensions.paddingSize * 0.5),
                      child: CustomImageWidget(path: Assets.icon.visacard),
                    ),
                    Column(
                      crossAxisAlignment: crossStart,
                      children: [
                        TitleHeading3Widget(
                          text: Strings.visaCard.tr,
                          fontWeight: FontWeight.w600,
                          padding: EdgeInsets.only(
                              bottom: Dimensions.paddingSize * 0.125),
                        ),
                        TitleHeading4Widget(
                          text: Strings.addCard.tr,
                          fontWeight: FontWeight.w500,
                          color: CustomColor.primaryLightTextColor
                              .withOpacity(0.30),
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
                        color:
                            CustomColor.primaryLightTextColor.withOpacity(0.06),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(Dimensions.radius)),
                ),
              ),
              verticalSpace(Dimensions.paddingSize * 0.45),
              GestureDetector(
                onTap: () {
                  controller.goToAddCardScreen();
                },
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.paddingSize * 0.875,
                          right: Dimensions.paddingSize * 0.584,
                          bottom: Dimensions.paddingSize * 0.5),
                      child: CustomImageWidget(path: Assets.icon.mastercard),
                    ),
                    Column(
                      crossAxisAlignment: crossStart,
                      children: [
                        TitleHeading3Widget(
                          text: Strings.mastercard.tr,
                          fontWeight: FontWeight.w600,
                          padding: EdgeInsets.only(
                              bottom: Dimensions.paddingSize * 0.125),
                        ),
                        TitleHeading4Widget(
                          text: Strings.addCard.tr,
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
    );
  }
}
