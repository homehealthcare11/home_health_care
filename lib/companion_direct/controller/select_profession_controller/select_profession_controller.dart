import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../backend/local_storage/local_storage.dart';
import '../../../backend/model/common/common_success_model.dart';
import '../../../backend/model/profession_direct/profession_model.dart';
import '../../../backend/model/service_area_nanny_direct/service_area_model.dart';
import '../../../backend/services/api_services.dart';
import '../../utils/basic_screen_imports.dart';
import '/companion_customer/routes/routes.dart';
import '/companion_direct/controller/kyc_check_controller.dart';

class SelectProfessionController extends GetxController {
  RxBool isCheckedBaby = false.obs;
  RxBool isCheckedPet = true.obs;
  final bioController = TextEditingController();
  final chargeController = TextEditingController();

  KycCheckController controller = Get.put(KycCheckController());

  @override
  void onInit() {
    super.onInit();
    if (controller.kycCheck == false) {
      getProfessionData();
    }
    LocalStorage.isLoggedIn() ? getServiceArea() : null;
  }

  //baby sitter
  RxInt selectedInfo = 0.obs;

  RxInt isServiceAreaSelected = 0.obs;
  RxString selectedNumberOfServiceArea = ''.obs;

  //Type of Charge
  final List<String> typeOfCharge = ["Hourly", "Daily", "Weekly"];

  RxInt isTypeOfChargeSelected = 0.obs;
  RxString selectedTypeOfCharge = ''.obs;

  var selectedCurrency = 'USD'.obs;

  var currencyList = ["USD"].obs;

  RxBool getWorkDetails = false.obs;

  goToAddressScreen() {
    Get.offAllNamed(Routes.nannyProfileScreen);
  }

  var selectedDate = DateTime.now().obs;

  final List<String> babyGender = ["Male", "Female", "Other"];
  final List<String> numberOfKid = [
    "Single",
    "Multiple",
  ];

  RxDouble sliderValue = 0.0.obs;
  RxDouble sliderValueAge = 0.0.obs;
  RxDouble sliderValueCapability = 0.0.obs;

  RxInt isBabyGenderSelected = 1.obs;

  RxInt isNumberOfKidSelected = 1.obs;

  RxString selectedBabyGender = ''.obs;
  RxString selectedNumberOfKidType = ''.obs;

  //pet sitter
  final List<String> patientType = [
    "Wound Care",
    "Medication Management",
    "Palliative Care",
    "Chronic Disease Management",
    "Post-Surgical Care",
    "Geriatric Care",
    "Pediatric Care",
    "Physical Therapy",
    "Occupational Therapy",
    "Hospice Care",
    "Diabetes Management",
    "Infusion Therapy",
    "Respiratory Therapy",
    "Mental Health Support",
    "Telehealth Services",
    "Pain Management",
    "Rehabilitation Services",
    "Cardiac Care",
    "Nutrition Counseling",
    "Fall Prevention and Safety Education"
  ];

  final List<String> patientGender = ["Male", "Female", "Both"];

  final List<String> numberOfPatient = [
    "Single",
    "Multiple",
  ];

  final List<String> experience = [
    '0-6m',
    '6m-1y',
    '1y-2y',
    '2y-5y',
    '5y-8y',
    '8y-9y',
    '9y-10y',
    '11y+',
  ];

  final List<String> age = [
    '0-6m',
    '6m-1y',
    '1y-2y',
    '2y-5y',
    '5y-8y',
    '8y-9y',
    '9y-10y',
    '11y+',
  ];

  final List<String> capability = [
    '12-24hrs',
    '2d',
    '2-4d',
    '4-6d',
    '1w',
    '1-2w',
    '1m',
    '2m+',
  ];

  RxInt isPetTypeSelected = 0.obs;
  RxInt isPetGenderSelected = 0.obs;
  RxInt isNumberOfPetSelected = 0.obs;

  RxString selectedNumberOfPetType = ''.obs;
  RxString selectedPetGender = ''.obs;

  RxBool getProfession = false.obs;

  goToWorkDetailsScreen() {
    getProfession.value == true
        ? Get.toNamed(Routes.nannyProfileScreen)
        : Get.toNamed(Routes.workDetailsScreen);
  }

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late CommonSuccessModel _commonSucessModel;

  CommonSuccessModel get selectProfessionModel => _commonSucessModel;

  Future<CommonSuccessModel> selectProfessionProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = isCheckedPet.value
        ? {
            'profession_type': 1,
            'baby_gender': babyGender[isBabyGenderSelected.value].toString(),
            'baby_age': age[sliderValueAge.toInt()],
            'baby_number': numberOfKid[isNumberOfKidSelected.value].toString(),
            'work_experience': experience[sliderValue.toInt()],
            'work_capability': capability[sliderValueCapability.toInt()],
            'service_area': serviceArea[isServiceAreaSelected.value].toString(),
            'charge': typeOfCharge[isTypeOfChargeSelected.value].toString(),
            'amount': chargeController.text,
            'bio': bioController.text,
          }
        : {
            'profession_type': 2,
            'gender': patientGender[isPetGenderSelected.value].toString(),
            'age': age[sliderValueAge.toInt()],
            'number': numberOfPatient[isNumberOfPetSelected.value].toString(),
            'work_experience': experience[sliderValue.toInt()],
            'work_capability': capability[sliderValueCapability.toInt()],
            'service_area': serviceArea[isServiceAreaSelected.value].toString(),
            'charge': typeOfCharge[isTypeOfChargeSelected.value].toString(),
            'amount': chargeController.text,
            'bio': bioController.text,
            'pet_type': patientType[isPetTypeSelected.value]
          };
    // debugPrint(sliderValueCapability.toInt() as String?);

    await ApiServices.selectProfessionApi(body: inputBody).then((value) {
      _commonSucessModel = value!;
      goToAddressScreen();

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _commonSucessModel;
  }

  final _isUpdateLoading = false.obs;

  bool get isUpdateLoading => _isUpdateLoading.value;

  late CommonSuccessModel _commonModel;

  CommonSuccessModel get commonSuccessModel => _commonModel;

  Future<CommonSuccessModel> updateProfession() async {
    _isUpdateLoading.value = true;
    debugPrint("test1");
    update();

    Map<String, dynamic> inputBody = isCheckedPet.value
        ? {
            'profession_type': 1,
            'baby_gender': babyGender[isBabyGenderSelected.value].toString(),
            'baby_age': age[sliderValueAge.toInt()],
            'baby_number': numberOfKid[isNumberOfKidSelected.value].toString(),
            'work_experience': experience[sliderValue.toInt()],
            'work_capability': capability[sliderValueCapability.toInt()],
            'service_area': serviceArea[isServiceAreaSelected.value].toString(),
            'charge': typeOfCharge[isTypeOfChargeSelected.value].toString(),
            'amount': chargeController.text,
            'bio': bioController.text,
            'target': id
          }
        : {
            'profession_type': 2,
            'gender': patientGender[isPetGenderSelected.value].toString(),
            'age': age[sliderValueAge.toInt()],
            'number': numberOfPatient[isNumberOfPetSelected.value].toString(),
            'work_experience': experience[sliderValue.toInt()],
            'work_capability': capability[sliderValueCapability.toInt()],
            'service_area': serviceArea[isServiceAreaSelected.value].toString(),
            'charge': typeOfCharge[isTypeOfChargeSelected.value].toString(),
            'amount': chargeController.text,
            'bio': bioController.text,
            'pet_type': patientType[isPetTypeSelected.value],
            'target': id
          };
    // debugPrint(sliderValueCapability.toInt() as String?);

    await ApiServices.professionUpdateApi(body: inputBody).then((value) {
      debugPrint("Step 7");
      _commonModel = value!;
      debugPrint("Step 8");

      goToAddressScreen();
      debugPrint("Step end");

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isUpdateLoading.value = false;
    update();
    return _commonModel;
  }

  int id = 0;

  late ProfessionModel _professionModel;

  ProfessionModel get professionModel => _professionModel;

  Future<ProfessionModel> getProfessionData() async {
    typeOfCharge.clear();
    currencyList.clear();
    babyGender.clear();
    patientGender.clear();
    numberOfKid.clear();
    numberOfPatient.clear();
    currencyList.clear();
    _isLoading.value = true;
    update();

    await ApiServices.getProfessionApi().then((value) {
      _professionModel = value!;

      var data = professionModel.data.nanny;

      for (int i = 0; i < professionModel.data.defaultCurrency.length; i++) {
        currencyList.add(professionModel.data.defaultCurrency[i]);
      }

      for (int i = 0; i < professionModel.data.chargeType.length; i++) {
        typeOfCharge.add(professionModel.data.chargeType[i]);
      }

      for (int i = 0; i < professionModel.data.gender.length; i++) {
        babyGender.add(professionModel.data.gender[i]);
        patientGender.add(professionModel.data.gender[i]);
      }
      for (int i = 0; i < professionModel.data.petType.length; i++) {
        patientType.add(professionModel.data.petType[i]);
      }

      for (int i = 0; i < professionModel.data.number.length; i++) {
        numberOfKid.add(professionModel.data.number[i]);
        numberOfPatient.add(professionModel.data.number[i]);
      }

      id = data.id;
      debugPrint("testing ==== $id");

      for (int i = 0; i < experience.length; i++) {
        if (data.workExperience == experience[i]) {
          sliderValue = i.toDouble().obs;
        }
        if (data.workCapability == capability[i]) {
          sliderValueCapability = i.toDouble().obs;
        }

        if (data.professionTypeDetails.babyAge == age[i]) {
          sliderValueAge = i.toDouble().obs;
        }
      }
      for (int i = 0; i < typeOfCharge.length; i++) {
        if (typeOfCharge[i] == data.charge) {
          isTypeOfChargeSelected.value = i;
        }
      }
      for (int i = 0; i < babyGender.length; i++) {
        if (babyGender[i] == data.professionTypeDetails.babyGender) {
          debugPrint(
              "baby gender ${babyGender[i]} ${data.professionTypeDetails.babyGender}");
          isBabyGenderSelected = i.obs;
        }
      }
      for (int i = 0; i < numberOfKid.length; i++) {
        if (numberOfKid[i] == data.professionTypeDetails.babyNumber) {
          isNumberOfKidSelected = i.obs;
        }
      }
      chargeController.text = data.amount.toString();
      bioController.text = data.bio;
      //end of get data and start navigation
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _professionModel;
  }

  final List<String> serviceArea = [];
  final _isServiceAreaLoading = false.obs;

  bool get isServiceAreaLoading => _isServiceAreaLoading.value;

  late ServiceAreaModel _serviceAreaModel;

  ServiceAreaModel get serviceAreaModel => _serviceAreaModel;

  Future<ServiceAreaModel> getServiceArea() async {
    _isServiceAreaLoading.value = true;
    update();

    await ApiServices.serviceAreaListProcessApi().then((value) {
      _serviceAreaModel = value!;

      var data = serviceAreaModel.data;
      for (int i = 0; i < data.length; i++) {
        serviceArea.add(data[i].serviceArea);
      }

      if (kDebugMode) {
        print(serviceArea);
      }

      //end of get data and start navigation
      update();
    } as FutureOr Function(ServiceAreaModel? value)).catchError((onError) {
      log.e(onError);
    });

    _isServiceAreaLoading.value = false;
    update();
    return _serviceAreaModel;
  }
}
