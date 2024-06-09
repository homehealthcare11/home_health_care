import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/companion_customer/widgets/country_list.dart';

import '../../../custom_assets/assets.gen.dart';
import '../../../companion_customer/utils/custom_style.dart';
import '../../controller/auth/sign_up/sign_up_screen_controller/sign_up_controller.dart';
import '../../model/country_model.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../others/custom_image_widget.dart';

class CountryDropDown extends StatelessWidget {
  final RxString selectMethod;
  final List<CountryModel> itemsList;
  final void Function(CountryModel?)? onChanged;
  final Widget prefix;
  final controller = Get.put(NannySignUpController());

  CountryDropDown({
    required this.itemsList,
    Key? key,
    required this.selectMethod,
    this.onChanged,
    required this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                path: Assets.icon.country,
                color: CustomColor.primaryLightTextColor,
              ),
            ),
          ),
          Container(
              width: Dimensions.widthSize * .20,
              height: Dimensions.heightSize * 1.4,
              color: CustomColor.primaryLightTextColor.withOpacity(.15)),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: CountryCodePicker(
                showCountryOnly: true,
                showFlag: false,
                showOnlyCountryWhenClosed: true,
                countryList: countryCodes,
                searchStyle:
                    const TextStyle(color: CustomColor.primaryLightColor),
                initialSelection: controller.countryController.text == 'null'
                    ? 'US'
                    : controller.countryController.text == ''
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
