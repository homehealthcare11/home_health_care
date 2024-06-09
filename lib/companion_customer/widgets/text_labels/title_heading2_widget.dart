import 'package:sitterhub/companion_customer/utils/basic_screen_imports.dart';

import '../../language/language_controller.dart';

class TitleHeading2Widget extends StatelessWidget {
  TitleHeading2Widget({
    Key? key,
    required this.text,
    this.textAlign,
    this.textOverflow,
    this.padding = paddingValue,
    this.opacity = 1.0,
    this.maxLines,
    this.fontSize,
    this.fontWeight,
    this.color,
  }) : super(key: key);

  final String text;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final EdgeInsetsGeometry padding;
  final double opacity;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;
  static const paddingValue = EdgeInsets.all(0.0);

  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Obx(() => languageController.isLoading
        ? const Text('')
        : Opacity(
            opacity: opacity,
            child: Padding(
              padding: padding,
              child: Text(
                languageController.getTranslation(text),
                style: Get.isDarkMode
                    ? CustomStyle.darkHeading2TextStyle.copyWith(
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                        color: color)
                    : CustomStyle.lightHeading2TextStyle.copyWith(
                        fontSize:
                            isTablet() ? Dimensions.headingTextSize3 : fontSize,
                        fontWeight: fontWeight,
                        color: color),
                textAlign: textAlign,
                overflow: textOverflow,
                maxLines: maxLines,
              ),
            ),
          ));
  }
}
