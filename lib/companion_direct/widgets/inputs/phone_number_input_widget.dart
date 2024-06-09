import 'package:google_fonts/google_fonts.dart';

import '../../utils/basic_screen_imports.dart';

class NumberInputWidget extends StatefulWidget {
  final String hint, label;
  final String countryCode;
  final int maxLines;
  final bool isValidator;
  final bool readOnly;
  final TextInputType? keyBoardType;
  final TextInputAction? textInputAction;

  final EdgeInsetsGeometry? paddings;
  final TextEditingController controller;

  const NumberInputWidget({
    Key? key,
    required this.controller,
    required this.hint,
    this.isValidator = true,
    this.maxLines = 1,
    this.paddings,
    required this.label,
    this.readOnly = false,
    required this.countryCode,
    this.keyBoardType,
    this.textInputAction,
  }) : super(key: key);

  @override
  State<NumberInputWidget> createState() => _PrimaryInputWidgetState();
}

class _PrimaryInputWidgetState extends State<NumberInputWidget> {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHeading4Widget(
          text: widget.label,
          fontSize: Dimensions.headingTextSize3,
          fontWeight: FontWeight.normal,
        ),
        verticalSpace(Dimensions.heightSize * 0.3),
        TextFormField(
          keyboardType: widget.keyBoardType,
          textInputAction: widget.textInputAction,
          validator: widget.isValidator == false
              ? null
              : (String? value) {
                  if (value!.isEmpty) {
                    return Strings.pleaseFillOutTheField;
                  } else {
                    return null;
                  }
                },
          controller: widget.controller,
          onTap: () {
            setState(
              () {
                focusNode!.requestFocus();
              },
            );
          },
          onFieldSubmitted: (value) {
            setState(() {
              focusNode!.unfocus();
            });
          },
          focusNode: focusNode,
          textAlign: TextAlign.left,
          style: Get.isDarkMode
              ? CustomStyle.darkHeading3TextStyle
              : GoogleFonts.inter(
                  fontSize: Dimensions.headingTextSize3 + 2,
                  fontWeight: FontWeight.w400,
                  color: CustomColor.primaryLightColor,
                ),
          readOnly: widget.readOnly,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: Get.isDarkMode
                ? GoogleFonts.inter(
                    fontSize: Dimensions.headingTextSize3,
                    fontWeight: FontWeight.normal,
                    color: CustomColor.primaryBGDarkColor.withOpacity(0.2),
                  )
                : GoogleFonts.inter(
                    fontSize: Dimensions.headingTextSize3,
                    fontWeight: FontWeight.normal,
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
            // prefixIcon: Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.symmetric(
            //           horizontal: Dimensions.marginSizeHorizontal * 0.6),
            //       child: InkWell(
            //         splashColor: CustomColor.redColor,
            //         onTap: (() {
            //           if (!widget.readOnly) {}
            //         }),
            //         child: CustomTitleHeadingWidget(
            //           text: "+1",
            //           style: GoogleFonts.inter(
            //             fontSize: Dimensions.headingTextSize3 + 2,
            //             fontWeight: FontWeight.w400,
            //             color:
            //                 CustomColor.primaryLightTextColor.withOpacity(0.2),
            //           ),
            //         ),
            //       ),
            //     ),
            //     Container(
            //         width: 1.6,
            //         height: Dimensions.heightSize * 2,
            //         color: CustomColor.primaryLightTextColor.withOpacity(0.1)),
            //     horizontalSpace(Dimensions.widthSize)
            //   ],
            // ),
          ),
        ),
      ],
    );
  }
}
