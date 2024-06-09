import '../../utils/basic_screen_imports.dart';

class ScheduleCardWidget extends StatelessWidget {
  const ScheduleCardWidget(
      {Key? key,
      required this.day,
      required this.day2,
      required this.date,
      required this.date2,
      required this.time,
      required this.time2})
      : super(key: key);
  final String day, day2, date, date2, time, time2;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: CustomColor.whiteColor,
      child: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSize * 0.625),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.112,
              width: MediaQuery.of(context).size.width * 0.242,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dimensions.radius),
                  ),
                  color: CustomColor.secondaryLightColor),
              child: Column(
                mainAxisAlignment: mainCenter,
                crossAxisAlignment: crossCenter,
                children: [
                  TitleHeading1Widget(
                    text: date,
                    color: CustomColor.whiteColor,
                  ),
                  TitleHeading4Widget(
                    text: day,
                    color: CustomColor.whiteColor,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            horizontalSpace(Dimensions.widthSize * 1.243),
            Column(
              crossAxisAlignment: crossStart,
              children: [
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    TitleHeading3Widget(
                      text: date2,
                      fontWeight: FontWeight.w600,
                      color:
                          CustomColor.primaryLightTextColor.withOpacity(0.30),
                    ),
                    TitleHeading3Widget(
                      text: day2,
                      fontWeight: FontWeight.w600,
                      color:
                          CustomColor.primaryLightTextColor.withOpacity(0.30),
                    ),
                  ],
                ),
                verticalSpace(Dimensions.heightSize),
                Row(
                  // mainAxisAlignment: mainSpaceBet,
                  children: [
                    TitleHeading2Widget(
                      text: time,
                      color:
                          CustomColor.primaryLightTextColor.withOpacity(0.30),
                      fontSize: Dimensions.headingTextSize1 * 0.792,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
