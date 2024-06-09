import '../../extensions/custom_extensions.dart';

class ApiEndpoint {
  static const String mainDomain = "https://daralkhulood.com/home-care";
  static const String baseUrl = "$mainDomain/api/v1";

  /*--------  user part  ---------*/
  static String userLoginURL = '/user/login'.addBaseURl();
  static String twoFaOtoVerifyURL =
  '/nanny/security/google-2fa/verified'.addBaseURl();
  static String userTwoFaOtoVerifyURL =
  '/user/security/google-2fa/verified'.addBaseURl();

  //register section
  static String userRegisterURL = '/user/register'.addBaseURl();
  static String basicSettingsURL = '/user/basic/settings'.addBaseURl();
  static String languagesURL = '/user/languages'.addBaseURl();
  static String userRegisterOtpVerifyURL = '/user/otp/verify'.addBaseURl();
  static String userRegisterOtpResendURL = '/user/resend/code'.addBaseURl();
  static String userLogoutURL = '/user/logout'.addBaseURl();
  static String nannyLogoutURL = '/nanny/logout'.addBaseURl();
  static String userServiceCart = '/user/service-tracking'.addBaseURl();
  static String userRatingURL = '/user/user-request/rating'.addBaseURl();
  static String userNotification = '/user/user-notification'.addBaseURl();
  static String nannyNotification = '/nanny/nanny-notification'.addBaseURl();
  static String serviceRequestNannyURL = '/nanny/service-request'.addBaseURl();
  static String nannyDashboardURL = '/nanny/dashboard'.addBaseURl();
  static String countryList = '/country-list'.addBaseURl();
  static String serviceRequestAcceptNannyURL =
  '/nanny/service-request/update'.addBaseURl();
  static String userAddMoney = '/user/add-money/submit-data'.addBaseURl();
  static String userAddMoneyConfirm =
  '/user/add-money/stripe/payment/confirm?name=user'.addBaseURl();

  //nanny user profile section
  static String userProfileURL = '/user/profile'.addBaseURl();
  static String userUpdateProfileApi = '/user/profile/update'.addBaseURl();
  static String serviceTrackingCancel =
  '/user/service-tracking/cancel'.addBaseURl();
  static String userServiceRequestURL =
  '/user/user-request/submit'.addBaseURl();
  static String userAddBabyUrl = '/user/add-baby-pet/store'.addBaseURl();
  static String userUpdateBabyUrl = '/user/add-baby-pet/update'.addBaseURl();

  //nanny user change password
  static String userChangePassword =
  '/user/profile/password/update'.addBaseURl();
  static String directChangePassword =
  '/nanny/profile/password/update'.addBaseURl();

  //nanny my baby and pets list
  static String babyAndPetListUrl = '/user/add-baby-pet'.addBaseURl();

  //nanny add baby
  static String userDeleteBabyUrl = '/user/add-baby-pet/delete'.addBaseURl();

  //nanny list section
  static String nannyList = '/user/nanny-list'.addBaseURl();

  //nanny direct register section
  static String directRegisterURL = '/nanny/register'.addBaseURl();
  static String directRegisterOtpVerifyURL = '/nanny/otp/verify'.addBaseURl();
  static String directRegisterOtpResendURL = '/nanny/resend/code'.addBaseURl();

  static String directKycURL = '/nanny/kyc/submit'.addBaseURl();
  static String directTwoFaGetURL = '/nanny/security/google-2fa'.addBaseURl();
  static String userTwoFaGetURL = '/user/security/google-2fa'.addBaseURl();
  static String directTwoFaSubmitURL =
  '/nanny/security/google-2fa/status/update'.addBaseURl();
  static String userTwoFaSubmitURL =
  '/user/security/google-2fa/status/update'.addBaseURl();
  static String directTwoFaVerifiedURL =
  '/nanny/security/google-2fa/verified'.addBaseURl();
  static String userTwoFaVerifiedURL =
  '/user/security/google-2fa/verified'.addBaseURl();
  static String kycInputFieldsURL = '/nanny/kyc'.addBaseURl();

  static String selectProfessionSubmitURL =
  '/nanny/profession/submit'.addBaseURl();
  static String selectProfessionUpdateURL =
  '/nanny/profile/profession/update'.addBaseURl();
  static String directLoginURL = '/nanny/login'.addBaseURl();
  static String directForgotPasswordSendOtpURL =
  '/nanny/forgot/password/send/otp'.addBaseURl();
  static String directForgotPasswordVerifyOtpURL =
  '/nanny/forgot/password/verify'.addBaseURl();
  static String directResetPasswordURL =
  '/nanny/forgot/password/reset'.addBaseURl();
  static String profileURL = '/nanny/profile'.addBaseURl();
  static String getProfessionURL = '/nanny/profile/profession'.addBaseURl();
  static String nannyDetails = '/user/nanny-list/nanny/details'.addBaseURl();
  static String deleteProfileURL = '/nanny/profile/delete'.addBaseURl();
  static String userDeleteProfileURL = '/user/profile/delete'.addBaseURl();
  static String updateProfileApi = '/nanny/profile/update'.addBaseURl();
  static String nannyServiceAreaUrl = '/nanny/service-area'.addBaseURl();
  static String serviceAreaListURL = '/service-area'.addBaseURl();

  //forgot password section
  static String userForgotPasswordSendOtpURL =
  '/user/forgot/password/send/otp'.addBaseURl();
  static String userForgotPasswordVerifyOtpURL =
  '/user/forgot/password/verify'.addBaseURl();
  static String userResetPasswordURL =
  '/user/forgot/password/reset'.addBaseURl();

  ///nanny money out
  static String moneyOutGetURL = '/nanny/money-out/info'.addBaseURl();
  static String moneyOutInsertURL = '/nanny/money-out/insert'.addBaseURl();
  static String moneyOutConfirmURL = '/nanny/money-out/confirmed'.addBaseURl();
}
