import '../../../backend/model/user_nanny_list/user_nanny_list_model.dart';
import '../../../backend/services/api_services.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../categories/categories_controller.dart';

class BabySitterController extends GetxController {
  String url = '';

  @override
  void onInit() {
    getNannyList(url);
    debugPrint(" second test${id.toString()}");
    super.onInit();
  }

  // all text editing controller
  final categoryController = Get.put(CategoriesController());
  RxBool isChecked = false.obs;
  RxBool isChecked1 = false.obs;
  RxBool isChecked2 = false.obs;
  RxBool isChecked3 = false.obs;
  RxBool isChecked4 = false.obs;
  RxBool isChecked5 = false.obs;
  RxBool isChecked6 = false.obs;
  RxInt isBabyGenderSelected = 0.obs;
  RxString selectedBabyGender = ''.obs;
  RxString selectedNumberOfKidType = ''.obs;
  int index = 0;
  int id = 112;
  RxString professionType = "".obs;

  RxBool isSelected = false.obs;
  RxInt isNumberOfKidSelected = 0.obs;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  RxInt selectIndex = RxInt(-1);

  void selectItem(int index) {
    selectIndex.value = index;
  }

  bool isItemSelected(int index) {
    return selectIndex.value == index;
  }

  Color getItemColor(int index) {
    return isItemSelected(index) ? Colors.blue : Colors.white;
  }

  RxString serviceArea = "".obs;
  RxString workExperience = "".obs;
  RxString workCapability = "".obs;
  RxString charge = "".obs;
  RxString slug = "".obs;
  RxString nationalityMethod = "Dhaka".obs;

  List<String> serviceAreaList = [];
  List<String> workExperienceList = [];
  List<String> workCapabilityList = [];
  List<String> chargeList = [];
  List<String> slugList = [];

  // dispose all controller while the screen destroy
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void goToNannyScreen() {
    Get.toNamed(Routes.nannyScreen);
  }

  void goToServiceRequestScreen() {
    Get.toNamed(Routes.serviceRequestScreen);
  }

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late NannyListModel _nannyListModel;

  NannyListModel get companionListModel => _nannyListModel;

  Future<NannyListModel> getNannyList(String url) async {
    _isLoading.value = true;
    update();

    await ApiServices.nannyListApi(url).then((value) {
      _nannyListModel = value!;
      serviceAreaList = [];
      slugList = [];
      workExperienceList = [];
      workCapabilityList = [];
      chargeList = [];
      for (int i = 0; i < companionListModel.data.area.length; i++) {
        serviceAreaList.add(companionListModel.data.area[i].serviceArea);
        slugList.add(companionListModel.data.area[i].slug);
      }
      debugPrint("🎨🖌️🎨🖌️🎨🖌️$slugList");
      serviceArea.value = companionListModel.data.area.first.serviceArea;
      for (int i = 0; i < companionListModel.data.workExperience.length; i++) {
        workExperienceList.add(companionListModel.data.workExperience[i]);
      }
      for (int i = 0; i < companionListModel.data.workCapability.length; i++) {
        workCapabilityList.add(companionListModel.data.workCapability[i]);
      }

      for (int i = 0; i < companionListModel.data.charge.length; i++) {
        chargeList.add(companionListModel.data.charge[i]);
      }

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _nannyListModel;
  }
}
