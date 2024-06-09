import '/companion_direct/language/english.dart';
import '/companion_direct/utils/custom_color.dart';
import '/companion_direct/utils/dimensions.dart';
import '/companion_direct/widgets/dropdown/kyc_dynamic_dropdown.dart';
import '/companion_direct/widgets/inputs/primary_text_input_widget.dart';
import '/companion_direct/widgets/text_labels/title_heading4_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../backend/model/auth/sign_up_direct/sign_up_direct_model_kyc.dart';
import '../../../../../backend/model/common/common_success_model.dart';
import '../../../../../backend/services/api_services.dart';
import '../../../../../companion_customer/routes/routes.dart';
import '../../../../utils/size.dart';
import '../../../../widgets/inputs/kyc_image_widget.dart';

class SignUpKycVerificationController extends GetxController {
  @override
  void onInit() {
    getKycInputFieldsProcess();
    super.onInit();
  }

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  List<TextEditingController> inputFieldControllers = [];
  final trackController = TextEditingController();
  RxList inputFields = [].obs;

  List<String> dropdownList = <String>[].obs;

  //creating bank name and code dropdowns
  RxString selectType = "".obs;

  List<String> listImagePath = [];
  List<String> listFieldName = [];
  RxList inputFileFields = [].obs;
  RxBool hasFile = false.obs;

  RxString trx = ''.obs;

  late KycInfoModel _kycInfoModel;

  KycInfoModel get kycInfoModel => _kycInfoModel;

  //add money payment gateway function
  Future<KycInfoModel> getKycInputFieldsProcess() async {
    _isLoading.value = true;
    inputFields.clear();
    listImagePath.clear();
    listFieldName.clear();
    inputFieldControllers.clear();
    update();

    await ApiServices.kycInputFieldsApi().then((value) {
      _kycInfoModel = value!;
      //-------------------------- Process inputs start ------------------------
      final data = _kycInfoModel.data.nannyKyc;

      for (int item = 0; item < data.length; item++) {
        var textEditingController = TextEditingController();
        inputFieldControllers.add(textEditingController);
        if (data[item].type.contains('select')) {
          hasFile.value = true;
          selectType.value = data[item].validation.options.first.toString();
          inputFieldControllers[item].text = selectType.value;
          dropdownList = data[item].validation.options;
          inputFields.add(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.marginBetweenInputTitleAndBox,
                ),
                TitleHeading4Widget(
                  text: data[item].label,
                ),
                SizedBox(
                  height: Dimensions.marginBetweenInputTitleAndBox,
                ),
                KycDynamicDropDown(
                  selectMethod: selectType,
                  itemsList: dropdownList,
                  onChanged: (value) {
                    selectType.value = value!;
                    inputFieldControllers[item].text = selectType.value;
                    debugPrint(selectType.value);
                  },
                ),
              ],
            ),
          );
        } else if (data[item].type.contains('file')) {
          hasFile.value = true;
          inputFileFields.add(
            Column(
              crossAxisAlignment: crossStart,
              children: [
                TitleHeading4Widget(
                  text: data[item].label,
                  textAlign: TextAlign.left,
                  color: CustomColor.primaryLightTextColor,
                  fontSize: Dimensions.headingTextSize3,
                  fontWeight: FontWeight.w600,
                ),
                verticalSpace(Dimensions.heightSize),
                KycImageWidget(
                  labelName: data[item].label,
                  fieldName: data[item].name,
                ),
              ],
            ),
          );
        } else if (data[item].type.contains('text')) {
          inputFields.add(
            Column(
              mainAxisAlignment: mainStart,
              crossAxisAlignment: crossStart,
              children: [
                SizedBox(
                  height: Dimensions.marginBetweenInputTitleAndBox,
                ),
                TitleHeading4Widget(
                  text: data[item].label,
                ),
                SizedBox(
                  height: Dimensions.marginBetweenInputTitleAndBox,
                ),
                PrimaryTextInputWidget(
                  controller: inputFieldControllers[item],
                  hintText: '${Strings.enter} ${data[item].label}',
                  borderColor: CustomColor.primaryLightColor,
                  paddings: EdgeInsets.all(Dimensions.paddingSize),
                ),
              ],
            ),
          );
        }
      }

      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
      update();
    });

    _isLoading.value = false;
    update();
    return _kycInfoModel;
  }

  //----------------------submit manual add money--------------------

  late CommonSuccessModel _commonSuccessModel;

  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  Future<CommonSuccessModel> submitKycProcess(
      {required BuildContext context}) async {
    _isLoading.value = true;
    Map<String, String> inputBody = {};

    final data = kycInfoModel.data.nannyKyc;

    for (int i = 0; i < data.length; i += 1) {
      if (data[i].type != 'file') {
        inputBody[data[i].name] = inputFieldControllers[i].text;
      }
    }

    if (kDebugMode) {
      print(listFieldName.toString());
    }
    if (kDebugMode) {
      print(listImagePath.toString());
    }

    await ApiServices.submitKycApi(
            body: inputBody, fieldList: listFieldName, pathList: listImagePath)
        .then((value) {
      debugPrint("kyc check ====> ${listFieldName.toString()}");
      debugPrint("kyc check ====> ${listImagePath.toString()}");
      debugPrint("kyc check ====> ${kycInfoModel.toString()}");
      _commonSuccessModel = value!;
      confirmButtonClick(
          context: context,
          message: _commonSuccessModel.message.success.first.toString());
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
    });
    _isLoading.value = false;
    update();
    return _commonSuccessModel;
  }

  void confirmButtonClick(
      {required BuildContext context, required String message}) {
    goToSignUpWaitForApprovalScreen();
  }

  void goToSignUpWaitForApprovalScreen() {
    Get.toNamed(Routes.nannySignUpWaitForApprovalScreen);
  }

  updateImageData(String fieldName, String imagePath) {
    if (listFieldName.contains(fieldName)) {
      int itemIndex = listFieldName.indexOf(fieldName);
      listImagePath[itemIndex] = imagePath;
    } else {
      listFieldName.add(fieldName);
      listImagePath.add(imagePath);
    }
    update();
  }

  String? getImagePath(String fieldName) {
    if (listFieldName.contains(fieldName)) {
      int itemIndex = listFieldName.indexOf(fieldName);
      return listImagePath[itemIndex];
    }
    return null;
  }
}
