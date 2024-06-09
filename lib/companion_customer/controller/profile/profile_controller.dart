import '../../../backend/model/common/common_success_model.dart';
import '../../../backend/model/country_list/country_list_model.dart';
import '../../../backend/model/profile_nanny/user_profile_model.dart';
import '../../../backend/services/api_services.dart';
import '../../../companion_customer/controller/profile/user_image_picker_controller.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../sign_up/sign_up_controller.dart';

class ProfileController extends GetxController {
  final signUpController = Get.put(SignUpController());
  final fullNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final countryController = TextEditingController();
  final imageController = Get.put(UserProfileImagePicker());
  final phoneCode = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final addressController = TextEditingController();
  final zipCodeController = TextEditingController();
  final statusCodeController = TextEditingController();
  final statusCodeControllerTwo = TextEditingController();
  final statusCodeControllerSingle = TextEditingController();
  String? image;
  String? selectCountry;
  String selectCountryCode = '';

  RxString countryMethod = "Bangladesh".obs;
  RxString nationalityMethod = "American".obs;

  @override
  void onInit() {
    getProfileData();
    getCountryList();
    super.onInit();
  }

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late UserProfileModel _profileModel;

  UserProfileModel get profileModel => _profileModel;

  Future<UserProfileModel> getProfileData() async {
    _isLoading.value = true;
    update();

    await ApiServices.userProfileAPi().then((value) {
      _profileModel = value!;
      var data = profileModel.data.user;
      firstNameController.text = data.firstname;
      lastNameController.text = data.lastname;
      emailController.text = data.email;
      selectCountryCode = data.mobileCode;
      countryController.text = data.address.country;
      phoneNumberController.text = data.mobile;
      cityController.text = data.address.city;
      stateController.text = data.address.state;
      addressController.text = data.address.address;
      zipCodeController.text = data.address.zip.toString();
      image = data.image;
      countryMethod.value = data.address.country.toString();
      debugPrint("test ======= ${data.mobile}");

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
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'country': selectCountry.toString(),
      'phone_code': selectCountryCode,
      'mobile': phoneNumberController.text,
      'zip_code': zipCodeController.text.toString(),
      'state': stateController.text,
      'address': addressController.text,
      'city': cityController.text,
    };

    await ApiServices.userUpdateProfileWithoutImageApi(body: inputBody)
        .then((value) {
      _profileUpdateModel = value!;

      Get.toNamed(Routes.bottomNavBar);
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

  // CommonSuccessModel get profileUpdateModel => _profileUpdateModel;
  // Profile update process with image
  Future<CommonSuccessModel> profileUpdateWithImageProcess() async {
    _isUpdateLoading.value = true;
    update();

    Map<String, String> inputBody = {
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'country': selectCountry.toString(),
      'phone_code': selectCountryCode,
      'phone': phoneNumberController.text,
      'zip_code': zipCodeController.text,
      'state': stateController.text,
      'address': addressController.text,
      'city': cityController.text,
    };
    debugPrint("test ===== ${imageController.imagePath.value}");

    await ApiServices.userUpdateProfileWithImageApi(
      body: inputBody,
      filepath: imageController.imagePath.value,
    ).then((value) {
      _profileUpdateModel = value!;

      Get.toNamed(Routes.bottomNavBar);
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

  late CountryListModel _countryListModel;

  CountryListModel get countryListModel => _countryListModel;

  Future<CountryListModel> getCountryList() async {
    _isLoading.value = true;
    update();

    await ApiServices.countryListApi().then((value) {
      _countryListModel = value!;

      //end of get data and start navigation
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _countryListModel;
  }

  final _isDeleteLoading = false.obs;

  bool get isDeleteLoading => _isDeleteLoading.value;

  late CommonSuccessModel _deleteProfileModel;

  CommonSuccessModel get deleteProfileModel => _deleteProfileModel;

  Future<CommonSuccessModel> deleteProfileData() async {
    _isLoading.value = true;
    update();

    await ApiServices.deleteUserProfile().then((value) {
      _deleteProfileModel = value!;

      var data = deleteProfileModel;
      statusCodeController.text = data.message.success.first;
      statusCodeControllerTwo.text = data.message.success.last;
      statusCodeControllerSingle.text = data.message.success.single;
      debugPrint(
          "${statusCodeController.text} ${statusCodeControllerTwo.text} ${statusCodeControllerSingle.text}");

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _deleteProfileModel;
  }
}
