import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../companion_direct/utils/custom_color.dart';
import '../../companion_direct/utils/custom_style.dart';
import '../../companion_direct/utils/dimensions.dart';

class AreaDropDown extends StatelessWidget {
  final RxString selectMethod;
  final List<String> itemsList;
  final void Function(String?)? onChanged;
  final double width;

  const AreaDropDown({
    required this.itemsList,
    Key? key,
    required this.selectMethod,
    this.onChanged, required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: Dimensions.inputBoxHeight * 0.5,
          width: width,
          decoration: BoxDecoration(
            border: Border.all(
              color: CustomColor.primaryLightTextColor.withOpacity(0.1),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
          ),
          child: DropdownButtonHideUnderline(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: DropdownButton(
                hint: Padding(
                  padding: EdgeInsets.only(left: Dimensions.paddingSize * 0.7),
                  child: Text(
                    selectMethod.value,
                    style: GoogleFonts.inter(
                      fontSize: Dimensions.headingTextSize6,
                      fontWeight: FontWeight.w400,
                      color: Get.isDarkMode
                          ? CustomColor.primaryDarkTextColor.withOpacity(.30)
                          : CustomColor.primaryLightTextColor,
                    ),
                  ),
                ),
                icon: Icon(Icons.arrow_drop_down,
                    color: Get.isDarkMode
                        ? CustomColor.primaryDarkTextColor.withOpacity(.30)
                        : CustomColor.primaryLightTextColor.withOpacity(.30)),
                // isExpanded: true,
                underline: Container(),
                borderRadius: BorderRadius.circular(Dimensions.radius),
                items: itemsList.map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Text(
                      value.toString(),
                      style: CustomStyle.lightHeading5TextStyle.copyWith(color: CustomColor.primaryLightTextColor.withOpacity(0.75)),
                    ),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ));
  }
}
