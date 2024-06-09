import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/others/custom_image_widget.dart';
import '../../widgets/text_labels/title_heading5_widget.dart';

class NannyCardWidget extends StatelessWidget {
  const NannyCardWidget(
      {Key? key,
      required this.name,
      required this.bio,
      required this.serviceDate,
      required this.serviceWeekday,
      required this.serviceTime,
      required this.address,
      required this.selected,
      required this.image,
      required this.petOrBaby})
      : super(key: key);

  final String name,
      bio,
      serviceDate,
      serviceWeekday,
      serviceTime,
      address,
      image;
  final int selected;
  final int petOrBaby;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * .23,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimensions.radius * 2,
        ),
        color: CustomColor.whiteColor,
      ),
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginSizeVertical * 0.1,
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
                  height: 85.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius),
                    color: Colors.black,
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover),
                  ),
                ),
                verticalSpace(Dimensions.heightSize * .8),
                Container(
                  decoration: BoxDecoration(
                      color: CustomColor.secondaryLightColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius)),
                  child: TitleHeading5Widget(
                    text: petOrBaby == 1
                        ? Strings.babySitter.tr
                        : Strings.petSitter.tr,
                    padding: EdgeInsets.only(
                        top: 7.h, right: 4.w, left: 4.h, bottom: 5.h),
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
                //Name status and looking for widget
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: crossStart,
                      children: [
                        Row(
                          mainAxisAlignment: mainStart,
                          children: [
                            TitleHeading4Widget(
                              text: name,
                              fontSize: Dimensions.headingTextSize4,
                              fontWeight: FontWeight.w600,
                            ),
                            horizontalSpace(Dimensions.paddingSize * .15),
                            Container(
                              decoration: BoxDecoration(
                                color: selected == 1
                                    ? CustomColor.greenColor
                                    : selected == 0
                                        ? CustomColor.primaryLightColor
                                        : selected == 2
                                            ? CustomColor.redColor
                                            : selected == 4
                                                ? CustomColor.greenColor
                                                : CustomColor.greenColor,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius * .25),
                              ),
                              child: TitleHeading5Widget(
                                text: selected == 1
                                    ? Strings.accepted.tr
                                    : selected == 0
                                        ? Strings.pending.tr
                                        : selected == 2
                                            ? Strings.reject.tr
                                            : selected == 3
                                                ? Strings.hold.tr
                                                : selected == 4
                                                    ? Strings.taskComplete.tr
                                                    : Strings.paid.tr,
                                padding: EdgeInsets.symmetric(
                                    vertical: Dimensions.paddingSize * .05,
                                    horizontal: Dimensions.paddingSize * .10),
                                color: CustomColor.whiteColor,
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(Dimensions.heightSize * 0.3),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          child: TitleHeading5Widget(
                            maxLines: 1,
                            text: bio,
                            textOverflow: TextOverflow.ellipsis,
                            color: CustomColor.primaryLightTextColor
                                .withOpacity(.35),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Divider(
                  thickness: Dimensions.heightSize * .15,
                  color: Get.isDarkMode
                      ? CustomColor.primaryDarkTextColor.withOpacity(.15)
                      : CustomColor.primaryLightTextColor.withOpacity(.05),
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
                              text: serviceDate,
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
                              text: serviceWeekday,
                              color: CustomColor.primaryLightTextColor
                                  .withOpacity(.30),
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        TitleHeading2Widget(
                          text: serviceTime,
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
                      : CustomColor.primaryLightTextColor.withOpacity(.05),
                ),
                //address widget
                Row(
                  mainAxisAlignment: mainStart,
                  children: [
                    CustomImageWidget(
                        path: Assets.icon.address2,
                        height: Dimensions.heightSize * 1.3),
                    horizontalSpace(Dimensions.marginSizeHorizontal * .25),
                    Expanded(
                      child: TitleHeading5Widget(
                          padding:
                              EdgeInsets.only(top: Dimensions.paddingSize * .3),
                          maxLines: 2,
                          text: address,
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

// schedule
// _scheduleCardWidget(BuildContext context) {
//   return Column(
//     crossAxisAlignment: crossStart,
//     children: [
//       Row(
//         mainAxisAlignment: mainSpaceBet,
//         children: [
//           TitleHeading3Widget(
//             text: "25 May 2023  ",
//             fontWeight: FontWeight.w600,
//             color: CustomColor.primaryLightTextColor.withOpacity(0.30),
//           ),
//           TitleHeading3Widget(
//             text: "  Thursday",
//             fontWeight: FontWeight.w600,
//             color: CustomColor.primaryLightTextColor.withOpacity(0.30),
//           ),
//         ],
//       ),
//       Row(
//         mainAxisAlignment: mainSpaceBet,
//         children: [
//           TitleHeading2Widget(
//             text: "10:00 AM ",
//             color: CustomColor.primaryLightTextColor.withOpacity(0.30),
//             fontSize: Dimensions.headingTextSize1 * 0.792,
//           ),
//           Column(
//             children: [
//               TitleHeading2Widget(
//                 text: "- 10:00 PM",
//                 color: CustomColor.primaryLightTextColor.withOpacity(0.30),
//                 fontSize: Dimensions.headingTextSize1 * 0.792,
//               ),
//             ],
//           ),
//         ],
//       ),
//     ],
//   );
// }

// address card
// _addressDetailsWidget(BuildContext context) {
//   return Row(
//     mainAxisAlignment: mainStart,
//     crossAxisAlignment: crossStart,
//     children: [
//       CustomImageWidget(
//         path: Assets.icon.address2,
//         height: Dimensions.heightSize * 1.53,
//         width: Dimensions.widthSize * 1.437,
//       ),
//       horizontalSpace(Dimensions.widthSize),
//       SizedBox(
//         width: Dimensions.widthSize * 17.9,
//         child: TitleHeading4Widget(
//           text: '4598 Veltri Drive, Alakanuk, Alaska - 99554, United State.',
//           fontWeight: FontWeight.w500,
//           color: CustomColor.primaryLightTextColor.withOpacity(0.30),
//         ),
//       )
//     ],
//   );
// }
}
