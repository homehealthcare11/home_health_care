import '../model/common/common_success_model.dart';
import '../model/two_fa_nanny/two_fa_nanny.dart';
import '../utils/api_method.dart';
import '../utils/custom_snackbar.dart';
import 'api_endpoint.dart';

class TwoFaApiServices {
  ///* Two fa get process api
  static Future<TwoFaInfoModel?> twoFaGetApiProcess() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.directTwoFaGetURL,
        code: 200,
      );
      if (mapResponse != null) {
        TwoFaInfoModel result = TwoFaInfoModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Two fa get process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Two fa get process api
  static Future<TwoFaInfoModel?> userTwoGetApiProcess() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.userTwoFaGetURL,
        code: 200,
      );
      if (mapResponse != null) {
        TwoFaInfoModel result = TwoFaInfoModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Two fa get process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Two fa submit process api
  static Future<CommonSuccessModel?> twoFaSubmitApiProcess(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.directTwoFaSubmitURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Two fa submit process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(
          'Something went Wrong! in Two fa submit process api services');
      return null;
    }
    return null;
  }

  ///* Two fa submit process api
  static Future<CommonSuccessModel?> userTwoFaSubmitApiProcess(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.userTwoFaSubmitURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Two fa submit process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(
          'Something went Wrong! in Two fa submit process api services');
      return null;
    }
    return null;
  }
}
