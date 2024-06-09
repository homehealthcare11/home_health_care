import 'package:intl/intl.dart';

import '../../../../backend/utils/custom_loading_api.dart';
import '../../../../custom_assets/assets.gen.dart';
import '../../../controller/dashboard/dashboard/dashboard_controller.dart';
import '../../../controller/dashboard/service_tracking/service_tracking_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/others/custom_image_widget.dart';
import '../../../widgets/others/receipt_card_widget.dart';
import '../../../widgets/others/service_tracking_stepper.dart';
import '../../../widgets/text_labels/title_heading5_widget.dart';
import '/backend/utils/custom_snackbar.dart';
import '/companion_customer/language/language_controller.dart';

class ServiceRequestScreenMobile extends StatelessWidget {
  ServiceRequestScreenMobile({
    super.key,
  });

  final controller = Get.put(ServiceTrackingController());
  final dashboardController = Get.put(DashboardController());
  final int index = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.serviceTracking.tr,
        onTap: () {
          Get.back();
        },
        leadingPadding: EdgeInsets.only(
          left: Dimensions.paddingSize * .90,
        ),
      ),
      body: Obx(() => controller.isUpdateLoading
          ? const CustomLoadingAPI()
          : _bodyWidget(context)),
    );
  }

  _bodyWidget(BuildContext context) {
    var data = dashboardController.serviceRequestModel.data.userRequest;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.paddingSize * 0.6,
            right: Dimensions.paddingSize * 0.6),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            _serviceWidget(context),
            _viewBillingInformation(context),
            _billingInformation(context),
            verticalSpace(Dimensions.heightSize * 1.33),
            _stepperWidget(context),
            verticalSpace(Dimensions.heightSize * 3.33),
            Visibility(
              visible: data[index].status == 0 ? true : false,
              child: _requestAccepted(context),
            ),
            Visibility(
              visible: data[index].status == 1 ? true : false,
              child: _taskComplete(context),
            ),
            verticalSpace(Dimensions.heightSize * 1.33),
            Visibility(
              visible: data[index].status == 0 ? true : false,
              child: _cancelServiceButtonWidget(context),
            )
          ],
        ),
      ),
    );
  }

  _serviceWidget(BuildContext context) {
    var data = dashboardController.serviceRequestModel.data.userRequest;
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    String amOrPm;
    if (int.parse(data[index].startedTime.substring(0, 2)) > 12) {
      amOrPm = "PM";
    } else {
      amOrPm = "AM";
    }

    return Container(
      height: isTablet()
          ? MediaQuery.of(context).size.height * .275
          : MediaQuery.of(context).size.height * .22,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimensions.radius * 2,
        ),
        color: CustomColor.whiteColor,
      ),
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginSizeVertical * 0.4,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize * 0.5,
        vertical: Dimensions.paddingSize * 0.5,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  height: isTablet() ? 125.h : 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius),
                    color: Colors.black,
                    image: DecorationImage(
                        image: NetworkImage(data[index].user.userImage ?? ""),
                        fit: BoxFit.cover),
                  ),
                ),
                verticalSpace(Dimensions.heightSize * .8),
                Container(
                  decoration: BoxDecoration(
                      color: CustomColor.secondaryDarkColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius)),
                  child: TitleHeading5Widget(
                    text: data[index].serviceType == 1
                        ? Strings.babySitter.tr
                        : Strings.petSitter.tr,
                    padding: EdgeInsets.symmetric(
                        vertical: Dimensions.paddingSize * .10,
                        horizontal: Dimensions.paddingSize * .15),
                    color: CustomColor.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          horizontalSpace(Dimensions.paddingSize * .5),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: crossStart,
                      children: [
                        Row(
                          mainAxisAlignment: mainStart,
                          children: [
                            TitleHeading4Widget(
                              text: data[index].user.username ?? "",
                              fontSize: Dimensions.headingTextSize3,
                              fontWeight: FontWeight.w600,
                            ),
                            horizontalSpace(Dimensions.paddingSize * .15),
                            Container(
                              decoration: BoxDecoration(
                                color: data[index].status == 0
                                    ? CustomColor.primaryLightColor
                                    : data[index].status == 1
                                        ? CustomColor.greenColor
                                        : data[index].status == 4
                                            ? CustomColor.secondaryLightColor
                                            : data[index].status == 2
                                                ? CustomColor.redColor
                                                : CustomColor.greenColor,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius * .25),
                              ),
                              child: TitleHeading5Widget(
                                text: data[index].status == 0
                                    ? Strings.pending.tr
                                    : data[index].status == 1
                                        ? Strings.accept.tr
                                        : data[index].status == 4
                                            ? Strings.complete.tr
                                            : data[index].status == 2
                                                ? Strings.reject.tr
                                                : Strings.paid.tr,
                                padding: EdgeInsets.symmetric(
                                    vertical: Dimensions.paddingSize * .05,
                                    horizontal: Dimensions.paddingSize * .10),
                                color: CustomColor.whiteColor,
                              ),
                            ),
                          ],
                        ),
                        TitleHeading5Widget(
                          text: Strings.userLookingFor.tr,
                          color: CustomColor.primaryLightTextColor
                              .withOpacity(.35),
                        ),
                      ],
                    )
                  ],
                ),
                Divider(
                  thickness: Dimensions.heightSize * .15,
                  color: Get.isDarkMode
                      ? CustomColor.primaryDarkTextColor.withOpacity(.15)
                      : CustomColor.primaryLightTextColor.withOpacity(.15),
                ),
                //date and time widget
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: crossStart,
                      children: [
                        Row(
                          children: [
                            TitleHeading4Widget(
                              text: data[index]
                                  .startedDate
                                  .toString()
                                  .substring(0, 10),
                              color: CustomColor.primaryLightTextColor
                                  .withOpacity(.30),
                              fontWeight: FontWeight.w600,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.paddingSize * .20),
                              child: CircleAvatar(
                                backgroundColor: CustomColor
                                    .primaryLightTextColor
                                    .withOpacity(.30),
                                radius: Dimensions.radius * .25,
                              ),
                            ),
                            TitleHeading4Widget(
                              text: DateFormat('EEEE')
                                  .format(data[index].startedDate),
                              color: CustomColor.primaryLightTextColor
                                  .withOpacity(.30),
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        TitleHeading2Widget(
                          text:
                              "${data[index].startedTime.substring(0, 5)} $amOrPm",
                          color: CustomColor.primaryLightTextColor
                              .withOpacity(.40),
                          fontSize: Dimensions.headingTextSize4,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  thickness: Dimensions.heightSize * .15,
                  color: Get.isDarkMode
                      ? CustomColor.primaryDarkTextColor.withOpacity(.15)
                      : CustomColor.primaryLightTextColor.withOpacity(.15),
                ),
                //address widget
                Row(
                  children: [
                    CustomImageWidget(
                        path: Assets.icon.address2,
                        height: Dimensions.heightSize * 1.2),
                    horizontalSpace(Dimensions.marginSizeHorizontal * .25),
                    Expanded(
                      child: TitleHeading5Widget(
                          text:
                              "${data[index].user.address.address}, ${data[index].user.address.state}, ${data[index].user.address.city}, ${data[index].user.address.country}",
                          color: Get.isDarkMode
                              ? CustomColor.primaryDarkTextColor
                                  .withOpacity(.30)
                              : CustomColor.primaryLightTextColor
                                  .withOpacity(.30),
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
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
    var data = dashboardController.serviceRequestModel.data.userRequest;
    return Container(
      height: MediaQuery.of(context).size.height * .22,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimensions.radius * 2,
        ),
        color: CustomColor.whiteColor,
      ),
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginSizeVertical * 0.4,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize * 0.8,
        vertical: Dimensions.paddingSize * 0.4,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          verticalSpace(Dimensions.heightSize),
          TitleHeading2Widget(text: Strings.serviceTracking.tr),
          // verticalSpace(Dimensions.heightSize),
          ServiceTrackingStepper(
            activeStep: data[index].status == 0
                ? -1
                : data[index].status == 1
                    ? 0
                    : data[index].status == 4
                        ? 2
                        : data[index].status == 2
                            ? -1
                            : 4,
          ),
        ],
      ),
    );
  }

  //performance review
  _requestAccepted(BuildContext context) {
    var data = dashboardController.serviceRequestModel.data.userRequest;
    final languageController = Get.put(LanguageController());
    return Obx(
      () => controller.isUpdateLoading
          ? const CustomLoadingAPI()
          : PrimaryButton(
              title: Strings.requestAccept.tr,
              onPressed: () {
                controller.serviceAcceptProcess(data[index].id).then(
                      (value) => CustomSnackBar.success(
                        languageController
                            .getTranslation(Strings.successfullySubmitted.tr),
                      ),
                    );
                debugPrint(data[index].status.toString());
              },
              borderColor: CustomColor.secondaryLightColor,
              buttonColor: CustomColor.secondaryLightColor,
            ),
    );
  }

  //performance review
  _taskComplete(BuildContext context) {
    var data = dashboardController.serviceRequestModel.data.userRequest;
    final languageController = Get.put(LanguageController());
    return Obx(
      () => controller.isUpdateLoading
          ? const CustomLoadingAPI()
          : PrimaryButton(
              title: Strings.taskComplete.tr,
              onPressed: () {
                controller.serviceRequestTaskCompete(data[index].id).then(
                      (value) => CustomSnackBar.success(
                        languageController
                            .getTranslation(Strings.successfullySubmitted.tr),
                      ),
                    );
                debugPrint(data[index].status.toString());
              },
              borderColor: CustomColor.primaryLightColor,
              buttonColor: CustomColor.primaryLightColor,
            ),
    );
  }

  // cancel service button widget
  _cancelServiceButtonWidget(BuildContext context) {
    return PrimaryButton(
      title: Strings.cancelRequest.tr,
      onPressed: () {
        _logOutDialogueWidget(context);
      },
      borderColor: CustomColor.primaryLightColor,
      buttonColor: CustomColor.primaryLightColor,
    );
  }

  // billing information details
  _billingInformation(BuildContext context) {
    var data = dashboardController.serviceRequestModel.data.userRequest;
    final languageController = Get.put(LanguageController());
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
                babyNumber: Strings.pet.tr,
                dayNumber:
                    "${data[index].serviceDay.toString()} ${languageController.getTranslation(Strings.day.tr)}",
                nannyBill:
                    '${data[index].total} ${data[index].currencyCode}/hr',
                charge:
                    '${double.parse(data[index].serviceCharge).toStringAsFixed(2)} ${data[index].currencyCode}',
                total:
                    '${double.parse(data[index].payable).toStringAsFixed(2)} ${data[index].currencyCode}',
              ),
              _hideBillingInformation(context), //
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

  _logOutDialogueWidget(
    BuildContext context,
  ) {
    var data = dashboardController.serviceRequestModel.data.userRequest;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: CustomColor.primaryLightColor.withOpacity(0.2),
            alignment: Alignment.center,
            // insetPadding: EdgeInsets.all(Dimensions.paddingSize * 0.1),
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
                      TitleHeading2Widget(text: Strings.cancelRequest.tr),
                      verticalSpace(Dimensions.heightSize * 2),
                      TitleHeading4Widget(text: Strings.logMessageCancel.tr),
                      verticalSpace(Dimensions.heightSize * 1.75),
                      Row(
                        mainAxisAlignment: mainCenter,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .25,
                            child: PrimaryButton(
                              title: Strings.no.tr,
                              onPressed: () {
                                Get.back();
                              },
                              borderColor: CustomColor.primaryLightColor,
                              buttonColor: CustomColor.primaryLightColor,
                            ),
                          ),
                          horizontalSpace(Dimensions.widthSize * 1.5),
                          Obx(() => controller.isCancelLoading
                              ? const CustomLoadingAPI()
                              : SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .25,
                                  child: PrimaryButton(
                                    title: Strings.yes.tr,
                                    onPressed: () {
                                      controller
                                          .serviceCancelProcess(data[index].id)
                                          .then((value) => CustomSnackBar.error(
                                              Get.find<LanguageController>()
                                                  .getTranslation(
                                                      Strings.rejected.tr)));
                                      debugPrint(data[index].status.toString());
                                    },
                                    borderColor: CustomColor.deleteButtonColor,
                                    buttonColor: CustomColor.deleteButtonColor,
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
