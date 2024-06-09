import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';

class InputDropDown extends StatelessWidget {
  final RxString selectMethod;
  final List<String> itemsList;
  final void Function(String?)? onChanged;

  const InputDropDown({
    required this.itemsList,
    Key? key,
    required this.selectMethod,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Obx(() => Container(
          height: Dimensions.inputBoxHeight * 0.8,
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
                      fontSize: Dimensions.headingTextSize3 + 2,
                      fontWeight: FontWeight.w400,
                      color: Get.isDarkMode
                          ? CustomColor.primaryDarkTextColor.withOpacity(.30)
                          : CustomColor.primaryLightColor,
                    ),
                  ),
                ),
                icon: Icon(Icons.arrow_drop_down,
                    size: isTablet()
                        ? MediaQuery.sizeOf(context).height * 0.035
                        : null,
                    color: Get.isDarkMode
                        ? CustomColor.primaryDarkTextColor.withOpacity(.30)
                        : CustomColor.primaryLightTextColor.withOpacity(.30)),
                isExpanded: true,
                underline: Container(),
                borderRadius: BorderRadius.circular(Dimensions.radius),
                items: itemsList.map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Text(
                      value.toString(),
                      style: CustomStyle.lightHeading3TextStyle,
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
