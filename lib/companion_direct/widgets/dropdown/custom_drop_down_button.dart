import 'package:dropdown_button2/dropdown_button2.dart';

import '../../utils/basic_screen_imports.dart';

class CustomDropDownButton extends StatelessWidget {
  final RxString selectMethod;
  final List<String> itemsList;
  final void Function(String?)? onChanged;
  final String label;
  final double maxHeight;

  const CustomDropDownButton({
    required this.itemsList,
    super.key,
    required this.selectMethod,
    this.onChanged,
    required this.label,
    required this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: Dimensions.inputBoxHeight * 0.85,
          width: MediaQuery.sizeOf(context).width * 0.45,
          decoration: BoxDecoration(
            color: CustomColor.whiteColor,
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
          ),
          child: Row(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  hint: Text(
                    selectMethod.value,
                    style: CustomStyle.lightHeading4TextStyle.copyWith(
                      color: CustomColor.primaryLightTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: Dimensions.headingTextSize3,
                    ),
                  ),
                  underline: Container(),
                  iconStyleData: IconStyleData(
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ).paddingOnly(right: 10),
                      iconDisabledColor: CustomColor.primaryLightTextColor,
                      iconEnabledColor: CustomColor.primaryLightTextColor),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: maxHeight,
                    decoration: const BoxDecoration(
                      color: CustomColor.primaryLightColor,
                    ),
                  ),
                  items: itemsList.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(
                        value.toString(),
                        style: CustomStyle.lightHeading5TextStyle
                            .copyWith(color: CustomColor.whiteColor),
                      ),
                    );
                  }).toList(),
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ));
  }
}
