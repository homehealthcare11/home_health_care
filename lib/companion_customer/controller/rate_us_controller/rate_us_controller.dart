import '../../../backend/model/common/common_success_model.dart';
import '../../../backend/services/api_services.dart';
import '../../../companion_customer/utils/basic_screen_imports.dart';

class RateUsController extends GetxController {
  final reviewController = TextEditingController();
  int userRequestId = 1;
  int rating = 3;

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late CommonSuccessModel _commonSuccessModel;

  CommonSuccessModel get serviceRequest => _commonSuccessModel;

  Future<CommonSuccessModel> serviceRatingProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'user_request_id': userRequestId,
      'rating': rating,
      'comment': reviewController.text,
    };

    await ApiServices.userRatingApi(body: inputBody).then((value) {
      _commonSuccessModel = value!;

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _commonSuccessModel;
  }
}
