import 'package:intl/intl.dart';
import '/backend/utils/custom_snackbar.dart';
import '/companion_customer/language/language_controller.dart';
import '/companion_direct/widgets/no_data_found_widget.dart';

import '../../../backend/services/api_endpoint.dart';
import '../../../backend/utils/custom_loading_api.dart';
import '../../../companion_customer/controller/address/address_controller.dart';
import '../../../companion_customer/controller/nanny_details/nanny_details_controller.dart';
import '../../controller/babby_sitter/baby_sitter_controller.dart';
import '../../controller/booking_schedule/booking_schedule_controller.dart';
import '../../controller/service_request/service_request_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/appbar/custom_app_bar.dart';
import '../../widgets/baby_card/baby_card_widget.dart';
import '../../widgets/others/custom_image_widget.dart';
import '../../widgets/receipt/receipt_card_widget.dart';
import '../../widgets/schedule/schedule_card.dart';
import '../../widgets/text_labels/title_heading5_widget.dart';

class ServiceRequestMobileResponsive extends StatelessWidget {
  ServiceRequestMobileResponsive({
    super.key,
  });

  final controller = Get.put(BabySitterController());
  final serviceController = Get.put(ServiceRequestController());
  final bookingController = Get.put(BookingScheduleController());
  final addressController = Get.put(AddressController());
  final nannyDetailsController = Get.put(NannyDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.serviceRequest.tr,
        onTap: () {
          Get.toNamed(Routes.nannyScreen);
        },
        leadingPadding: EdgeInsets.only(
          left: Dimensions.paddingSize,
        ),
      ),
      body: Obx(() => serviceController.profileLoading
          ? const CustomLoadingAPI()
          : controller.isLoading
              ? const CustomLoadingAPI()
              : serviceController.isLoading
                  ? const CustomLoadingAPI()
                  : _bodyWidget(context)),
    );
  }

  _bodyWidget(BuildContext context) {
    DateTime day = DateTime.parse(bookingController.dateMain.text);
    DateTime day2 = DateTime.parse(bookingController.date2Main.text);
    Duration differenceDuration = day2.difference(day);
    int finalDay = differenceDuration.inDays + 1;

    int hour = day.hour;
    String amOrPm = (hour < 12) ? 'AM' : 'PM';
    int hourIn12HourFormat = (hour > 12) ? hour - 12 : hour;
    int minutes = day.minute;
    // int dayOfWeek = day.weekday;
    String formattedDate = DateFormat('d').format(day);
    String formattedFullDate = DateFormat('d MMM yyyy').format(day);

    serviceController.startedDateController.text =
        DateFormat('yyyy-MM-dd').format(day);
    serviceController.endDateController.text =
        DateFormat('yyyy-MM-dd').format(day2);
    serviceController.startedTimeController.text = "$hourIn12HourFormat:00";
    serviceController.addressController.text = addressController.combinedText();

    return RefreshIndicator(
      onRefresh: () {
        return serviceController.getProfileData();
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
              left: Dimensions.paddingSize * 0.5,
              right: Dimensions.paddingSize * 0.5,
              top: Dimensions.paddingSize,
              bottom: Dimensions.paddingSize * 0.7),
          child: Column(
            children: [
              _selectBabyWidget(
                  context,
                  nannyDetailsController.professionId == 1
                      ? Strings.selectBaby.tr
                      : "Select Other",
                  nannyDetailsController.professionId == 1
                      ? Strings.addBaby.tr
                      : "Add Other", () {
                nannyDetailsController.professionId == 1
                    ? Get.toNamed(Routes.addBabyScreen)?.then((value) {
                      serviceController.getProfileData();
                })
                    : Get.toNamed(Routes.addPet);
              }),
              verticalSpace(Dimensions.heightSize),
              _babyWidget(context),
              verticalSpace(Dimensions.heightSize),
              _selectBabyWidget(
                  context, Strings.schedule.tr, Strings.editSchedule.tr, () {
                Get.toNamed(Routes.bookingSchedule);
              }),
              verticalSpace(Dimensions.heightSize * 1.33),
              ScheduleCardWidget(
                day: DateFormat('EEEE').format(day),
                day2: DateFormat('EEEE').format(day),
                date: formattedDate,
                date2: "$formattedFullDate ",
                time: serviceController
                    .convertTo12HourFormat(serviceController.timeNow),
                time2: '$hourIn12HourFormat:$minutes $amOrPm',
              ),
              verticalSpace(Dimensions.heightSize * 1.33),
              _selectBabyWidget(
                  context, Strings.address.tr, Strings.editAddress.tr, () {
                serviceController.choice = 1;
                Get.toNamed(Routes.addHomeScreen);
              }),
              verticalSpace(Dimensions.heightSize),
              _addressDetailsWidget(context),
              verticalSpace(Dimensions.heightSize),
              _selectBabyWidget(context, Strings.receipt.tr, '', () {}),
              verticalSpace(Dimensions.heightSize * 1.33),
              nannyDetailsController
                      .nannyDetailsModel.data.nanny.userRequests.isEmpty
                  ? const NoDataFoundWidget()
                  : ReceiptCardWidget(
                      dayDifference: "${finalDay.toString()} ",
                      totalBill:
                          "${finalDay * 10.00} ${nannyDetailsController.nannyDetailsModel.data.nanny.userRequests.first.currencyCode}",
                      nannyBill:
                          "${nannyDetailsController.nannyDetailsModel.data.nanny.nannyProfession.amount} ${nannyDetailsController.nannyDetailsModel.data.nanny.userRequests.first.currencyCode}",
                      charge:
                          "${nannyDetailsController.nannyDetailsModel.data.nanny.nannyProfession.charge}",
                      babyNumber:
                          '1 ${nannyDetailsController.professionId == 1 ? Strings.baby.tr : Strings.pet.tr} ',
                    ),
              verticalSpace(Dimensions.heightSize),
              verticalSpace(Dimensions.heightSize * 2),
              _confirmButtonWidget(context),
              verticalSpace(Dimensions.heightSize),
            ],
          ),
        ),
      ),
    );
  }

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
    var data = serviceController.babyPetGetModel.data.myBaby;
    var data2 = serviceController.babyPetGetModel.data.myPet;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: data.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: nannyDetailsController.professionId == 1
                  ? data.length
                  : data2.length,
              itemBuilder: (BuildContext context, int index) {
                return Obx(() {
                  final itemColor = controller.isItemSelected(index)
                      ? CustomColor.secondaryLightColor
                      : CustomColor.whiteColor;
                  return GestureDetector(
                      onTap: () {
                        controller.selectItem(index);
                        serviceController.addBabyPetIdController =
                            nannyDetailsController.professionId == 1
                                ? data[index].id
                                : data2[index].id;
                      },
                      child: BabyCardWidget(
                        age: nannyDetailsController.professionId == 1
                            ? data[index].professionTypeDetails.babyAge
                            : data2[index].professionTypeDetails.petAge,
                        imagePath: nannyDetailsController.professionId == 1
                            ? data[index].image == ''
                                ? "${ApiEndpoint.mainDomain}/${serviceController.babyPetGetModel.data.defaultImage}"
                                : "${ApiEndpoint.mainDomain}/${serviceController.babyPetGetModel.data.imagePath}/${data[index].image}"
                            : data2[index].image == ''
                                ? "${ApiEndpoint.mainDomain}/${serviceController.babyPetGetModel.data.defaultImage}"
                                : "${ApiEndpoint.mainDomain}/${serviceController.babyPetGetModel.data.imagePath}/${data2[index].image}",
                        name: nannyDetailsController.professionId == 1
                            ? data[index].professionTypeDetails.babyName
                            : data2[index].professionTypeDetails.petName,
                        isIcon: false,
                        borderColor: itemColor,
                      ));
                });
              },
            )
          : data2.isEmpty
              ? const NoDataFoundWidget()
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: nannyDetailsController.professionId == 1
                      ? data.length
                      : data2.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Obx(() {
                      final itemColor = controller.isItemSelected(index)
                          ? CustomColor.secondaryLightColor
                          : CustomColor.whiteColor;
                      return GestureDetector(
                          onTap: () {
                            controller.selectItem(index);
                            serviceController.addBabyPetIdController =
                                nannyDetailsController.professionId == 1
                                    ? data[index].id
                                    : data2[index].id;
                          },
                          child: BabyCardWidget(
                            age: nannyDetailsController.professionId == 1
                                ? data[index].professionTypeDetails.babyAge
                                : data2[index].professionTypeDetails.petAge,
                            imagePath: nannyDetailsController.professionId == 1
                                ? data[index].image == ''
                                    ? "${ApiEndpoint.mainDomain}/${serviceController.babyPetGetModel.data.defaultImage}"
                                    : "${ApiEndpoint.mainDomain}/${serviceController.babyPetGetModel.data.imagePath}/${data[index].image}"
                                : data2[index].image == ''
                                    ? "${ApiEndpoint.mainDomain}/${serviceController.babyPetGetModel.data.defaultImage}"
                                    : "${ApiEndpoint.mainDomain}/${serviceController.babyPetGetModel.data.imagePath}/${data2[index].image}",
                            name: nannyDetailsController.professionId == 1
                                ? data[index].professionTypeDetails.babyName
                                : data2[index].professionTypeDetails.petName,
                            isIcon: false,
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
                text: addressController.combinedText(),
                fontWeight: FontWeight.w500,
                color: CustomColor.primaryLightTextColor.withOpacity(0.30),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //confirm button

  _confirmButtonWidget(BuildContext context) {
    DateTime day = DateTime.parse(bookingController.dateMain.text);

    DateTime day2 = DateTime.parse(bookingController.date2Main.text);
    return Obx(() => serviceController.isLoading
        ? const CustomLoadingAPI()
        : PrimaryButton(
            title: Strings.confirm.tr,
            onPressed: () {
              if (serviceController.addBabyPetIdController == -1) {
                CustomSnackBar.error(Get.find<LanguageController>()
                    .getTranslation("Please select a patient"));
              } else {
                serviceController.serviceRequestProcess(
                    nannyDetailsController.nannyDetailsModel.data.nanny.id,
                    DateFormat('yyyy-MM-dd').format(day),
                    DateFormat('yyyy-MM-dd').format(day2));
              }
            },
            borderColor: CustomColor.primaryLightColor,
            buttonColor: CustomColor.primaryLightColor,
          ));
  }
}
