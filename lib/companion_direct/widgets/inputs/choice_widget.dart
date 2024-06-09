
import '../../controller/select_profession_controller/select_profession_controller.dart';
import '../../utils/basic_screen_imports.dart';

class ChoiceWidget extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final double? fontSize;
  final VoidCallback onTap;
  final Color? textColor;
  final Color containerColor;
  final Color borderColor;
  final controller = Get.put(SelectProfessionController());

  ChoiceWidget(
      {Key? key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.fontSize,
      required this.onTap,
      this.textColor,
      required this.containerColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: Dimensions.paddingSize * .30,bottom: 10),
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.paddingSize * .30,
            horizontal: Dimensions.paddingSize *.60),
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(
              Dimensions.radius * 5,
            ),
            border: Border.all(
                width: Dimensions.widthSize * .25, color: borderColor)),
        child: Text(
          text,
          style: CustomStyle.darkHeading4TextStyle.copyWith(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ),
    );
  }
}