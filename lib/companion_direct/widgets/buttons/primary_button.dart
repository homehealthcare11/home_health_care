import '../../utils/basic_widget_imports.dart';
import '/companion_customer/language/language_controller.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.borderColor,
    this.borderWidth = 0,
    this.height,
    required this.buttonColor,
    this.buttonTextColor = Colors.white,
    this.shape,
    this.icon,
    this.fontSize,
    this.fontWeight,
    this.btnTextColor = Colors.white,
  }) : super(key: key);
  final String title;
  final VoidCallback onPressed;
  final Color borderColor;
  final double borderWidth;
  final double? height;
  final Color btnTextColor;
  final Color buttonColor;
  final Color buttonTextColor;
  final OutlinedBorder? shape;
  final Widget? icon;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 700;
    }

    final languageController = Get.put(LanguageController());
    return SizedBox(
      height: isTablet()
          ? MediaQuery.sizeOf(context).height * 0.075
          : Dimensions.buttonHeight * 0.85,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: shape ??
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius * 0.7)),
          backgroundColor: buttonColor,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          side: BorderSide(
            width: borderWidth,
            color: borderColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              languageController.getTranslation(
                title,
              ),
              style: CustomStyle.darkHeading4TextStyle.copyWith(
                fontSize: fontSize,
                fontWeight: fontWeight ?? FontWeight.bold,
                color: CustomColor.whiteColor,
              ),
            ),
            icon ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
