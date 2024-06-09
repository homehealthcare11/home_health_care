import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../custom_assets/assets.gen.dart';
import '../../../companion_customer/widgets/others/custom_image_widget.dart';
import '../../companion_direct/utils/basic_screen_imports.dart';

class AddressDropDown extends StatelessWidget {
  final RxString selectMethod;
  final List<String> itemsList;
  final void Function(String?)? onChanged;
  final String label;
  final double maxHeight;

  const AddressDropDown({
    required this.itemsList,
    super.key,
    required this.selectMethod,
    this.onChanged,
    required this.label,
    required this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Obx(() => Container(
          height: Dimensions.inputBoxHeight * 0.85,
          decoration: BoxDecoration(
            border: Border.all(
              color: CustomColor.primaryLightTextColor.withOpacity(0.15),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.marginSizeHorizontal * .5),
                  child: CustomImageWidget(
                    path: Assets.icon.address2,
                    height: isTablet()
                        ? MediaQuery.sizeOf(context).height * 0.025
                        : null,
                  ),
                ),
              ),
              Container(
                  width: Dimensions.widthSize * .20,
                  height: Dimensions.heightSize * 1.4,
                  color: CustomColor.primaryLightTextColor.withOpacity(.15)),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  hint: Text(
                    selectMethod.value,
                    style: CustomStyle.lightHeading4TextStyle.copyWith(
                      color: CustomColor.primaryLightColor,
                      fontWeight: FontWeight.w500,
                      fontSize: Dimensions.headingTextSize3,
                    ),
                  ),
                  underline: Container(),
                  iconStyleData: IconStyleData(
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ).paddingOnly(right: 10),
                      iconDisabledColor: CustomColor.primaryLightColor,
                      iconEnabledColor: CustomColor.primaryLightColor),
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
