import '/companion_direct/controller/dashboard/profile_controller/image_picker_controller.dart';

import '../../../../backend/model/common/common_success_model.dart';
import '../../../../backend/model/profiel_direct/profile_model.dart';
import '../../../../backend/services/api_services.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../auth/sign_up/sign_up_screen_controller/sign_up_controller.dart';

class NannyProfileController extends GetxController {
  final signUpController = Get.put(NannySignUpController());
  final fullNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneCode = TextEditingController();
  final addressController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();
  final zipCodeController = TextEditingController();
  final statusCodeController = TextEditingController();
  final statusCodeControllerTwo = TextEditingController();
  final statusCodeControllerSingle = TextEditingController();
  final countryName = TextEditingController();
  dynamic image;
  final imageController = Get.put(ProfileImagePicker());

  RxString countryMethod = "".obs;
  RxString nationalityMethod = "American".obs;
  String? selectCountry;

  @override
  void onInit() {
    getProfileData();
    super.onInit();
  }

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late ProfileModel _profileModel;

  ProfileModel get profileModel => _profileModel;

  Future<ProfileModel> getProfileData() async {
    _isLoading.value = true;
    update();

    await ApiServices.profileAPi().then((value) {
      _profileModel = value!;

      var data = profileModel.data.nanny;
      firstNameController.text = data.firstname;
      lastNameController.text = data.lastname;
      emailController.text = data.email;

      countryController.text = data.address.country;
      phoneController.text = data.mobile;
      cityController.text = data.address.city;
      stateController.text = data.address.state;
      zipCodeController.text = data.address.zip;
      addressController.text = data.address.address;
      image = data.image;

      countryMethod.value = data.address.country.toString();
      debugPrint("${data.image.runtimeType}");

      //end of get data and start navigation
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _profileModel;
  }

  final _isUpdateLoading = false.obs;

  bool get isUpdateLoading => _isUpdateLoading.value;

  late CommonSuccessModel _profileUpdateModel;

  // --------------------------- Api function ----------------------------------
  // Profile update process without image
  Future<CommonSuccessModel> profileUpdateWithOutImageProcess() async {
    _isUpdateLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'country': selectCountry.toString(),
      'phone_code': phoneCode.value.text,
      'phone': phoneController.text,
      'city': cityController.text,
      'zip_code': zipCodeController.text,
      'state': stateController.text,
      'address': addressController.text,
      // 'name' : firstNameController.text
    };

    await ApiServices.updateProfileWithoutImageApi(body: inputBody)
        .then((value) {
      _profileUpdateModel = value!;

      _isUpdateLoading.value = false;
      update();
      update();
    }).catchError((onError) {
      log.e(onError);
      _isUpdateLoading.value = false;
      update();
    });

    return _profileUpdateModel;
  }

  Future<CommonSuccessModel> profileUpdateWithImageProcess() async {
    _isUpdateLoading.value = true;
    update();

    Map<String, String> inputBody = {
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'country': selectCountry.toString(),
      'phone_code': phoneCode.value.text,
      'phone': phoneController.text,
      'city': cityController.text,
      'zip_code': zipCodeController.text,
      'state': stateController.text,
      'address': addressController.text,
    };
    debugPrint("test ===== ${imageController.imagePath.value}");

    await ApiServices.updateProfileWithImageApi(
      body: inputBody,
      filepath: imageController.imagePath.value,
    ).then((value) {
      _profileUpdateModel = value!;
      _isUpdateLoading.value = false;
      update();
      update();
    }).catchError((onError) {
      log.e(onError);
      _isUpdateLoading.value = false;
      update();
    });

    return _profileUpdateModel;
  }

  final _isDeleteLoading = false.obs;

  bool get isDeleteLoading => _isDeleteLoading.value;

  late CommonSuccessModel _deleteProfileModel;

  CommonSuccessModel get deleteProfileModel => _deleteProfileModel;

  Future<CommonSuccessModel> deleteProfileData() async {
    _isLoading.value = true;
    update();

    await ApiServices.deleteProfile().then((value) {
      _deleteProfileModel = value!;

      var data = deleteProfileModel;
      statusCodeController.text = data.message.success.first;
      statusCodeControllerTwo.text = data.message.success.last;
      statusCodeControllerSingle.text = data.message.success.single;
      debugPrint(
          "${statusCodeController.text} ${statusCodeControllerTwo.text} ${statusCodeControllerSingle.text}");

      //end of get data and start navigation
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _deleteProfileModel;
  }
}
