import '../../utils/basic_screen_imports.dart';
import '../text_labels/title_heading5_widget.dart';

class NotificationCardLog extends StatelessWidget {
  const NotificationCardLog(
      {Key? key,
      required this.title,
      required this.msg,
      required this.date,
      required this.month})
      : super(key: key);
  final String title, msg;
  final String date, month;

//transaction history card contains date, transaction number, email, money
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: CustomColor.whiteColor,
      child: SizedBox(
        // height: Dimensions.heightSize * 6,
        child: Padding(
          padding: EdgeInsets.only(
            top: Dimensions.paddingSize * 0.667,
            bottom: Dimensions.paddingSize * 0.5,
            left: Dimensions.paddingSize * 0.667,
            right: Dimensions.paddingSize * 0.667,
          ),
          child: Row(
            children: [
              Column(
                children: [
                  TitleHeading1Widget(
                    text: date,
                    fontWeight: FontWeight.w600,
                    color: CustomColor.primaryLightTextColor,
                  ),
                  TitleHeading4Widget(
                    text: month,
                    fontWeight: FontWeight.w500,
                    color: CustomColor.primaryLightTextColor,
                  ),
                ],
              ),
              horizontalSpace(Dimensions.widthSize * 1.2),
              Container(
                height: Dimensions.heightSize * 3.5,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CustomColor.primaryLightTextColor.withOpacity(0.15),
                    width: 1.5,
                  ),
                ),
              ),
              horizontalSpace(Dimensions.widthSize * 1.2),
              Column(
                crossAxisAlignment: crossStart,
                children: [
                  TitleHeading1Widget(
                    text: title,
                    fontSize: Dimensions.headingTextSize3,
                    color: CustomColor.primaryLightTextColor,
                  ),
                  verticalSpace(Dimensions.heightSize * 0.7),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    child: TitleHeading5Widget(
                      text: msg,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.primaryLightTextColor,
                      fontSize: Dimensions.headingTextSize6 * 1.3,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
