import '../../language/language_controller.dart';
import '../../utils/basic_screen_imports.dart';

class CustomInputWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  final TextInputType? keyboardType;
  final bool? readOnly;
  final Color? color;
  final double focusedBorderWidth;
  final double enabledBorderWidth;
  final Color borderColor;
  final EdgeInsetsGeometry paddings;

  // final Widget? suffixIcon;
  final VoidCallback? onTap;
  final double width;

  const CustomInputWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.readOnly = false,
    this.focusedBorderWidth = 1.5,
    this.enabledBorderWidth = 1.5,
    this.color = Colors.white,
    required this.borderColor,

    // this.suffixIcon,
    this.onTap,
    required this.paddings,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  State<CustomInputWidget> createState() => _CustomInputWidgetState();
}

class _CustomInputWidgetState extends State<CustomInputWidget> {
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
      children: [
        SizedBox(
          width: widget.width,
          child: TextFormField(
            style: Get.isDarkMode
                ? CustomStyle.darkHeading4TextStyle
                : CustomStyle.lightHeading4TextStyle,
            readOnly: widget.readOnly!,
            // style: CustomStyle.textStyle,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            validator: (String? value) {
              if (value!.isEmpty) {
                return Get.find<LanguageController>().getTranslation(Strings.pleaseFillOutTheField);
              } else {
                return null;
              }
            },
            onTap: () {
              setState(() {
                focusNode!.requestFocus();
              });
            },
            onFieldSubmitted: (value) {
              setState(() {
                focusNode!.unfocus();
              });
            },
            focusNode: focusNode,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
                borderSide: BorderSide(
                  color: widget.borderColor.withOpacity(0.15),
                  width: widget.enabledBorderWidth,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
                borderSide: BorderSide(
                    color: CustomColor.blackColor.withOpacity(0.15), width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
              filled: true,
              fillColor: widget.color,
              contentPadding: EdgeInsets.only(
                top: Dimensions.paddingSize * 0.67,
                bottom: Dimensions.paddingSize * 0.75,
                left: Dimensions.paddingSize * 0.7,
                right: Dimensions.paddingSize * 0.7,
              ),
              hintText: languageController.getTranslation(widget.hintText),
              hintStyle: Get.isDarkMode
                  ? CustomStyle.darkHeading3TextStyle.copyWith(
                      color: CustomColor.primaryDarkTextColor.withOpacity(0.3),
                      fontWeight: FontWeight.w500,
                      fontSize: Dimensions.headingTextSize3,
                    )
                  : CustomStyle.lightHeading3TextStyle.copyWith(
                      color: CustomColor.primaryLightTextColor.withOpacity(0.3),
                      fontWeight: FontWeight.w500,
                      fontSize: Dimensions.headingTextSize3,
                    ),
              // suffixIcon: widget.suffixIcon ?? const SizedBox.shrink(),
            ),
          ),
        ),
        // CustomSize.heightBetween()
      ],
    );
  }
}
