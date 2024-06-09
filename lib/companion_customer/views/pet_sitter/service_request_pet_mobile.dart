import '../../controller/babby_sitter/baby_sitter_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/appbar/custom_app_bar.dart';
import '../../widgets/baby_card/baby_card_widget.dart';
import '../../widgets/others/custom_image_widget.dart';
import '../../widgets/receipt/receipt_card_widget.dart';
import '../../widgets/schedule/schedule_card.dart';
import '../../widgets/text_labels/title_heading5_widget.dart';

class ServiceRequestPetMobileResponsive extends StatelessWidget {
  ServiceRequestPetMobileResponsive({
    super.key,
  });

  final controller = Get.put(BabySitterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.serviceRequest.tr,
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
            left: Dimensions.paddingSize * 0.5,
            right: Dimensions.paddingSize * 0.5,
            top: Dimensions.paddingSize,
            bottom: Dimensions.paddingSize * 0.7),
        child: Column(
          children: [
            _selectBabyWidget(context, Strings.selectPet.tr, Strings.addPet.tr,
                () {
              Get.toNamed(Routes.addPet);
            }),
            verticalSpace(Dimensions.heightSize),
            _babyWidget(context),
            verticalSpace(Dimensions.heightSize),
            _selectBabyWidget(
                context, Strings.schedule.tr, Strings.editSchedule.tr, () {}),
            verticalSpace(Dimensions.heightSize * 1.33),
            const ScheduleCardWidget(
              day: '',
              day2: '',
              date: '',
              date2: '',
              time: '',
              time2: '',
            ),
            verticalSpace(Dimensions.heightSize * 1.33),
            _selectBabyWidget(
                context, Strings.address.tr, Strings.editAddress.tr, () {
              Get.toNamed(Routes.addHomeScreen);
            }),
            verticalSpace(Dimensions.heightSize),
            _addressDetailsWidget(context),
            verticalSpace(Dimensions.heightSize),
            _selectBabyWidget(context, Strings.receipt.tr, '', () {}),
            verticalSpace(Dimensions.heightSize * 1.33),
            const ReceiptCardWidget(
              dayDifference: '',
              totalBill: '',
              nannyBill: '',
              charge: '',
              babyNumber: '',
            ),
            verticalSpace(Dimensions.heightSize),
            _selectBabyWidget(context, Strings.paymentMethod.tr, '', () {}),
            _monthlyBookingWidget(context),
            verticalSpace(Dimensions.heightSize * 2),
            _confirmButtonWidget(context),
            verticalSpace(Dimensions.heightSize),
          ],
        ),
      ),
    );
  }

  // select baby and add baby widget

  // select baby and add baby widget
  _selectBabyWidget(BuildContext context, String text1, String text2,
      void Function()? onTap) {
    return Row(
      mainAxisAlignment: mainSpaceBet,
      children: [
        TitleHeading2Widget(
          text: text1,
          fontWeight: FontWeight.w600,
        ),
        GestureDetector(
          onTap: onTap,
          child: TitleHeading5Widget(
            text: text2,
            fontWeight: FontWeight.w600,
            color: CustomColor.secondaryLightColor,
          ),
        )
      ],
    );
  }

  // show case baby
  _babyWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 3, // The number of items in the list
        itemBuilder: (BuildContext context, int index) {
          return Obx(() {
            final itemColor = controller.isItemSelected(index)
                ? CustomColor.secondaryLightColor
                : CustomColor.whiteColor;
            return GestureDetector(
                onTap: () {
                  // Get.toNamed(Routes.addBabyScreen);
                  controller.selectItem(index);
                },
                child: BabyCardWidget(
                  age: '1.5 years',
                  imagePath: Assets.baby.daysOfChristmasWidePic.path,
                  name: 'Pet Name',
                  borderColor: itemColor,
                ));
          });
        },
      ),
    );
  }

//address
  _addressDetailsWidget(BuildContext context) {
    return Card(
      surfaceTintColor: CustomColor.whiteColor,
      child: Padding(
        padding: EdgeInsets.only(
            top: Dimensions.paddingSize * 0.875,
            bottom: Dimensions.paddingSize * 0.875),
        child: Row(
          children: [
            horizontalSpace(Dimensions.widthSize * 2),
            CustomImageWidget(
              path: Assets.icon.address,
              height: Dimensions.heightSize * 3.71416,
              width: Dimensions.widthSize * 4.457,
            ),
            horizontalSpace(Dimensions.widthSize * 1.243),
            SizedBox(
              width: Dimensions.widthSize * 20,
              child: TitleHeading4Widget(
                text:
                    '4598 Veltri Drive, Alakanuk, Alaska - 99554, United State.',
                fontWeight: FontWeight.w500,
                color: CustomColor.primaryLightTextColor.withOpacity(0.30),
              ),
            )
          ],
        ),
      ),
    );
  }

  // monthly booking
  _monthlyBookingWidget(BuildContext context) {
    return Card(
      surfaceTintColor: CustomColor.whiteColor,
      child: Padding(
        padding: EdgeInsets.only(
          left: Dimensions.paddingSize * 0.8,
          right: Dimensions.paddingSize * 0.7,
          top: Dimensions.paddingSize * 0.833,
          bottom: Dimensions.paddingSize * 0.8,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: mainSpaceBet,
              children: [
                TitleHeading3Widget(
                  text: Strings.cashOnService.tr,
                  fontWeight: FontWeight.w600,
                ),
                _checkBox(context, () {
                  controller.isChecked.value = !controller.isChecked.value;
                }, CustomColor.secondaryLightColor, CustomColor.whiteColor),
              ],
            ),
            verticalSpace(Dimensions.heightSize),
            Divider(
              height: 1.3,
              color: CustomColor.primaryLightTextColor.withOpacity(0.15),
            ),
            verticalSpace(Dimensions.heightSize),
            Row(
              mainAxisAlignment: mainSpaceBet,
              children: [
                TitleHeading3Widget(
                  text: Strings.digitalPayment.tr,
                  fontWeight: FontWeight.w600,
                ),
                _checkBox(context, () {
                  controller.isChecked.value = !controller.isChecked.value;
                }, CustomColor.whiteColor, CustomColor.secondaryLightColor),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _checkBox(BuildContext context, void Function()? onTap, Color color1,
      Color color2) {
    return Obx(() {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(Dimensions.radius * 5),
              ),
              border: Border.all(
                  color: CustomColor.secondaryLightColor, width: 2.0)),
          child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSize * 0.1),
            child: CircleAvatar(
              radius: Dimensions.radius * 0.7,
              backgroundColor: controller.isChecked.value ? color1 : color2,
            ),
          ),
        ),
      );
    });
  }

  //confirm button

  _confirmButtonWidget(BuildContext context) {
    return PrimaryButton(
      title: Strings.confirm.tr,
      onPressed: () {
        Get.toNamed(Routes.babySitterCongratulation);
      },
      borderColor: CustomColor.primaryLightColor,
      buttonColor: CustomColor.primaryLightColor,
    );
  }
}
