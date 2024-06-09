import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../backend/model/user_nanny_list/nanny_details_model.dart';
import '../../../backend/services/api_services.dart';
import '../../../companion_customer/controller/babby_sitter/baby_sitter_controller.dart';

class NannyDetailsController extends GetxController {
  final controller = Get.put(BabySitterController());
  final userNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final reviewController = TextEditingController();
  final workExperienceController = TextEditingController();
  final workCapabilityController = TextEditingController();
  final chargeTypeController = TextEditingController();
  final amountController = TextEditingController();
  final bioController = TextEditingController();
  final currencyCodeController = TextEditingController();
  int professionId = 0;

  @override
  void onInit() {
    getNannyDetails();
    super.onInit();
  }

  int totalNumberOfService = 0;
  int totalTaskComplete = 0;

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late NannyDetailsModel _nannyDetailsModel;

  NannyDetailsModel get nannyDetailsModel => _nannyDetailsModel;

  Future<NannyDetailsModel> getNannyDetails() async {
    _isLoading.value = true;
    update();

    await ApiServices.getNannyDetailsApi(controller.id).then((value) {
      debugPrint("id ==== ${controller.id.toString()}");
      _nannyDetailsModel = value!;
      var data = nannyDetailsModel.data;
      professionId = data.nanny.nannyProfession.professionType;
      firstNameController.text = data.nanny.firstname;
      bioController.text = data.nanny.nannyProfession.bio;
      lastNameController.text = data.nanny.lastname;
      userNameController.text = data.nanny.username;
      emailController.text = data.nanny.email;
      emailController.text = data.nanny.email;
      totalNumberOfService = data.totalNannyService;
      totalTaskComplete = data.totalNannyTaskComplate;
      workExperienceController.text = data.nanny.nannyProfession.workExperience;
      amountController.text = data.nanny.nannyProfession.amount.toString();
      chargeTypeController.text = data.nanny.nannyProfession.charge;
      currencyCodeController.text = data.nanny.userRequests.first.currencyCode;
      debugPrint(
          "❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️ currency =======> ${data.nanny.userRequests[0].currencyCode}");

      // addressController.text = data.nanny.address.country;

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _nannyDetailsModel;
  }
}
