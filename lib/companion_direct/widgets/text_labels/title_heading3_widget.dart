import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../companion_customer/language/language_controller.dart';
import '../../../companion_customer/utils/dimensions.dart';
import '../../utils/custom_style.dart';

class TitleHeading3Widget extends StatelessWidget {
  TitleHeading3Widget({
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
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
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
                    ? CustomStyle.darkHeading3TextStyle.copyWith(
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                        color: color)
                    : CustomStyle.lightHeading3TextStyle.copyWith(
                        fontSize:
                            isTablet() ? Dimensions.headingTextSize4 : fontSize,
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
