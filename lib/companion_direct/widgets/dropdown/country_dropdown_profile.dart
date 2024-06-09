import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/companion_customer/widgets/country_list.dart';
import '/companion_direct/controller/dashboard/profile_controller/profile_controller.dart';

import '../../../companion_customer/utils/custom_style.dart';
import '../../model/country_model.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';

class ProfileCountryDropDown extends StatelessWidget {
  final void Function(CountryModel?)? onChanged;
  final Widget prefix;
  final controller = Get.put(NannyProfileController());

  ProfileCountryDropDown({
    Key? key,
    this.onChanged,
    required this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("country==== ${controller.countryController.text}");
    return Container(
      height: Dimensions.inputBoxHeight * 0.875,
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
            child: DropdownButtonHideUnderline(
              child: CountryCodePicker(
                showCountryOnly: true,
                searchStyle:
                    const TextStyle(color: CustomColor.primaryLightColor),
                showFlag: false,
                countryList: countryCodes,
                showOnlyCountryWhenClosed: true,
                initialSelection: controller.countryController.text == 'null'
                    ? 'US'
                    : controller.countryController.text,
                enabled: true,
                alignLeft: true,
                dialogTextStyle: CustomStyle.lightHeading4TextStyle.copyWith(
                  color: CustomColor.primaryLightTextColor.withOpacity(0.3),
                  fontWeight: FontWeight.w500,
                  fontSize: Dimensions.headingTextSize3,
                ),
                textStyle: CustomStyle.lightHeading4TextStyle.copyWith(
                  color: CustomColor.primaryLightColor,
                  fontWeight: FontWeight.w500,
                  fontSize: Dimensions.headingTextSize3,
                ),
                onChanged: (value) {
                  controller.selectCountry = value.name;
                  debugPrint(controller.selectCountry);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
