import 'package:http/http.dart' as http;

import '../../backend/services/api_endpoint.dart';
import '../../companion_customer/utils/basic_screen_imports.dart';
import '../model/auth/sign_in_customer/forgot_password_customer/forgot_password_model.dart';
import '../model/auth/sign_in_customer/forgot_password_customer/forgot_password_otp_verification_model.dart';
import '../model/auth/sign_in_customer/sign_in_model.dart';
import '../model/auth/sign_in_direct/forgot_password_direct/forgot_password_direct_model.dart';
import '../model/auth/sign_in_direct/forgot_password_direct/forgot_password_otp_verification_direct_model.dart';
import '../model/auth/sign_in_direct/sign_in_direct_model.dart';
import '../model/auth/sign_up_customer/signup_model.dart';
import '../model/auth/sign_up_direct/sign_up_direct_model_kyc.dart';
import '../model/auth/sign_up_direct/sign_up_model_direct.dart';
import '../model/common/common_success_model.dart';
import '../model/country_list/country_list_model.dart';
import '../model/dashboard/dashboard_model.dart';
import '../model/direct_notification/direct_notification_model.dart';
import '../model/nanny_user_store_baby_pet/baby_pet_get_model.dart';
import '../model/nanny_user_store_baby_pet/baby_pet_store_model.dart';
import '../model/pet_store/pet_store_model.dart';
import '../model/profession_direct/profession_model.dart';
import '../model/profiel_direct/profile_model.dart';
import '../model/profile_nanny/user_profile_model.dart';
import '../model/service_area_nanny_direct/service_area_model.dart';
import '../model/service_cart_user/service_cart_user_model.dart';
import '../model/service_request_nanny_direct/service_request_model.dart';
import '../model/user_nanny_list/nanny_details_model.dart';
import '../model/user_nanny_list/user_nanny_list_model.dart';
import '../model/user_notification/user_notification_model.dart';
import '../model/user_payment_method/payment_method_model.dart';
import '../model/user_payment_method/payment_method_paypal_model.dart';
import '../utils/api_method.dart';
import '../utils/custom_snackbar.dart';
import '../utils/logger.dart';

final log = logger(ApiServices);

class ApiServices {
  static var client = http.Client();

  ///* Two fa otp verify process api
  static Future<CommonSuccessModel?> twoFaVerifyOTPApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.twoFaOtoVerifyURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Two fa otp verify process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Two fa otp verify process api
  static Future<CommonSuccessModel?> userTwoFaVerifyOTPApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.userTwoFaOtoVerifyURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Two fa otp verify process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //!Logout Api method
  static Future<CommonSuccessModel?> logOut() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.userLogoutURL,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel logOutModel =
            CommonSuccessModel.fromJson(mapResponse);
        return logOutModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from log out api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in logout model');
      return null;
    }
    return null;
  }

  //!Nanny direct Logout Api method
  static Future<CommonSuccessModel?> logOutDirect() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.nannyLogoutURL,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel logOutModel =
            CommonSuccessModel.fromJson(mapResponse);
        return logOutModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from log out api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in logout model');
      return null;
    }
    return null;
  }

  //!Nanny service cart Api method
  static Future<ServiceCartModel?> serviceCartApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false)
          .get(ApiEndpoint.userServiceCart, code: 200, showResult: true);
      if (mapResponse != null) {
        ServiceCartModel serviceCartModel =
            ServiceCartModel.fromJson(mapResponse);
        return serviceCartModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from service cart api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in service cart model');
      return null;
    }
    return null;
  }

  static Future<CountryListModel?> countryListApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true)
          .get(ApiEndpoint.countryList, code: 200, showResult: true);
      if (mapResponse != null) {
        CountryListModel serviceCartModel =
            CountryListModel.fromJson(mapResponse);
        return serviceCartModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from country list api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in country list');
      return null;
    }
    return null;
  }

  //!Nanny direct service area Api method
  static Future<ServiceAreaModel?> serviceAreaApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.nannyServiceAreaUrl,
        code: 200,
      );
      if (mapResponse != null) {
        ServiceAreaModel serviceAreaModel =
            ServiceAreaModel.fromJson(mapResponse);
        return serviceAreaModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from log out api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in logout model');
      return null;
    }
    return null;
  }

  //!Nanny direct service area Api method
  static Future<ServiceAreaModel?> serviceAreaListProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).get(
        ApiEndpoint.serviceAreaListURL,
        code: 200,
      );
      if (mapResponse != null) {
        ServiceAreaModel serviceAreaModel =
            ServiceAreaModel.fromJson(mapResponse);
        return serviceAreaModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from log out api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in logout model');
      return null;
    }
    return null;
  }

  //!Nanny direct dashboard Api method
  static Future<DashboardModel?> getDashboardApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.nannyDashboardURL,
        code: 200,
      );
      if (mapResponse != null) {
        DashboardModel serviceAreaModel = DashboardModel.fromJson(mapResponse);
        return serviceAreaModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from dashboard api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in dashboard model');
      return null;
    }
    return null;
  }

  //SignUp Api method
  static Future<SignUpModel?> signUpApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.userRegisterURL,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        SignUpModel signUpModel = SignUpModel.fromJson(mapResponse);
        CustomSnackBar.success(signUpModel.message.success.first.toString());
        return signUpModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from sign up api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in LoginModel');
      return null;
    }
    return null;
  }

  //user rating api method
  static Future<CommonSuccessModel?> userRatingApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.userRatingURL,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        CommonSuccessModel commonSuccessModel =
            CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(
            commonSuccessModel.message.success.first.toString());
        return commonSuccessModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from user rating api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in user rating model');
      return null;
    }
    return null;
  }

  //nanny profession update Api method
  static Future<CommonSuccessModel?> professionUpdateApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    debugPrint("Step 1");
    try {
      debugPrint("Step 2");
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.selectProfessionUpdateURL,
        body,
        code: 200,
        showResult: true,
      );
      debugPrint("Step 3");
      if (mapResponse != null) {
        debugPrint("Step 4");
        CommonSuccessModel commonSuccessModel =
            CommonSuccessModel.fromJson(mapResponse);
        debugPrint("Step 5");
        CustomSnackBar.success(
            commonSuccessModel.message.success.first.toString());
        debugPrint("Step 6");
        return commonSuccessModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from profession api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in CommonSuccessModel');
      return null;
    }
    return null;
  }

  //sign up direct api
  static Future<SignUpModelDirect?> signUpApiDirect(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.directRegisterURL,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        SignUpModelDirect signUpModel = SignUpModelDirect.fromJson(mapResponse);
        CustomSnackBar.success(signUpModel.message.success.first.toString());
        return signUpModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from sign up api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in LoginModel');
      return null;
    }
    return null;
  }

  //sign up email verification Api method
  static Future<CommonSuccessModel?> emailVerificationApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.userRegisterOtpVerifyURL,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        CommonSuccessModel commonSuccessModel =
            CommonSuccessModel.fromJson(mapResponse);

        return commonSuccessModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from email verification api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //direct select profession
  static Future<CommonSuccessModel?> selectProfessionApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.selectProfessionSubmitURL,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        CommonSuccessModel commonSuccessModel =
            CommonSuccessModel.fromJson(mapResponse);

        return commonSuccessModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from select profession submission ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //sign up direct email verification Api method
  static Future<CommonSuccessModel?> emailVerificationDirectApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.directRegisterOtpVerifyURL,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        CommonSuccessModel commonSuccessModel =
            CommonSuccessModel.fromJson(mapResponse);

        return commonSuccessModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from email verification api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //sign up resend otp Api method
  static Future<CommonSuccessModel?> signUpResendOtpApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.userRegisterOtpResendURL,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        CommonSuccessModel commonSuccessModel =
            CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(
            commonSuccessModel.message.success.first.toString());
        return commonSuccessModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from sign Up resend otp api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //sign up direct resend otp Api method
  static Future<CommonSuccessModel?> signUpResendOtpDirectApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.directRegisterOtpResendURL,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        CommonSuccessModel commonSuccessModel =
            CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(
            commonSuccessModel.message.success.first.toString());
        return commonSuccessModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from sign Up resend otp api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //Login Api method
  static Future<SignInModel?> signInApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.userLoginURL,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        SignInModel loginModel = SignInModel.fromJson(mapResponse);
        CustomSnackBar.success(loginModel.message.success.first.toString());
        return loginModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from login api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in LoginModel');
      return null;
    }
    return null;
  }

  //Direct login Api method
  static Future<SignInDirectModel?> signInDirectApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      debugPrint('nanny login test');
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.directLoginURL,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        debugPrint('nanny login test 2');
        SignInDirectModel loginModel = SignInDirectModel.fromJson(mapResponse);
        CustomSnackBar.success(loginModel.message.success.first.toString());
        return loginModel;
      }
    } catch (e) {
      debugPrint('nanny login test 3');
      log.e('🐞🐞🐞 err from login api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in LoginModel');
      return null;
    }
    return null;
  }

  //Forgot Password Otp Api method
  static Future<ForgotPasswordEmailModel?> forgotPasswordEmailApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.userForgotPasswordSendOtpURL,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        ForgotPasswordEmailModel forgotPasswordOtpModel =
            ForgotPasswordEmailModel.fromJson(mapResponse);
        CustomSnackBar.success(
            forgotPasswordOtpModel.message.success.first.toString());
        return forgotPasswordOtpModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from forgot password email api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //Direct Forgot Password Otp Api method
  static Future<ForgotPasswordEmailDirectModel?> forgotPasswordEmailDirectApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.directForgotPasswordSendOtpURL,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        ForgotPasswordEmailDirectModel forgotPasswordOtpModel =
            ForgotPasswordEmailDirectModel.fromJson(mapResponse);
        CustomSnackBar.success(
            forgotPasswordOtpModel.message.success.first.toString());
        return forgotPasswordOtpModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from forgot password email api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //reset Otp Api method
  static Future<ResetOtpModel?> resetOtpApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.userForgotPasswordVerifyOtpURL,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        ResetOtpModel resetOtpModel = ResetOtpModel.fromJson(mapResponse);
        CustomSnackBar.success(resetOtpModel.message.success.first.toString());
        return resetOtpModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from reset otp api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //Direct reset Otp Api method
  static Future<ResetOtpDirectModel?> resetOtpDirectApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.directForgotPasswordVerifyOtpURL,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        ResetOtpDirectModel resetOtpModel =
            ResetOtpDirectModel.fromJson(mapResponse);
        CustomSnackBar.success(resetOtpModel.message.success.first.toString());
        return resetOtpModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from reset otp api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //reset password Api method
  static Future<CommonSuccessModel?> resetPasswordApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.userResetPasswordURL,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        CommonSuccessModel commonSuccessModel =
            CommonSuccessModel.fromJson(mapResponse);
        // CustomSnackBar.success(
        //     commonSuccessModel.message.success.first.toString());
        return commonSuccessModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from reset password api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //reset password Api method
  static Future<CommonSuccessModel?> changePasswordApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.userChangePassword,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        CommonSuccessModel commonSuccessModel =
            CommonSuccessModel.fromJson(mapResponse);
        // CustomSnackBar.success(
        //     commonSuccessModel.message.success.first.toString());
        return commonSuccessModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from reset password api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  } //reset password Api method

  static Future<CommonSuccessModel?> changePasswordDirectApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.directChangePassword,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        CommonSuccessModel commonSuccessModel =
            CommonSuccessModel.fromJson(mapResponse);
        // CustomSnackBar.success(
        //     commonSuccessModel.message.success.first.toString());
        return commonSuccessModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from reset password api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  } //reset password Api method

  static Future<CommonSuccessModel?> resetPasswordDirectApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.directResetPasswordURL,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        CommonSuccessModel commonSuccessModel =
            CommonSuccessModel.fromJson(mapResponse);

        return commonSuccessModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from reset password api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  static Future<CommonSuccessModel?> verifyMailCodeApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.userRegisterOtpVerifyURL,
        body,
        showResult: true,
      );
      if (mapResponse != null) {
        CommonSuccessModel mailVerifyCodeModel =
            CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(
            mailVerifyCodeModel.message.success.first.toString());
        return mailVerifyCodeModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from verify Mail Code Api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in verify Mail Code Api');
      return null;
    }
    return null;
  }

  //resend email Api method
  static Future<CommonSuccessModel?> resendVerificationCodeApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.userRegisterOtpResendURL,
        body,
        showResult: true,
      );
      if (mapResponse != null) {
        CommonSuccessModel mailCodeModel =
            CommonSuccessModel.fromJson(mapResponse);
        // CustomSnackBar.success(mailCodeModel.message.success.first.toString());
        return mailCodeModel;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from resend Verification Code Api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(
          'Something went Wrong! in resend Verification Code Api');
      return null;
    }
    return null;
  }

  // registration with kyc
  static Future<KycInfoModel?> registrationApiKyc({
    required Map<String, String> body,
    required List<String> pathList,
    required List<String> fieldList,
  }) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).multipartMultiFile(
        ApiEndpoint.directKycURL,
        body,
        showResult: true,
        fieldList: fieldList,
        pathList: pathList,
      );
      if (mapResponse != null) {
        KycInfoModel registrationModel = KycInfoModel.fromJson(mapResponse);
        return registrationModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from registration api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in registration Model');
      return null;
    }
    return null;
  }

  //submit manual payment gateway Api method
  static Future<CommonSuccessModel?> submitKycApi({
    required Map<String, String> body,
    required List<String> pathList,
    required List<String> fieldList,
  }) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).multipartMultiFile(
        ApiEndpoint.directKycURL,
        body,
        code: 200,
        // duration: 15,
        showResult: true,
        fieldList: fieldList,
        pathList: pathList,
      );
      if (mapResponse != null) {
        CommonSuccessModel commonSuccessModel =
            CommonSuccessModel.fromJson(mapResponse);
        // CustomSnackBar.success(
        //     automaticPaymentGatewayModel.message.success.first.toString());
        return commonSuccessModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from kyc submit api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //kyc direct
  //kyc Additional field method
  static Future<KycInfoModel?> kycInputFieldsApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.kycInputFieldsURL,
        code: 200,
        duration: 15,
        showResult: true,
      );
      if (mapResponse != null) {
        KycInfoModel kycInfoModel = KycInfoModel.fromJson(mapResponse);
        return kycInfoModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from kyc additional field api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //kyc Additional field method
  static Future<UserNotificationModel?> userNotificationApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.userNotification,
        code: 200,
        duration: 15,
        showResult: true,
      );
      if (mapResponse != null) {
        UserNotificationModel result =
            UserNotificationModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from user notification api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //notification direct field method
  static Future<DirectNotificationModel?> directNotificationApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.nannyNotification,
        code: 200,
        duration: 15,
        showResult: true,
      );
      if (mapResponse != null) {
        DirectNotificationModel result =
            DirectNotificationModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from user notification api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //service request list direct api field method
  static Future<ServiceRequestModel?> serviceRequestListApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.serviceRequestNannyURL,
        code: 200,
        duration: 15,
        showResult: true,
      );
      if (mapResponse != null) {
        ServiceRequestModel result = ServiceRequestModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from user service request list api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //! profile section started

  static Future<ProfileModel?> profileAPi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.profileURL,
        code: 200,
      );
      if (mapResponse != null) {
        ProfileModel profileModel = ProfileModel.fromJson(mapResponse);

        return profileModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from profile Api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in profile Api');
      return null;
    }
    return null;
  }

  //! profile section started

  static Future<NannyListModel?> nannyListApi(url) async {
    Map<String, dynamic>? mapResponse;
    try {
      debugPrint(" 🐞🐞🐞 ${ApiEndpoint.nannyList}$url");
      mapResponse = await ApiMethod(isBasic: false).get(
        "${ApiEndpoint.nannyList}$url",
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        NannyListModel nannyListModel = NannyListModel.fromJson(mapResponse);

        return nannyListModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from nanny list Api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in nanny list Api');
      return null;
    }
    return null;
  }

  //! get profession section started

  static Future<ProfessionModel?> getProfessionApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.getProfessionURL,
        showResult: true,
        code: 200,
      );
      if (mapResponse != null) {
        ProfessionModel professionModel = ProfessionModel.fromJson(mapResponse);

        return professionModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from profession Api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in get profession Api');
      return null;
    }
    return null;
  }

  //! get nanny details started

  static Future<NannyDetailsModel?> getNannyDetailsApi(int id) async {
    Map<String, dynamic>? mapResponse;
    try {
      debugPrint('Step 1');
      mapResponse = await ApiMethod(isBasic: false)
          .get("${ApiEndpoint.nannyDetails}/$id", code: 200, showResult: true);
      if (mapResponse != null) {
        debugPrint('Step 2');
        NannyDetailsModel nannyDetailsModel =
            NannyDetailsModel.fromJson(mapResponse);
        debugPrint('Step 3');
        return nannyDetailsModel;
      }
      debugPrint('Step 4');
    } catch (e) {
      debugPrint('Step 5');
      log.e('🐞🐞🐞 err from nanny details Api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in get nanny details Api');
      return null;
    }
    return null;
  }

  //! profile section started

  static Future<CommonSuccessModel?> deleteProfile() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.deleteProfileURL,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel commonSuccessModel =
            CommonSuccessModel.fromJson(mapResponse);

        return commonSuccessModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from profile Api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in profile Api');
      return null;
    }
    return null;
  }

  static Future<CommonSuccessModel?> deleteUserProfile() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.userDeleteProfileURL,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel commonSuccessModel =
            CommonSuccessModel.fromJson(mapResponse);

        return commonSuccessModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from profile Api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in profile Api');
      return null;
    }
    return null;
  }

  static Future<UserProfileModel?> userProfileAPi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.userProfileURL,
        showResult: true,
        code: 200,
      );
      if (mapResponse != null) {
        UserProfileModel profileModel = UserProfileModel.fromJson(mapResponse);

        return profileModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from profile Api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in profile Api');
      return null;
    }
    return null;
  }

  //nanny baby and pet data list
  static Future<BabyPetGetModel?> babyAndPetListAPi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.babyAndPetListUrl,
        code: 200,
      );
      if (mapResponse != null) {
        BabyPetGetModel profileModel = BabyPetGetModel.fromJson(mapResponse);

        return profileModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from profile Api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in profile Api');
      return null;
    }
    return null;
  }

  // user update profile  Api method
  static Future<CommonSuccessModel?> userUpdateProfileWithoutImageApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false)
          .post(ApiEndpoint.userUpdateProfileApi, body, code: 200);
      if (mapResponse != null) {
        CommonSuccessModel updateProfileModel =
            CommonSuccessModel.fromJson(mapResponse);

        return updateProfileModel;
      }
    } catch (e) {
      log.e('err from update profile api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  // user update profile  Api method
  static Future<CommonSuccessModel?> serviceRequestApi(
      {required Map<String, dynamic> body, required int id}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        "${ApiEndpoint.userServiceRequestURL}/$id",
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        CommonSuccessModel serviceRequestModel =
            CommonSuccessModel.fromJson(mapResponse);

        return serviceRequestModel;
      }
    } catch (e) {
      log.e('err from service request api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  // user service request accept api
  static Future<CommonSuccessModel?> serviceRequestAccept(
      {required Map<String, dynamic> body, required int id}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        "${ApiEndpoint.serviceRequestAcceptNannyURL}/$id",
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e('err from service request api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  // user service cancel api
  static Future<CommonSuccessModel?> serviceCancelApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.serviceTrackingCancel,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        CommonSuccessModel serviceRequestModel =
            CommonSuccessModel.fromJson(mapResponse);

        return serviceRequestModel;
      }
    } catch (e) {
      log.e('err from service cancel api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  // user service cancel api
  static Future<PaymentMethodModel?> userAddMoneyApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.userAddMoney,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        PaymentMethodModel paymentMethodModel =
            PaymentMethodModel.fromJson(mapResponse);

        return paymentMethodModel;
      }
    } catch (e) {
      log.e('err from payment method api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  // user service cancel api
  static Future<PaymentMethodPaypalModel?> userAddMoneyPaypalApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.userAddMoney,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        PaymentMethodPaypalModel paymentMethodModel =
            PaymentMethodPaypalModel.fromJson(mapResponse);

        return paymentMethodModel;
      }
    } catch (e) {
      log.e('err from payment method paypal api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  // user payment confirmation api
  static Future<CommonSuccessModel?> userAddMoneyConfirmApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.userAddMoneyConfirm,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e('err from confirm payment api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //nanny user add baby api
  static Future<BabyPetStoreModel?> addBabyWithoutImageApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false)
          .post(ApiEndpoint.userAddBabyUrl, body, code: 200);
      if (mapResponse != null) {
        BabyPetStoreModel updateProfileModel =
            BabyPetStoreModel.fromJson(mapResponse);

        return updateProfileModel;
      }
    } catch (e) {
      log.e('err from update profile api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

//nanny user add pet api

  static Future<BabyPetStoreModel?> addPetWithoutImageApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false)
          .post(ApiEndpoint.userAddBabyUrl, body, code: 200);
      if (mapResponse != null) {
        BabyPetStoreModel updateProfileModel =
            BabyPetStoreModel.fromJson(mapResponse);

        return updateProfileModel;
      }
    } catch (e) {
      log.e('err from update profile api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //nanny user add baby api
  static Future<CommonSuccessModel?> deleteBabyApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false)
          .post(ApiEndpoint.userDeleteBabyUrl, body, code: 200);
      if (mapResponse != null) {
        CommonSuccessModel updateProfileModel =
            CommonSuccessModel.fromJson(mapResponse);

        return updateProfileModel;
      }
    } catch (e) {
      log.e('err from update profile api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //nanny user update baby api
  static Future<CommonSuccessModel?> updateBabyWithoutImageApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false)
          .post(ApiEndpoint.userUpdateBabyUrl, body, code: 200);
      if (mapResponse != null) {
        CommonSuccessModel updateProfileModel =
            CommonSuccessModel.fromJson(mapResponse);

        return updateProfileModel;
      }
    } catch (e) {
      log.e('err from update profile api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  // user with img update profile api
  static Future<CommonSuccessModel?> userUpdateProfileWithImageApi(
      {required Map<String, String> body, required String filepath}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).multipart(
          ApiEndpoint.userUpdateProfileApi, body, filepath, 'image',
          code: 200);

      if (mapResponse != null) {
        CommonSuccessModel profileUpdateModel =
            CommonSuccessModel.fromJson(mapResponse);

        return profileUpdateModel;
      }
    } catch (e) {
      log.e('err from profile update api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  // user with img update baby api
  static Future<CommonSuccessModel?> updateBabyWithImageApi(
      {required Map<String, String> body, required String filepath}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).multipart(
          ApiEndpoint.userUpdateBabyUrl, body, filepath, 'image',
          code: 200);

      if (mapResponse != null) {
        CommonSuccessModel profileUpdateModel =
            CommonSuccessModel.fromJson(mapResponse);

        return profileUpdateModel;
      }
    } catch (e) {
      log.e('err from profile update api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  } // user add baby with img api

  static Future<BabyPetStoreModel?> addBabyWithImageApi(
      {required Map<String, String> body, required String filepath}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).multipart(
          ApiEndpoint.userAddBabyUrl, body, filepath, 'image',
          code: 200);

      if (mapResponse != null) {
        BabyPetStoreModel profileUpdateModel =
            BabyPetStoreModel.fromJson(mapResponse);

        return profileUpdateModel;
      }
    } catch (e) {
      log.e('err from profile update api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //nanny user add pet
  static Future<PetStoreModel?> addPetWithImageApi(
      {required Map<String, String> body, required String filepath}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).multipart(
          ApiEndpoint.userAddBabyUrl, body, filepath, 'image',
          code: 200);

      if (mapResponse != null) {
        PetStoreModel petStoreModel = PetStoreModel.fromJson(mapResponse);

        return petStoreModel;
      }
    } catch (e) {
      log.e('err from add pet api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  //  update profile  Api method
  static Future<CommonSuccessModel?> updateProfileWithoutImageApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false)
          .post(ApiEndpoint.updateProfileApi, body, code: 200);
      if (mapResponse != null) {
        CommonSuccessModel updateProfileModel =
            CommonSuccessModel.fromJson(mapResponse);

        return updateProfileModel;
      }
    } catch (e) {
      log.e('err from update profile api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  // with img update profile api
  static Future<CommonSuccessModel?> updateProfileWithImageApi(
      {required Map<String, String> body, required String filepath}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).multipart(
          ApiEndpoint.updateProfileApi, body, filepath, 'image',
          code: 200);

      if (mapResponse != null) {
        CommonSuccessModel profileUpdateModel =
            CommonSuccessModel.fromJson(mapResponse);

        return profileUpdateModel;
      }
    } catch (e) {
      log.e('err from profile update api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }
}
