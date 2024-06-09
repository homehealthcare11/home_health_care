import 'package:flutter/foundation.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

import '../../../backend/services/api_endpoint.dart';
import '../../../backend/utils/custom_snackbar.dart';
import '../../controller/rate_us_controller/rate_us_controller.dart';
import '../../controller/service_tracking/service_tracking_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/appbar/custom_app_bar.dart';
import '../../widgets/nanny_card/nanny_card_widget.dart';
import '../../widgets/others/custom_image_widget.dart';
import '../../widgets/receipt/receipt_card_widget.dart';
import '../../widgets/stepper/stepper_widget.dart';
import '../../widgets/text_labels/title_heading5_widget.dart';
import '/backend/utils/custom_loading_api.dart';
import '/companion_customer/language/language_controller.dart';

class ServiceTrackingMobileResponse extends StatelessWidget {
  ServiceTrackingMobileResponse({
    super.key,
  });

  final controller = Get.put(ServiceTrackingController());
  final int index = Get.arguments;
  final rateUsController = Get.put(RateUsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.serviceTracking.tr,
        onTap: () {
          Get.close(1);
        },
        leadingPadding: EdgeInsets.only(
          left: Dimensions.paddingSize,
        ),
      ),
      body: Obx(() => controller.isLoading
          ? const CustomLoadingAPI()
          : _bodyWidget(context)),
    );
  }

  _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.paddingSize * 0.6,
            right: Dimensions.paddingSize * 0.6),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            _nannyCardWidget(context),
            _viewBillingInformation(context),
            _billingInformation(context),
            verticalSpace(Dimensions.heightSize * 1.33),
            _stepperWidget(context),
            verticalSpace(Dimensions.heightSize * 3.33),
            _performanceReviewButtonWidget(context),
            _paymentMethodButtonWidget(context),
            verticalSpace(Dimensions.heightSize * 1.33),
            Visibility(
              visible: controller.serviceCartModel.data.userRequests[index]
                          .userRequest.status ==
                      0
                  ? true
                  : false,
              child: _cancelServiceButtonWidget(context),
            ),
            verticalSpace(Dimensions.heightSize * 3.33),
          ],
        ),
      ),
    );
  }

  // nanny information card widget
  _nannyCardWidget(BuildContext context) {
    if (kDebugMode) {
      print(controller
          .serviceCartModel.data.userRequests[index].userRequest.nanny.image);
    }
    String amOrPm;
    if (int.parse(controller
            .serviceCartModel.data.userRequests[index].userRequest.startedTime
            .substring(0, 2)) >
        12) {
      amOrPm = "PM";
    } else {
      amOrPm = "AM";
    }

    // int dayOfWeek = day.weekday;
    return NannyCardWidget(
      name:
          "${controller.serviceCartModel.data.userRequests[index].userRequest.nanny.firstname} ${controller.serviceCartModel.data.userRequests[index].userRequest.nanny.lastname} ",
      bio: controller.serviceCartModel.data.userRequests[index].userRequest
          .nanny.nannyProfession.bio,
      serviceDate: controller
          .serviceCartModel.data.userRequests[index].userRequest.startedDate
          .toString()
          .substring(0, 10),
      serviceWeekday: DateFormat('EEEE')
          .format(controller.serviceCartModel.data.userRequests[index]
              .userRequest.startedDate)
          .toString(),
      serviceTime:
          "${controller.serviceCartModel.data.userRequests[index].userRequest.startedTime.substring(0, 5)} $amOrPm - ${controller.serviceCartModel.data.userRequests[index].userRequest.startedTime.substring(0, 5)} $amOrPm",
      address: controller
          .serviceCartModel.data.userRequests[index].userRequest.address,
      selected: controller
          .serviceCartModel.data.userRequests[index].userRequest.status,
      image: controller.serviceCartModel.data.userRequests[index].userRequest
                  .nanny.image ==
              ''
          ? "${ApiEndpoint.mainDomain}/${controller.serviceCartModel.data.defaultImage}"
          : "${ApiEndpoint.mainDomain}/public/frontend/nanny/${controller.serviceCartModel.data.userRequests[index].userRequest.nanny.image}",
      petOrBaby: controller
          .serviceCartModel.data.userRequests[index].userRequest.addBabyPetId,
    );
  }

  //view billing information
  _viewBillingInformation(BuildContext context) {
    return Obx(() => Visibility(
          visible: controller.isChecked.value,
          child: GestureDetector(
            onTap: () {
              controller.isChecked.value = !controller.isChecked.value;
            },
            child: TitleHeading5Widget(
              text: Strings.viewBillingInformation.tr,
              fontWeight: FontWeight.w600,
              color: CustomColor.secondaryLightColor,
              padding: EdgeInsets.only(
                top: Dimensions.paddingSize * 0.333,
                left: Dimensions.paddingSize * 8,
              ),
            ),
          ),
        ));
  }

  // stepper widget
  _stepperWidget(BuildContext context) {
    return Card(
      surfaceTintColor: CustomColor.whiteColor,
      child: Column(
        mainAxisAlignment: mainStart,
        crossAxisAlignment: crossStart,
        children: [
          verticalSpace(Dimensions.heightSize * 2),
          TitleHeading2Widget(
            padding: EdgeInsets.only(left: Dimensions.paddingSize),
            text: Strings.serviceTracking.tr,
            fontWeight: FontWeight.w600,
          ),
          verticalSpace(Dimensions.paddingSize),
          ServiceTrackingStepper(
            activeStep: controller.serviceCartModel.data.userRequests[index]
                        .userRequest.status ==
                    0
                ? -1
                : controller.serviceCartModel.data.userRequests[index]
                            .userRequest.status ==
                        1
                    ? 1
                    : controller.serviceCartModel.data.userRequests[index]
                                .userRequest.status ==
                            4
                        ? 2
                        : 4,
          ),
          verticalSpace(Dimensions.heightSize * 2),
        ],
      ),
    );
  }

  //performance review
  _performanceReviewButtonWidget(BuildContext context) {
    debugPrint(controller
        .serviceCartModel.data.userRequests[index].userRequest.status
        .toString());
    return Visibility(
      visible: controller.serviceCartModel.data.userRequests[index].userRequest
                  .status ==
              5
          ? true
          : false,
      child: PrimaryButton(
        title: Strings.performanceReview.tr,
        onPressed: () {
          _openDialog(context);
        },
        borderColor: CustomColor.primaryLightColor,
        buttonColor: CustomColor.primaryLightColor,
      ),
    );
  }

  // cancel service button widget
  _cancelServiceButtonWidget(BuildContext context) {
    return controller.serviceCancelLoading
        ? const CustomLoadingAPI()
        : PrimaryButton(
            title: Strings.cancelService.tr,
            onPressed: () {
              _logOutDialogueWidget(context);
              // Get.back();
            },
            borderColor: CustomColor.secondaryLightColor,
            buttonColor: CustomColor.secondaryLightColor,
          );
  }

  // billing information details
  _billingInformation(BuildContext context) {
    var data = controller.serviceCartModel.data.userRequests;
    final languageController = Get.put(LanguageController());
    debugPrint("💌🧚‍♀️💗🌨🥡🍥 ${data[index].userRequest.id}");
    return Obx(() => Visibility(
          visible: !controller.isChecked.value,
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              TitleHeading2Widget(
                text: Strings.receipt.tr,
                padding:
                    EdgeInsets.only(bottom: Dimensions.paddingSize * 0.667),
              ),
              ReceiptCardWidget(
                dayDifference:
                    "${data[index].userRequest.serviceDay.toString()} ${languageController.getTranslation(Strings.day.tr)}",
                totalBill:
                    "${double.parse(data[index].userRequest.payable).toStringAsFixed(2)} ${data[index].userRequest.currencyCode}",
                nannyBill:
                    "${data[index].userRequest.nannyCharge.toStringAsFixed(2)} ${data[index].userRequest.currencyCode}/hr",
                charge:
                    "${double.parse(data[index].userRequest.serviceCharge).toStringAsFixed(2)} ${data[index].userRequest.currencyCode}",
                babyNumber: languageController.getTranslation(Strings.baby.tr),
              ),
              _hideBillingInformation(context),
            ],
          ),
        ));
  }

  //hide billing information button
  _hideBillingInformation(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.isChecked.value = !controller.isChecked.value;
      },
      child: TitleHeading5Widget(
        text: Strings.hideBillingInformation.tr,
        fontWeight: FontWeight.w600,
        color: CustomColor.secondaryLightColor,
        padding: EdgeInsets.only(
          top: Dimensions.paddingSize * 0.333,
          left: Dimensions.paddingSize * 8,
        ),
      ),
    );
  }

  //dialog box
  _openDialog(BuildContext context) {
    rateUsController.userRequestId =
        controller.serviceCartModel.data.userRequests[index].userRequest.id;
    final languageController = Get.put(LanguageController());
    return showDialog(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: AlertDialog(
          surfaceTintColor: CustomColor.whiteColor,
          backgroundColor: CustomColor.whiteColor,
          alignment: Alignment.center,
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Builder(
            builder: (context) {
              return SizedBox(
                width: 340.w,
                height: MediaQuery.sizeOf(context).height * 0.64,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: mainStart,
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          height: MediaQuery.of(context).size.height * 0.18,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.elliptical(150, 120),
                              bottomRight: Radius.elliptical(150, 120),
                            ),
                            color: CustomColor.customGreenColor,
                          ),
                        ),
                        verticalSpace(Dimensions.heightSize * 4),
                        Text(
                          languageController
                              .getTranslation(Strings.rateNanny.tr),
                          style: CustomStyle.lightHeading2TextStyle,
                        ),
                        SizedBox(
                          width: Dimensions.widthSize * 25,
                          child: Text(
                            languageController
                                .getTranslation(Strings.tabStart.tr),
                            textAlign: TextAlign.center,
                            style: CustomStyle.lightHeading5TextStyle.copyWith(
                                color: CustomColor.primaryLightTextColor
                                    .withOpacity(0.30)),
                          ),
                        ),
                        verticalSpace(Dimensions.heightSize),
                        RatingBar.builder(
                          initialRating: rateUsController.rating.toDouble(),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            rateUsController.rating = rating.toInt();
                          },
                        ),
                        verticalSpace(Dimensions.heightSize),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSize * 0.5,
                            vertical: Dimensions.paddingSize,
                          ),
                          child: TextFormField(
                            style: CustomStyle.lightHeading4TextStyle,
                            controller: rateUsController.reviewController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: CustomColor.primaryLightTextColor
                                        .withOpacity(
                                            .30)), // Set the line color here
                              ),
                              hintText: languageController
                                  .getTranslation(Strings.serviceExperience.tr),
                              hintStyle: TextStyle(
                                fontSize: Dimensions.headingTextSize3 * 0.8,
                                color: CustomColor.primaryLightTextColor
                                    .withOpacity(.30),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        verticalSpace(Dimensions.heightSize * 0.5),
                        Obx(() => rateUsController.isLoading
                            ? const CustomLoadingAPI()
                            : GestureDetector(
                                onTap: () {
                                  rateUsController.serviceRatingProcess().then(
                                      (value) =>
                                          Get.offAllNamed(Routes.bottomNavBar));
                                },
                                child: Container(
                                  height: 42.h,
                                  width: 133.h,
                                  decoration: BoxDecoration(
                                    color: CustomColor.primaryLightColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.radius * 5),
                                    ),
                                  ),
                                  child: Center(
                                    child: TitleHeading2Widget(
                                      textAlign: TextAlign.center,
                                      text: Strings.submit.tr,
                                      fontWeight: FontWeight.w500,
                                      color: CustomColor.whiteColor,
                                    ),
                                  ),
                                ),
                              )),
                        verticalSpace(Dimensions.heightSize * 0.5),
                      ],
                    ),
                    Positioned(
                      right: 80.w,
                      bottom: 270.h,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: CircleAvatar(
                          radius: Dimensions.radius * 5.375,
                          backgroundImage: NetworkImage(controller
                                      .serviceCartModel
                                      .data
                                      .userRequests[index]
                                      .userRequest
                                      .nanny
                                      .image ==
                                  ""
                              ? "${ApiEndpoint.mainDomain}/${controller.serviceCartModel.data.defaultImage}"
                              : "${ApiEndpoint.mainDomain}/public/frontend/nanny/${controller.serviceCartModel.data.userRequests[index].userRequest.nanny.image}"),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      top: 20,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: CustomImageWidget(path: Assets.icon.cross),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  //payment method button

  _paymentMethodButtonWidget(BuildContext context) {
    var data = controller.serviceCartModel.data.userRequests;
    return Visibility(
      visible: controller.serviceCartModel.data.userRequests[index].userRequest
                  .status ==
              4
          ? true
          : false,
      child: PrimaryButton(
          title: Strings.paymentMethod.tr,
          onPressed: () {
            Get.toNamed(Routes.digitalPaymentScreen, arguments: [
              controller
                  .serviceCartModel.data.userRequests[index].userRequest.id,
              double.parse(data[index].userRequest.payable)
            ]);
          },
          borderColor: CustomColor.primaryLightColor,
          buttonColor: CustomColor.primaryLightColor),
    );
  }

  _logOutDialogueWidget(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: CustomColor.primaryLightColor.withOpacity(0.2),
            alignment: Alignment.center,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Builder(
              builder: (context) {
                var width = MediaQuery.of(context).size.width * 0.90;
                return Container(
                  width: width * 0.84,
                  margin: EdgeInsets.all(Dimensions.paddingSize * 0.3),
                  padding: EdgeInsets.all(Dimensions.paddingSize * 0.9),
                  decoration: BoxDecoration(
                    color: CustomColor.whiteColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 1.4),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: crossCenter,
                    children: [
                      SizedBox(height: Dimensions.heightSize * 2),
                      TitleHeading2Widget(text: Strings.cancelService.tr),
                      verticalSpace(Dimensions.heightSize * 2),
                      TitleHeading4Widget(text: Strings.logMessageOne.tr),
                      verticalSpace(Dimensions.heightSize * 1.75),
                      Row(
                        children: [
                          Obx(() => controller.isLoading
                              ? const CustomLoadingAPI()
                              : Expanded(
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .25,
                                    child: PrimaryButton(
                                      title: Strings.no.tr,
                                      onPressed: () {
                                        Get.back();
                                      },
                                      borderColor:
                                          CustomColor.deleteButtonColor,
                                      buttonColor:
                                          CustomColor.deleteButtonColor,
                                    ),
                                  ),
                                )),
                          horizontalSpace(Dimensions.widthSize * 1.5),
                          Obx(() => controller.isLoading
                              ? const CustomLoadingAPI()
                              : Expanded(
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .25,
                                    child: PrimaryButton(
                                      title: Strings.yes.tr,
                                      onPressed: () {
                                        controller
                                            .serviceCancelProcess(controller
                                                .serviceCartModel
                                                .data
                                                .userRequests[index]
                                                .userRequest
                                                .id)
                                            .then((value) => Get.offAllNamed(
                                                Routes.bottomNavBar))
                                            .then((value) =>
                                                CustomSnackBar.success(Strings
                                                    .successfullyCanceled.tr));
                                        if (kDebugMode) {
                                          print(controller
                                              .serviceCartModel
                                              .data
                                              .userRequests[index]
                                              .userRequest
                                              .id);
                                        }
                                      },
                                      borderColor:
                                          CustomColor.primaryLightColor,
                                      buttonColor:
                                          CustomColor.primaryLightColor,
                                    ),
                                  ),
                                )),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}
