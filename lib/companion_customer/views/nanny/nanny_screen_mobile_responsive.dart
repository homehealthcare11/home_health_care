import '../../../backend/services/api_endpoint.dart';
import '../../../backend/utils/custom_loading_api.dart';
import '../../../companion_customer/controller/nanny_details/nanny_details_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/details_card/details_card_widget.dart';
import '../../widgets/others/custom_image_widget.dart';
import '../../widgets/review_card/review_card_widget.dart';
import '/companion_customer/widgets/appbar/custom_app_bar.dart';

class CompanionDetailsMobileResponsive extends StatelessWidget {
  CompanionDetailsMobileResponsive({
    super.key,
  });

  final controller = Get.put(NannyDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Strings.nanny.tr,
          leadingPadding: EdgeInsets.all(Dimensions.paddingSize * 0.4),
          onTap: () {
        Get.offAllNamed(Routes.bottomNavBar);
      }),
      body: Obx(() => controller.isLoading
          ? const CustomLoadingAPI()
          : _bodyWidget(context)),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () {
          return controller.getNannyDetails();
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
                left: Dimensions.paddingSize * 0.5,
                right: Dimensions.paddingSize * 0.5,
                top: Dimensions.paddingSize * 0.5),
            child: Column(
              children: [
                _nannyImage(context),
                _serviceRequestButton(context),
                verticalSpace(Dimensions.heightSize * 1.333),
                _detailsCardWidget(context),
                verticalSpace(Dimensions.heightSize * 1.333),
                _serviceReviewWidget(context),
                verticalSpace(Dimensions.heightSize),
              ],
            ),
          ),
        ),
      ),
    );
  }

//user image
  _nannyImage(BuildContext context) {
    var data = controller.nannyDetailsModel.data;
    var dataImage = controller.nannyDetailsModel.data;
    final image =
        '${ApiEndpoint.mainDomain}/${dataImage.imagePath}/${dataImage.nanny.image}';
    final defaultImage = '${ApiEndpoint.mainDomain}/${dataImage.dataDefault}';
    debugPrint("image ===== ${dataImage.nanny.image}");
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
                backgroundImage: NetworkImage(
                  data.nanny.image == '' ? defaultImage : image,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.heightSize,
        ),
        TitleHeading2Widget(text: controller.userNameController.text),
        SizedBox(
          height: Dimensions.heightSize * 0.2,
        ),
        Row(
          children: [
            horizontalSpace(Dimensions.widthSize * 10),
            TitleHeading4Widget(
              text: controller.emailController.text,
              opacity: 0.9,
              color: CustomColor.primaryLightTextColor.withOpacity(0.5),
            ),
            CustomImageWidget(path: Assets.icon.verified)
          ],
        ),
        SizedBox(
          height: Dimensions.heightSize * 1.8,
        ),
      ],
    );
  }

//service button
  _serviceRequestButton(BuildContext context) {
    return PrimaryButton(
      title: Strings.serviceRequest.tr,
      onPressed: () {
        Get.toNamed(Routes.addHomeScreen);
      },
      borderColor: CustomColor.primaryLightColor,
      buttonColor: CustomColor.primaryLightColor,
    );
  }

//details card
  _detailsCardWidget(BuildContext context) {
    return DetailsCardWidget();
  }

  //service review
  _serviceReviewWidget(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TitleHeading2Widget(
              text: Strings.serviceReview.tr,
              fontWeight: FontWeight.w600,
            ),
            horizontalSpace(Dimensions.widthSize),
            horizontalSpace(Dimensions.widthSize * 0.51),
          ],
        ),
        verticalSpace(Dimensions.heightSize * 0.667),
        _reviewDetailsWidget(context),
      ],
    );
  }

  //review details widget
  _reviewDetailsWidget(BuildContext context) {
    var data = controller.nannyDetailsModel.data.nanny;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: controller.nannyDetailsModel.data.nanny.review.isEmpty
          ? TitleHeading3Widget(
              text: Strings.noReview.tr,
              color: CustomColor.blackColor.withOpacity(0.5),
            )
          : Center(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount:
                    controller.nannyDetailsModel.data.nanny.review.length,
                itemBuilder: (BuildContext context, int index) {
                  return ReviewCardWidget(
                    review: controller
                        .nannyDetailsModel.data.nanny.review[index].comment,
                    rows: controller
                        .nannyDetailsModel.data.nanny.review[index].rating,
                    imagePath: data.image == ''
                        ? "${ApiEndpoint.mainDomain}/${controller.nannyDetailsModel.data.dataDefault}"
                        : "${ApiEndpoint.mainDomain}/${controller.nannyDetailsModel.data.imagePath}${data.image}",
                  );
                },
              ),
            ),
    );
  }
}
