

import '../model/common/common_success_model.dart';
import '../model/companion_direct_money_out/money_out_info_model.dart';
import '../model/companion_direct_money_out/money_out_model.dart';
import '../utils/api_method.dart';
import '../utils/custom_snackbar.dart';
import '../utils/logger.dart';
import 'api_endpoint.dart';

final log = logger(MoneyOutApiServices);

class MoneyOutApiServices {

//withdraw info
  static Future<WithdrawInfoModel?> withdrawInfoApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.moneyOutGetURL,
        code: 200,
        showResult: false,
      );
      if (mapResponse != null) {
        WithdrawInfoModel withdrawInfoModel =
        WithdrawInfoModel.fromJson(mapResponse);

        return withdrawInfoModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from withdraw info api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in withdraw info api');
      return null;
    }
    return null;
  }

//withdraw dynamic
  static Future<NannyMoneyOutModel?> withdrawInsertApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false)
          .post(ApiEndpoint.moneyOutInsertURL, body, code: 200);
      if (mapResponse != null) {
        NannyMoneyOutModel result =
        NannyMoneyOutModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e('err from money out insert process api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  // withdraw submit
  static Future<CommonSuccessModel?> withdrawSubmitApi({
    required Map<String, String> body,
    required List<String> pathList,
    required List<String> fieldList,
  }) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).multipartMultiFile(
        ApiEndpoint.moneyOutConfirmURL,
        body,
        showResult: true,
        fieldList: fieldList,
        pathList: pathList,
      );
      if (mapResponse != null) {
        CommonSuccessModel registrationModel =
        CommonSuccessModel.fromJson(mapResponse);
        // CustomSnackBar.success(
        //     registrationModel.message.success.first.toString());

        return registrationModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from withdraw submit api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }
}
