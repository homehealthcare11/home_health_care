import 'package:get/get.dart';
import 'package:sitterhub/companion_direct/views/companions_screen.dart';
import '/companion_customer/views/about_us/about_us.dart';
import '/companion_customer/views/digital_payment/paypal/paypal_web_payment_screen.dart';
import '/companion_customer/views/privacy_policy_screen/privacy_policy_screen.dart';
import '/companion_customer/views/settings/settings_screen.dart';
import '/companion_direct/views/about_us/about_us.dart';
import '/companion_direct/views/money_out/preview/money_out_preview.dart';
import '/companion_direct/views/privacy_policy_screen/privacy_policy_screen.dart';
import '/companion_direct/views/setting/settings.dart';

import '../../companion_direct/views/money_out/money_out_manual_payment_screen.dart';
import '../../companion_direct/views/two_fa_verification_screen/two_fa_verification.dart';
import '../bindings/splash_screen_binding.dart';
import '../routes/routes.dart';
import '../views/add_baby/add_baby.dart';
import '../views/add_baby/baby_details/baby_details_screen.dart';
import '../views/add_pet/add_pet.dart';
import '../views/add_pet/pet_details/pet_details_screen.dart';
import '../views/address/add_home/add_home.dart';
import '../views/address/choose_your_location/choose_your_location.dart';
import '../views/address/congratulation_screen/congratulation_screen.dart';
import '../views/auth/sign_in_screen/congratulation_screen_sign_in/congratulation_screen_sign_in.dart';
import '../views/auth/sign_in_screen/forgot_password/forgot_password.dart';
import '../views/auth/sign_in_screen/otp_verification_screen/otp_verification_screen.dart';
import '../views/auth/sign_in_screen/reset_password/reset_password_screen.dart';
import '../views/auth/sign_in_screen/sign_in_screen.dart';
import '../views/auth/sign_up_screen/congratulation_screen/congratulations_screen.dart';
import '../views/auth/sign_up_screen/email_verification/email_verification.dart';
import '../views/auth/sign_up_screen/sign_up_screen.dart';
import '../views/auth/two_fa_verification/two_fa_verification_sign_in.dart';

import '../views/booking_schedule/booking_schedule.dart';
import '../views/bottom_nav_bar/bottom_nav_bar.dart';

import '../views/change_password/change_password_screen.dart';
import '../views/digital_payment/add_card_screen/add_card_mobile_responsive.dart';
import '../views/digital_payment/digital_payment_screen.dart';
import '../views/favorite/favorite_screen.dart';
import '../views/home_screen/baby_sitter_congratulation/baby_sitter_congratulation.dart';
import '../views/home_screen/baby_sitter_screen.dart';
import '../views/kyc_screen/approval_screen/approval_screen.dart';
import '../views/my_baby_pets/my_baby_pets.dart';
import '../views/nanny/nanny_screen.dart';
import '../views/notification_screen/notification_screen.dart';
import '../views/onboard_screen/onboard_screen.dart';
import '../views/pet_sitter/service_request_pet.dart';
import '../views/profile_screen/profile_screen.dart';
import '../views/profile_screen/update_profile/update_profile.dart';
import '../views/saved_address/saved_address.dart';
import '../views/service_cart/service_cart_screen.dart';
import '../views/service_request/service_request.dart';
import '../views/service_request_accepted/service_tracking_mobile_response.dart';
import '../views/splash_screen/splash_screen.dart';
import '../views/two_fa_security/two_fa_security.dart';
import '../views/two_fa_verification_screen/two_fa_verification.dart';
import '../welcome_screen/welcome_screen.dart';

class CustomerRoutePageList {
  static var list = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.onboardScreen,
      page: () => const OnboardScreen(),
    ),
    GetPage(
      name: Routes.signupScreen,
      page: () => const SignupScreen(),
    ),
    GetPage(
      name: Routes.emailVerificationScreen,
      page: () => const EmailVerification(),
    ),
    GetPage(
      name: Routes.userGoogleTwoFaScreen,
      page: () => UserTwoFaOtpVerificationScreen(),
    ),
    GetPage(
      name: Routes.congratulationScreen,
      page: () => const CongratulationScreen(),
    ),
    GetPage(
      name: Routes.resetPasswordScreen,
      page: () => const ResetPasswordScreen(),
    ),
    GetPage(
      name: Routes.congratulationScreenSignIn,
      page: () => const CongratulationScreenSignIn(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: Routes.signInScreen,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: Routes.bookingSchedule,
      page: () => const BookingSchedule(),
    ),
    GetPage(
      name: Routes.chooseYourLocation,
      page: () => const ChooseYourLocationScreen(),
    ),
    GetPage(
      name: Routes.addHomeScreen,
      page: () => const AddHomeScreen(),
    ),
    GetPage(
      name: Routes.digitalPaymentScreen,
      page: () => const DigitalPaymentScreen(),
    ),
    GetPage(
      name: Routes.addCardScreen,
      page: () => WebPaymentScreen(),
    ),

    GetPage(
      name: Routes.paypalWebPaymentScreen,
      page: () => PaypalWebPaymentScreen(),
    ),
    GetPage(
      name: Routes.notificationScreen,
      page: () => const NotificationScreen(),
    ),
    GetPage(
      name: Routes.twoFaSecurity,
      page: () => const TwoFaSecurityScreen(),
    ),
    GetPage(
      name: Routes.changePasswordScreen,
      page: () => const ChangePasswordScreen(),
    ),

    GetPage(
      name: Routes.profileScreen,
      page: () => const ProfileScreen(),
    ),

    GetPage(
      name: Routes.settingScreen,
      page: () => const SettingsScreen(),
    ),
    GetPage(
      name: Routes.settingScreenNanny,
      page: () => SettingsScreenNanny(),
    ),
    GetPage(
      name: Routes.babySitter,
      page: () => const BabySitter(),
    ),
    GetPage(
      name: Routes.nannyScreen,
      page: () => const CompanionDetailsScreen(),
    ),
    GetPage(
      name: Routes.companionsScreen,
      page: () => const CompanionsScreen(),
    ),
    GetPage(
      name: Routes.serviceRequestScreen,
      page: () => const ServiceRequest(),
    ),
    GetPage(
      name: Routes.serviceRequestAcceptedScreen,
      page: () => ServiceTrackingMobileResponse(),
    ),
    GetPage(
      name: Routes.serviceCartScreen,
      page: () => const ServiceCartScreen(),
    ),
    GetPage(
      name: Routes.myBabyPetsScreen,
      page: () => const MyPatientsScreen(),
    ),
    GetPage(
      name: Routes.updateProfileScreen,
      page: () => const UpdateProfileScreen(),
    ),
    GetPage(
      name: Routes.favoriteScreen,
      page: () => const FavoriteScreen(),
    ),
    GetPage(
      name: Routes.addBabyScreen,
      page: () => const AddBaby(),
    ),
    // GetPage(
    //   name: Routes.kycScreen,
    //   page: () => SignUpKycVerificationScreenMobile(),
    // ),
    GetPage(
      name: Routes.signUpWaitForApprovalScreen,
      page: () => const SignUpWaitForApprovalScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.babyDetailsScreen,
      page: () => const BabyDetailsScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.bottomNavBar,
      page: () => const BottomNavBar(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.otpVerificationScreen,
      page: () => const OtpVerificationScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.congratulationScreenSignIn,
      page: () => const CongratulationScreenSignIn(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.babySitterCongratulation,
      page: () => const BabySitterCongratulation(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.savedAddressScreen,
      page: () => const SavedAddress(),
      // binding: SignInBinding(),
    ),

    GetPage(
      name: Routes.serviceRequestPetSitter,
      page: () => const ServiceRequestPet(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.addPet,
      page: () => const AddPet(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.petDetails,
      page: () => const PetDetailsScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
      // binding: SignInBinding(),
    ),

    GetPage(
      name: Routes.congratulationScreenAddress,
      page: () => const CongratulationScreenAddress(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.nannyTwoFaScreen,
      page: () => const TwoFaVerificationScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.userTwoFaScreen,
      page: () => const UserTwoFaVerificationScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.nannyAboutUs,
      page: () => const AboutUsScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.userAboutUs,
      page: () => const AboutUsScreenUser(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.nannyPrivacy,
      page: () => const PrivacyPolicyScreen(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.userPrivacy,
      page: () => const PrivacyPolicyUserScreen(),
      // binding: SignInBinding(),
    ),

    GetPage(
      name: Routes.moneyOutPreviewScreen,
      page: () => const MoneyOutPreviewScreen(),
      // binding: SignInBinding(),
    ),

    GetPage(
      name: Routes.moneyOutManualPaymentScreen,
      page: () => MoneyOutManualPaymentScreen(),
    ),
  ];
}
