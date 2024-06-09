import 'package:dropdown_button2/dropdown_button2.dart';

import '../../utils/basic_screen_imports.dart';
import '/companion_direct/controller/select_profession_controller/select_profession_controller.dart';

class ChargeDropdownWidget extends StatelessWidget {
  final controller = Get.put(SelectProfessionController());

  ChargeDropdownWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Dimensions.inputBoxHeight,
      width: MediaQuery.of(context).size.width * .275,
      decoration: BoxDecoration(
        color: CustomColor.secondaryLightColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Dimensions.radius),
          bottomRight: Radius.circular(Dimensions.radius),
        ),
      ),
      child: Row(
        mainAxisAlignment: mainSpaceBet,
        children: [
          Obx(
            () => DropdownButton2(
              underline: Container(),
              dropdownStyleData: const DropdownStyleData(
                  decoration:
                      BoxDecoration(color: CustomColor.secondaryLightColor)),
              iconStyleData: const IconStyleData(
                  icon: Icon(
                Icons.arrow_drop_down,
                color: CustomColor.whiteColor,
              )),
              value: controller.selectedCurrency.value,
              items: controller.currencyList
                  .where((item) =>
                      item ==
                      "") // ignore_for_file: unrelated_type_equality_checks
                  .map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: CustomTitleHeadingWidget(
                    padding:
                        EdgeInsets.only(left: Dimensions.paddingSize * .45),
                    text: item,
                    style: CustomStyle.lightHeading3TextStyle.copyWith(
                      color: CustomColor.whiteColor,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                controller.selectedCurrency.value = newValue!.toString();
              },
            ),
          ),
        ],
      ),
    );
  }
}
