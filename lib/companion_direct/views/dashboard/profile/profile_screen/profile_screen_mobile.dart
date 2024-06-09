import '../../../../../backend/services/api_endpoint.dart';
import '../../../../../backend/utils/custom_loading_api.dart';
import '../../../../../backend/utils/custom_snackbar.dart';
import '../../../../../custom_assets/assets.gen.dart';
import '../../../../../companion_customer/routes/routes.dart';
import '../../../../../companion_direct/controller/auth/sign_up/sign_up_kyc_verification_controller/sign_up_kyc_verification_controller.dart';
import '../../../../controller/dashboard/profile_controller/profile_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/appbar/custom_app_bar.dart';
import '../../../../widgets/inputs/profile_tile_widget.dart';
import '../../../../widgets/others/custom_image_widget.dart';
import '/companion_customer/language/language_controller.dart';

class ProfileScreenMobileNannyDirect extends StatelessWidget {
  ProfileScreenMobileNannyDirect({Key? key}) : super(key: key);
  final controller = Get.put(NannyProfileController());
  final kycCheckController = Get.put(SignUpKycVerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Strings.profile.tr,
          leadingPadding: EdgeInsets.only(left: Dimensions.paddingSize),
          onTap: () {
        Get.toNamed(Routes.dashboardScreen);
      }),
      body: Obx(() {
        return controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context);
      }),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      physics: const BouncingScrollPhysics(),
      children: [
        _userImage(context),
        _drawerItems(context),
      ],
    );
  }

  _userImage(BuildContext context) {
    var data = controller.profileModel.data;
    final image =
        '${ApiEndpoint.mainDomain}/${data.imagePath}/${data.nanny.image}';
    final defaultImage = '${ApiEndpoint.mainDomain}/${data.defaultImage}';
    String text = controller.firstNameController.text;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: Dimensions.marginSizeVertical * .5),
          width: MediaQuery.of(context).size.width * 0.37,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Theme.of(context).primaryColor, width: 3),
          ),
          child: Center(
            child: CircleAvatar(
              radius: Dimensions.radius * 5.8,
              backgroundColor: Colors.transparent,
              // backgroundImage: NetworkImage(data.image ?? controller.profileModel.data.defaultImage),
              child: CircleAvatar(
                backgroundColor:
                    CustomColor.secondaryLightColor.withOpacity(0.3),
                radius: Dimensions.radius * 5.5,
                backgroundImage:
                    NetworkImage(data.nanny.image != '' ? image : defaultImage),
              ),
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.heightSize,
        ),
        TitleHeading2Widget(
            text: "${text[0].toUpperCase()}${text.substring(1, text.length)}"),
        SizedBox(
          height: Dimensions.heightSize * 0.2,
        ),
        Row(
          mainAxisAlignment: mainCenter,
          children: [
            TitleHeading3Widget(
              text: controller.emailController.text,
              color: CustomColor.primaryLightTextColor.withOpacity(0.3),
              fontWeight: FontWeight.w500,
            ),
            horizontalSpace(Dimensions.widthSize * 0.5),
            CustomImageWidget(
              path: Assets.icon.verified,
              height: 13,
              width: 13,
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.heightSize * 1.8,
        ),
      ],
    );
  }

  _drawerItems(BuildContext context) {
    final languageController = Get.put(LanguageController());
    return SizedBox(
      child: Column(
        children: [
          ProfileTileWidgets(
              img: Assets.icon.profile,
              title: Strings.updateProfile.tr,
              onTap: () {
                Get.toNamed(Routes.nannyUpdateProfileScreen);
              }),
          ProfileTileWidgets(
              img: Assets.icon.brifecase,
              title: Strings.professionUpdate.tr,
              onTap: () {
                Get.toNamed(Routes.selectProfessionScreen);
              }),
          ProfileTileWidgets(
              img: Assets.icon.updateWorkDetails,
              title: Strings.updateWorkDetails.tr,
              onTap: () {
                Get.toNamed(Routes.workDetailsScreen);
              }),
          ProfileTileWidgets(
              img: Assets.icon.kycVerification,
              title: Strings.kycVerification.tr,
              onTap: () {
                kycCheckController.kycInfoModel.data.kycStatus == 1
                    ? CustomSnackBar.success(languageController
                        .getTranslation(Strings.kycVerified.tr))
                    : kycCheckController.kycInfoModel.data.kycStatus == 3
                        ? Get.toNamed(Routes.signUpKycVerificationScreen)
                        : CustomSnackBar.pending(languageController
                            .getTranslation(Strings.pendingMsg.tr));
              }),
        ],
      ),
    );
  }
}
