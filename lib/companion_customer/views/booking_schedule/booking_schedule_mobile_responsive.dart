import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:intl/intl.dart';

import '/backend/utils/custom_snackbar.dart';
import '../../controller/booking_schedule/booking_schedule_controller.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/appbar/back_button.dart';
import '../../widgets/text_labels/title_heading5_widget.dart';
import '../../widgets/time_picker.dart';

class BookingScheduleMobileResponsive extends StatelessWidget {
  BookingScheduleMobileResponsive({
    super.key,
  });

  final BookingScheduleController controller =
      Get.put(BookingScheduleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
      backgroundColor: CustomColor.primaryLightScaffoldBackgroundColor,
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _headerWidget(context),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.paddingSize,
                  right: Dimensions.paddingSize,
                  top: Dimensions.paddingSize),
              child: Column(
                children: [
                  _datePickerWidget(context),
                  verticalSpace(Dimensions.heightSize),
                  _date2PickerWidget(context),
                  verticalSpace(Dimensions.heightSize),
                  const TimePickerWidget(),
                  verticalSpace(Dimensions.heightSize * 3.33),
                  _buttonWidget(context),
                  _cancelButtonWidget(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //header widget
  _headerWidget(BuildContext context) {
    return Row(
      children: [
        horizontalSpace(Dimensions.widthSize * 1.8),
        BackButtonWidget(onTap: () {
          Get.back();
        }),
        horizontalSpace(Dimensions.widthSize * 5),
        TitleHeading2Widget(
          text: Strings.bookingSchedule.tr,
          fontWeight: FontWeight.w600,
        )
      ],
    );
  }

  // monthly booking dates
  _buttonWidget(BuildContext context) {
    return PrimaryButton(
      title: Strings.save.tr,
      onPressed: () {
        if (controller.dateMain.text.isNotEmpty &&
            controller.date2Main.text.isNotEmpty) {
          if (controller.dateMain.text.compareTo(controller.date2Main.text) <= 0)
            {
              controller.goToAddressScreen();
            }
          else {
            CustomSnackBar.error(Strings.startDateEndDateCompare.tr);
          }
        } else {
          CustomSnackBar.error(Strings.warningDate.tr);
        }
      },
      borderColor: CustomColor.primaryLightColor,
      buttonColor: CustomColor.primaryLightColor,
    );
  }

// cancel button
  _cancelButtonWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.offAllNamed(Routes.bottomNavBar);
      },
      child: TitleHeading5Widget(
        text: Strings.cancel.tr,
        fontWeight: FontWeight.w500,
        padding: EdgeInsets.only(top: Dimensions.paddingSize * 0.75),
        color: CustomColor.primaryLightTextColor.withOpacity(.30),
      ),
    );
  }

  _datePickerWidget(BuildContext context) {
    String formattedDate = DateFormat('d MMM yyyy').format(DateTime.now());

    return Container(
      decoration: BoxDecoration(
        color: CustomColor.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(Dimensions.radius * 2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSize),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            TitleHeading3Widget(
              text: Strings.startDate.tr,
              fontWeight: FontWeight.w600,
              padding: EdgeInsets.only(left: Dimensions.paddingSize * 0.2),
            ),
            verticalSpace(Dimensions.heightSize * 0.9),
            DatePicker(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.242,
              dateTextStyle: CustomStyle.lightHeading1TextStyle
                  .copyWith(fontSize: Dimensions.headingTextSize4),
              dayTextStyle: CustomStyle.lightHeading1TextStyle
                  .copyWith(fontSize: Dimensions.headingTextSize4),
              monthTextStyle: CustomStyle.lightHeading1TextStyle
                  .copyWith(fontSize: Dimensions.headingTextSize4),
              daysCount: 30,
              DateTime.now(),
              // initialSelectedDate: DateTime.now(),
              selectionColor: CustomColor.secondaryLightColor,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                formattedDate = DateFormat('d MMM yyyy').format(date);
                controller.date.text = formattedDate.toString();

                controller.dateMain.text = date.toString();
                debugPrint(controller.dateMain.text);
              },
            ),
          ],
        ),
      ),
    );
  }

  _date2PickerWidget(BuildContext context) {
    String formattedDate = DateFormat('d MMM yyyy').format(DateTime.now());

    return Container(
      decoration: BoxDecoration(
        color: CustomColor.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(Dimensions.radius * 2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSize),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            TitleHeading3Widget(
              text: Strings.endDate.tr,
              fontWeight: FontWeight.w600,
              padding: EdgeInsets.only(left: Dimensions.paddingSize * 0.2),
            ),
            verticalSpace(Dimensions.heightSize * 0.9),
            DatePicker(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.242,
              dateTextStyle: CustomStyle.lightHeading1TextStyle
                  .copyWith(fontSize: Dimensions.headingTextSize4),
              dayTextStyle: CustomStyle.lightHeading1TextStyle
                  .copyWith(fontSize: Dimensions.headingTextSize4),
              monthTextStyle: CustomStyle.lightHeading1TextStyle
                  .copyWith(fontSize: Dimensions.headingTextSize4),
              daysCount: 30,
              DateTime.now(),
              selectionColor: CustomColor.secondaryLightColor,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                formattedDate = DateFormat('d MMM yyyy').format(date);
                controller.date2.text = formattedDate.toString();
                controller.date2Main.text = date.toString();
              },
            ),
          ],
        ),
      ),
    );
  }

//start time
}
