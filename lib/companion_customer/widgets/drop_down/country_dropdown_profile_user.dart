import 'package:country_code_picker/country_code_picker.dart';
import '/companion_customer/utils/basic_screen_imports.dart';

import '../../../companion_customer/controller/profile/profile_controller.dart';
import '../../model/country_model.dart';
import '../country_list.dart';

class UserProfileCountryDropDown extends StatelessWidget {
  final void Function(CountryModel?)? onChanged;
  final Widget prefix;
  final controller = Get.put(ProfileController());

  UserProfileCountryDropDown({
    Key? key,
    this.onChanged,
    required this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                countryList: countryCodes,
                searchStyle:
                    const TextStyle(color: CustomColor.primaryLightColor),
                showFlag: false,
                showOnlyCountryWhenClosed: true,
                initialSelection: controller.countryController.text == 'null'
                    ? 'US'
                    : controller.countryController.text,
                enabled: true,
                alignLeft: true,
                dialogTextStyle: CustomStyle.lightHeading4TextStyle.copyWith(
                  color: CustomColor.primaryLightColor,
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
                  controller.selectCountryCode = value.dialCode.toString();
                  debugPrint(value.dialCode);
                },
              ),
            ),
          ),
          const Icon(
            Icons.arrow_drop_down,
            color: CustomColor.primaryLightColor,
          ),
          horizontalSpace(Dimensions.widthSize),
        ],
      ),
    );
  }
}
