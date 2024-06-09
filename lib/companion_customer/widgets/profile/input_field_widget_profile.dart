import 'package:google_fonts/google_fonts.dart';

import '../../utils/basic_screen_imports.dart';
import '/companion_customer/language/language_controller.dart';

class InputFieldWidgetProfile extends StatefulWidget {
  final String hint, icon;
  final String? labelText;
  final int maxLines;
  final bool isValidator;
  final TextInputType? keyboardTypeC;
  final bool readOnly;
  final EdgeInsetsGeometry? paddings;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final ValueChanged? onChanged;

  const InputFieldWidgetProfile({
    Key? key,
    required this.controller,
    required this.hint,
    this.icon = "",
    this.isValidator = true,
    this.maxLines = 1,
    this.paddings,
    this.labelText,
    this.keyboardTypeC,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  @override
  State<InputFieldWidgetProfile> createState() =>
      _InputFieldWidgetProfileState();
}

class _InputFieldWidgetProfileState extends State<InputFieldWidgetProfile> {
  FocusNode? focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languageController = Get.put(LanguageController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHeading4Widget(
          text: widget.labelText ?? "",
          fontSize: Dimensions.headingTextSize3,
          fontWeight: FontWeight.w500,
          color: focusNode!.hasFocus
              ? CustomColor.primaryLightColor
              : CustomColor.primaryLightTextColor,
        ),
        verticalSpace(Dimensions.heightSize * 0.3),
        TextFormField(
          scrollPadding: EdgeInsets.only(
            bottom: Dimensions.appBarHeight,
          ),
          readOnly: widget.readOnly,
          validator: widget.isValidator == false
              ? null
              : (String? value) {
                  if (value!.isEmpty) {
                    return Get.find<LanguageController>()
                        .getTranslation(Strings.pleaseFillOutTheField);
                  } else {
                    return null;
                  }
                },
          textInputAction: TextInputAction.next,
          controller: widget.controller,
          onTap: () {
            focusNode!.requestFocus();
          },
          onFieldSubmitted: (value) {
            setState(() {
              focusNode!.unfocus();
            });
          },
          onChanged: widget.onChanged,
          focusNode: focusNode,
          style: Get.isDarkMode
              ? CustomStyle.darkHeading3TextStyle
              : GoogleFonts.inter(
                  fontSize: Dimensions.headingTextSize3 + 2,
                  fontWeight: FontWeight.w400,
                  color: CustomColor.primaryLightColor,
                ),
          maxLines: widget.maxLines,
          keyboardType: widget.keyboardTypeC,
          decoration: InputDecoration(
            labelStyle: CustomStyle.darkHeading3TextStyle,
            hintText: languageController.getTranslation(widget.hint),
            hintStyle: Get.isDarkMode
                ? GoogleFonts.inter(
                    fontSize: Dimensions.headingTextSize3 + 2,
                    fontWeight: FontWeight.w400,
                    color: CustomColor.primaryBGDarkColor.withOpacity(0.2),
                  )
                : GoogleFonts.inter(
                    fontSize: Dimensions.headingTextSize3 + 2,
                    fontWeight: FontWeight.w400,
                    color: CustomColor.primaryLightTextColor.withOpacity(0.2),
                  ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
              borderSide: BorderSide(
                  width: 2,
                  color: CustomColor.primaryLightTextColor.withOpacity(0.1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
              borderSide: const BorderSide(
                  width: 2, color: CustomColor.primaryLightColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
              borderSide:
                  const BorderSide(width: 1.5, color: CustomColor.redColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
              borderSide:
                  const BorderSide(width: 1.5, color: CustomColor.redColor),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: Dimensions.heightSize * 1.7,
              vertical: Dimensions.heightSize,
            ),
          ),
        ),
      ],
    );
  }
}
