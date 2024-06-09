import '../../../backend/services/api_endpoint.dart';
import '../../controller/profile/profile_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/appbar/custom_app_bar.dart';
import '../../widgets/others/custom_image_widget.dart';
import '../../widgets/text_labels/profile_title_widget.dart';
import '/backend/utils/custom_loading_api.dart';

class ProfileScreenMobileResponsive extends StatelessWidget {
  ProfileScreenMobileResponsive({Key? key}) : super(key: key);
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Strings.profile.tr,
          alwaysShowBackButton: false,
          leadingPadding: EdgeInsets.only(left: Dimensions.paddingSize),
          onTap: () {
        Get.back();
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
        '${ApiEndpoint.mainDomain}/${data.imagePath}/${data.user.image}';
    final defaultImage = '${ApiEndpoint.mainDomain}/${data.defaultImage}';
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
              child: CircleAvatar(
                backgroundColor:
                    CustomColor.secondaryLightColor.withOpacity(0.3),
                radius: Dimensions.radius * 5.5,
                backgroundImage:
                    NetworkImage(data.user.image != '' ? image : defaultImage),
              ),
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.heightSize,
        ),
        TitleHeading2Widget(text: controller.firstNameController.text),
        SizedBox(
          height: Dimensions.heightSize * 0.2,
        ),
        Row(
          crossAxisAlignment: crossCenter,
          mainAxisAlignment: mainCenter,
          children: [
            TitleHeading4Widget(
              text: controller.emailController.text,
              opacity: 0.9,
              color: CustomColor.primaryLightTextColor.withOpacity(0.5),
            ),
            horizontalSpace(Dimensions.widthSize * 0.3),
            CustomImageWidget(
              path: Assets.icon.verified,
              height: 10.h,
              width: 10.w,
            )
          ],
        ),
        SizedBox(
          height: Dimensions.heightSize * 1.8,
        ),
      ],
    );
  }

  _drawerItems(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          ProfileTileWidgets(
              img: Assets.icon.profile,
              title: Strings.updateProfile.tr,
              onTap: () {
                Get.toNamed(Routes.updateProfileScreen);
              }),
          ProfileTileWidgets(
              img: Assets.icon.babyPets,
              title: "My Patients",
              onTap: () {
                Get.toNamed(Routes.myBabyPetsScreen);
              }),
        ],
      ),
    );
  }
}
