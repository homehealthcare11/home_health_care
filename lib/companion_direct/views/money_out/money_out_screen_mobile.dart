import 'dart:io';

import 'package:flutter/services.dart';

import '../../../backend/utils/custom_loading_api.dart';
import '../../../companion_customer/language/language_controller.dart';
import '../../../companion_customer/utils/basic_screen_imports.dart';
import '../../../companion_customer/widgets/appbar/custom_app_bar.dart';
import '../../../companion_customer/widgets/text_labels/title_heading5_widget.dart';
import '../../controller/money_out/money_out_controller.dart';
import '../../widgets/dropdown/custom_drop_down_button.dart';

class MoneyOutScreenMobile extends StatelessWidget {
  MoneyOutScreenMobile({super.key});

  final controller = Get.put(MoneyOutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.moneyOut.tr,
        onTap: () {
          Get.back();
        },
        leadingPadding: EdgeInsets.only(
          left: Dimensions.paddingSize,
        ),
      ),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _inputFieldWidget(context),
          _paymentGatewayWidget(context),
          _customNumKeyBoardWidget(context),
          _buttonWidget(context)
        ],
      ),
    );
  }

  _inputFieldWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: Dimensions.marginSizeHorizontal * 0.5,
        top: Dimensions.marginSizeVertical * 2,
      ),
      alignment: Alignment.topCenter,
      height: Dimensions.inputBoxHeight,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: Dimensions.widthSize * 0.7),
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      style: Get.isDarkMode
                          ? CustomStyle.lightHeading2TextStyle.copyWith(
                              fontSize: Dimensions.headingTextSize3 * 2,
                            )
                          : CustomStyle.darkHeading2TextStyle.copyWith(
                              color: CustomColor.primaryLightTextColor,
                              fontSize: Dimensions.headingTextSize3 * 2,
                            ),
                      readOnly: true,
                      controller: controller.moneyOutAmountTextController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'(^-?\d*\.?\d*)')),
                        LengthLimitingTextInputFormatter(
                          6,
                        ),
                      ],
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return Strings.pleaseFillOutTheField;
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        hintText: '0.0',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: Dimensions.widthSize * 0.5,
                ),
              ],
            ),
          ),
          SizedBox(width: Dimensions.widthSize * 0.7),
          _currencyDropDownWidget(context),
        ],
      ),
    );
  }

  _customNumKeyBoardWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSizeVertical),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 3 / 1.5,
        shrinkWrap: true,
        children: List.generate(
          controller.keyboardItemList.length,
          (index) {
            return controller.inputItem(index);
          },
        ),
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.marginSizeHorizontal * 0.8,
        right: Dimensions.marginSizeHorizontal * 0.8,
        top: Platform.isAndroid ? Dimensions.marginSizeVertical * 1.8 : 0.0,
        bottom: Dimensions.marginSizeVertical,
      ),
      child: Row(
        children: [
          Expanded(
            child: Obx(
              () => controller.isInsertLoading
                  ? const CustomLoadingAPI()
                  : PrimaryButton(
                      title: Strings.moneyOut,
                      onPressed: () {
                        controller.manualPaymentGetGatewaysProcess();
                      },
                      borderColor: CustomColor.primaryLightColor,
                      buttonColor: CustomColor.primaryLightColor,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  _currencyDropDownWidget(BuildContext context) {
    return Chip(
      backgroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius * 2.5),
      ),
      label: Row(
        children: [
          horizontalSpace(Dimensions.widthSize * 0.5),
          TitleHeading3Widget(
            text: controller.baseCurrency.value,
            color: CustomColor.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  _paymentGatewayWidget(BuildContext context) {
    return Column(
      children: [
        verticalSpace(Dimensions.heightSize * 0.5),
        _walletBalanceWidget(context),
        verticalSpace(Dimensions.heightSize * 0.5),
        Obx(
          () => TitleHeading5Widget(
            text:
                "${Get.find<LanguageController>().getTranslation(Strings.limit)} ${controller.limitMin.value.toStringAsFixed(2)} ${controller.baseCurrency.value} - ${controller.limitMax.value.toStringAsFixed(2)} ${controller.baseCurrency.value} ",
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        verticalSpace(Dimensions.heightSize),
        CustomDropDownButton(
          itemsList: controller.allCurrencyList,
          selectMethod: controller.selectWallet,
          onChanged: (p0) {
            controller.selectWallet.value = p0!;
            for (int i = 0; i < controller.allCurrencyList.length; i++) {
              if (controller.allCurrencyList[i]
                  .contains(controller.selectWallet.value)) {
                controller.selectAlias.value =
                    controller.allCurrencyAliasList[i];
              }
            }
          },
          label: "",
          maxHeight: MediaQuery.sizeOf(context).height * 0.33,
        ),
      ],
    );
  }

  _walletBalanceWidget(BuildContext context) {
    return TitleHeading5Widget(
      text:
          "${Get.find<LanguageController>().getTranslation(Strings.availableBalance)} ${controller.withdrawInfoModel.data.nannyWallet.balance} ${controller.baseCurrency.value}",
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.w500,
    );
  }
}
