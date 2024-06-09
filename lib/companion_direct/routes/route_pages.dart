import 'package:get/get.dart';
import '/companion_direct/views/auth/two_fa_verification_screen.dart';
import '/companion_direct/views/dashboard/service_request/service_request_screen.dart';
import '/companion_direct/views/money_out/money_out_screen.dart';

import '../../companion_customer/routes/routes.dart';
import '../views/address/add_home/add_home_screen.dart';
import '../views/address/choose_your_location/choose_your_location_screen.dart';
import '../views/address/save_address_congratulation_screen/save_address_congratulation_screen.dart';
import '../views/auth/sign_in/forgot_password/forgot_password_screen.dart';
import '../views/auth/sign_in/forgot_password_otp_verification/forgot_password_otp_verification_screen.dart';
import '../views/auth/sign_in/reset_password/reset_password_screen.dart';
import '../views/auth/sign_in/reset_password_congratulation/reset_password_congratulation_screen.dart';
import '../views/auth/sign_in/sign_in_screen.dart';
import '../views/auth/sign_up/sign_up_email_otp_verification/sign_up_email_otp_verification_screen.dart';
import '../views/auth/sign_up/sign_up_kyc_verification/sign_up_kyc_verification_screen.dart';
import '../views/auth/sign_up/sign_up_screen/sign_up_screen.dart';
import '../views/auth/sign_up/sign_up_wait_for_approval/sign_up_wait_for_approval_screen.dart';
import '../views/dashboard/dashboard_screen/dashboard_screen.dart';
import '../views/dashboard/drawer_menu/change_password/change_password_screen.dart';
import '../views/dashboard/drawer_menu/history/history_screen.dart';
import '../views/dashboard/drawer_menu/notification/notification_screen.dart';
import '../views/dashboard/profile/digital_payment/add_card_screen/add_card_screen.dart';
import '../views/dashboard/profile/digital_payment/digital_payment_screen/digital_payment_screen.dart';
import '../views/dashboard/profile/profile_screen/profile_screen.dart';
import '../views/dashboard/profile/saved_address/saved_address_screen.dart';
import '../views/dashboard/profile/update_profile/update_profile_screen.dart';
import '../views/select_profession/select_profession_screen.dart';
import '../views/work_details/work_details_screen.dart';
import '../widgets/drawer/drawer_widget.dart';

class DirectRoutePageList {
  static var list = [
    GetPage(
      name: Routes.signInScreenNannyDirect,
      page: () => const SignInScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.nannyForgotPasswordScreen,
      page: () => const ForgotPasswordScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.nannyOtpVerificationScreen,
      page: () => const ForgotPasswordOtpVerificationScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.nannyResetPasswordScreen,
      page: () => const ResetPasswordScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.resetPasswordCongratulationScreen,
      page: () => const ResetPasswordCongratulationScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => const SignUpScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.signUpEmailOtpVerificationScreen,
      page: () => const SignUpEmailOtpVerificationScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.signUpKycVerificationScreen,
      page: () => const SignUpKycVerificationScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.nannySignUpWaitForApprovalScreen,
      page: () => const SignUpWaitForApprovalScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.selectProfessionScreen,
      page: () => const SelectProfessionScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.workDetailsScreen,
      page: () => const WorkDetailsScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.chooseYourLocationScreen,
      page: () => const ChooseYourLocationScreen(),
      // binding: SignInBinding(),
    ),

    GetPage(
      name: Routes.nannyAddHomeScreen,
      page: () => const AddHomeScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.nannyMoneyOutScreen,
      page: () => const MoneyOutScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.saveAddressCongratulationScreen,
      page: () => const SaveAddressCongratulationScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.nannyProfileScreen,
      page: () => const ProfileScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.nannyUpdateProfileScreen,
      page: () => const UpdateProfileScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.nannyDigitalPaymentScreen,
      page: () => const DigitalPaymentScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.nannyAddCardScreen,
      page: () => const AddCArdScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.nannySavedAddressScreen,
      page: () => const SavedAddressScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.drawer,
      page: () => DrawerWidget(),
      // binding: SignInBinding(),
    ),
    // GetPage(
    //   name: Routes.nannyTwoFaSecurity,
    //   page: () => const TwoFaSecurityScreen(),
    //   // binding: SignInBinding(),
    // ),
    GetPage(
      name: Routes.nannyTwoFaGoogleSecurity,
      page: () => TwoFaOtpVerificationScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.nannyNotificationScreen,
      page: () => const NotificationScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.nannyChangePasswordScreen,
      page: () => const ChangePasswordScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.nannyHistoryScreen,
      page: () => const HistoryScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.dashboardScreen,
      page: () => const DashboardScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.nannyServiceRequestScreen,
      page: () => const ServiceRequestScreen(),
      // binding: SignInBinding(),
    ),
  ];
}
