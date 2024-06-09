import '../../utils/basic_screen_imports.dart';
import '../../widgets/inputs/charge_dropdown_widget.dart';
import '/companion_customer/language/language_controller.dart';

class ChargeInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Color? color;
  final double focusedBorderWidth;
  final double enabledBorderWidth;
  final Color borderColor;
  final IconData? suffixIcon;
  final VoidCallback? onTap;

  ChargeInputWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.readOnly = false,
    this.focusedBorderWidth = 1.6,
    this.enabledBorderWidth = 1.5,
    this.color = Colors.white,
    this.borderColor = CustomColor.primaryLightTextColor,
    this.suffixIcon,
    this.onTap,
  }) : super(key: key);
  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        TextFormField(
          style: TextStyle(
            color: CustomColor.primaryLightTextColor.withOpacity(1),
            fontSize: Dimensions.headingTextSize3,
            fontWeight: FontWeight.w600,
          ),
          readOnly: readOnly!,
          controller: controller,
          keyboardType: keyboardType,
          validator: (String? value) {
            if (value!.isEmpty) {
              return null;
            } else {
              return Get.find<LanguageController>()
                  .getTranslation(Strings.pleaseFillOutTheField);
            }
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              borderSide: BorderSide(
                  color: CustomColor.primaryLightTextColor.withOpacity(0.15),
                  width: enabledBorderWidth),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              borderSide: BorderSide(
                  color: CustomColor.primaryLightColor.withOpacity(0.7),
                  width: focusedBorderWidth),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            filled: true,
            fillColor: color,
            contentPadding: const EdgeInsets.only(
                left: 15, right: 100, top: 14, bottom: 10),
            hintText: languageController.getTranslation(hintText),
            hintStyle: CustomStyle.darkHeading3TextStyle.copyWith(
                color: CustomColor.primaryLightTextColor.withOpacity(.30),
                fontWeight: FontWeight.w500),
          ),
        ),
        ChargeDropdownWidget(),
      ],
    );
  }
}
