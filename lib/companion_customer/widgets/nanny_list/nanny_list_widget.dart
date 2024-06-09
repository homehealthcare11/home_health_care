import '../../language/language_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/text_labels/title_heading5_widget.dart';

class NannyListWidget extends StatelessWidget {
  const NannyListWidget(
      {Key? key,
      required this.name,
      required this.text,
      required this.value,
      required this.image})
      : super(key: key);
  final String name;
  final String text;
  final String value;
  final String image;

  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Card(
      surfaceTintColor: CustomColor.whiteColor,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.paddingSize * 0.3,
                  top: isTablet()
                      ? MediaQuery.sizeOf(context).height * 0.02
                      : Dimensions.paddingSize * 0.375,
                  bottom: isTablet()
                      ? MediaQuery.sizeOf(context).height * 0.02
                      : Dimensions.paddingSize * 0.375),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.144,
                width: MediaQuery.of(context).size.width * 0.326,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Dimensions.radius),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            horizontalSpace(Dimensions.widthSize * 0.5),
            Column(
              crossAxisAlignment: crossStart,
              children: [
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    SizedBox(
                      width: Dimensions.widthSize * 10,
                      child: TitleHeading2Widget(
                        text: name,
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.headingTextSize4,
                      ),
                    ),
                    horizontalSpace(Dimensions.widthSize * 2),
                    Obx(() => Get.find<LanguageController>().isLoading
                        ? Container()
                        : Container(
                            height: Dimensions.heightSize * 2.25,
                            decoration: BoxDecoration(
                              color: CustomColor.secondaryLightColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Get.find<LanguageController>()
                                            .languageDirectionText
                                            .value ==
                                        "ltr"
                                    ? Radius.circular(Dimensions.radius)
                                    : const Radius.circular(0),
                                topLeft: Get.find<LanguageController>()
                                            .languageDirectionText
                                            .value ==
                                        "ltr"
                                    ? Radius.circular(Dimensions.radius)
                                    : const Radius.circular(0),
                                topRight: Get.find<LanguageController>()
                                            .languageDirectionText
                                            .value ==
                                        "rtl"
                                    ? Radius.circular(Dimensions.radius)
                                    : const Radius.circular(0),
                                bottomRight: Get.find<LanguageController>()
                                            .languageDirectionText
                                            .value ==
                                        "rtl"
                                    ? Radius.circular(Dimensions.radius)
                                    : const Radius.circular(0),
                              ),
                            ),
                            child: TitleHeading1Widget(
                              padding: const EdgeInsets.only(
                                  left: 9, top: 5, bottom: 5, right: 2),
                              text: value,
                              fontSize: Dimensions.headingTextSize3,
                              color: CustomColor.whiteColor,
                            ),
                          ))
                  ],
                ),
                verticalSpace(Dimensions.heightSize * 0.5),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimensions.radius),
                      ),
                      border: Border.all(
                          color: text == "1"
                              ? CustomColor.secondaryLightColor
                              : CustomColor.primaryLightColor)),
                  child: TitleHeading5Widget(
                    fontSize: Dimensions.headingTextSize6,
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.widthSize * 0.5,
                        vertical: Dimensions.heightSize * 0.2),
                    text: text == "1" ? "Companion" : "Nurse",
                    maxLines: 1,
                    fontWeight: FontWeight.w600,
                    color: text == "1"
                        ? CustomColor.secondaryLightColor
                        : CustomColor.primaryLightColor,
                  ),
                ),
                verticalSpace(Dimensions.heightSize * 0.5),
              ],
            )
          ],
        ),
      ),
    );
  }
}
//
