import '../../utils/basic_widget_imports.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({Key? key, required this.isChecked, this.onChecked})
      : super(key: key);
  final RxBool isChecked;
  final void Function(bool)? onChecked;

  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(Dimensions.radius * .4),
      onTap: () {
        isChecked.value = !isChecked.value;
        onChecked!(isChecked.value);
      },
      child: Obx(
        () => Container(
          height: isTablet() ? 35 : 14,
          width: isTablet() ? 35 : 14,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isChecked.value
                  ? CustomColor.whiteColor
                  : CustomColor.primaryLightColor,
              border: Border.all(
                width: 1.5,
                color: CustomColor.primaryLightTextColor.withOpacity(0.2),
              )),
          child: Icon(
            Icons.check,
            size: 12,
            color: isChecked.value ? CustomColor.whiteColor : Colors.white,
          ),
        ),
      ),
    );
  }
}
