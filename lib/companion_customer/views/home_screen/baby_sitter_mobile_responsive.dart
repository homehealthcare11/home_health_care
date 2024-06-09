import 'dart:math';

import 'package:sitterhub/companion_direct/controller/select_profession_controller/select_profession_controller.dart';
import 'package:sitterhub/companion_direct/views/companions_screen.dart';

import '../../../backend/services/api_endpoint.dart';
import '../../../backend/utils/custom_loading_api.dart';
import '../../../companion_direct/widgets/no_data_found_widget.dart';
import '../../controller/babby_sitter/baby_sitter_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/dialog_box.dart';
import '../../widgets/nanny_list/nanny_list_widget.dart';
import '../../widgets/others/custom_image_widget.dart';

class BabySitterMobileResponsive extends StatelessWidget {
  BabySitterMobileResponsive({
    super.key,
  });

  final controller = Get.put(BabySitterController());
  final selectProfessionController = Get.put(SelectProfessionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
      backgroundColor: CustomColor.primaryLightScaffoldBackgroundColor,
    );
  }

  _bodyWidget(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Stack(
        children: [
          _stackBackWidget(context),
        ],
      ),
    );
  }

  // nanny list and cover page
  _stackBackWidget(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return ListView(
      // physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.325,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/onboard/header_2.jpeg"),
                fit: BoxFit.cover),
          ),
          child: Container(
            color: CustomColor.blackColor.withOpacity(0.35),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.5),
          child: TitleHeading2Widget(
            text: Strings.serviceCategories.tr,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 340.h,
          child: Padding(
            padding: EdgeInsets.only(
              left: Dimensions.paddingSize * 0.3,
              right: Dimensions.paddingSize * 0.3,
              top: Dimensions.heightSize * 1.5,
            ),
            child: GridView.builder(
                itemCount: 9,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 15,
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){
                      Get.toNamed(Routes.companionsScreen);
                    },
                    child: Column(
                      children: [
                        Container(
                            height: 85,
                            width: 85,
                            decoration: BoxDecoration(
                                color: Color((Random().nextDouble() * 0xFFFFFF)
                                        .toInt())
                                    .withOpacity(0.5),
                                borderRadius: BorderRadius.circular(5)),
                            child: Image.asset(
                              "assets/icon/pateint_type_${index + 1}.png",
                              height: 50,
                            )),
                        Text(
                          selectProfessionController.patientType[index],
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12, color: Colors.black),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.5),
          child: Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              TitleHeading2Widget(
                // text: Strings.nannyList.tr,
                text: Strings.nannyList.tr,
                fontWeight: FontWeight.w600,
              ),
              horizontalSpace(isTablet()
                  ? MediaQuery.sizeOf(context).width * 0.6
                  : Dimensions.widthSize * 13),
              _searchbarAndButtonWidget(context),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: Dimensions.paddingSize * 0.5,
            right: Dimensions.paddingSize * 0.5,
          ),
          child: _companionListWidget(context),
        ),
      ],
    );
  }

  // icons and logo

// companion list
  _companionListWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      mainAxisAlignment: mainStart,
      children: [
        verticalSpace(Dimensions.heightSize * 1.333),
        controller.companionListModel.data.companions.isEmpty
            ? SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.6,
                child: RefreshIndicator(
                  onRefresh: () async {
                    controller.getNannyList('');
                  },
                  child: ListView(
                    children: [
                      verticalSpace(Dimensions.heightSize * 3),
                      const NoDataFoundWidget(),
                    ],
                  ),
                ),
              )
            : SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                child: RefreshIndicator(
                  onRefresh: () async {
                    controller.getNannyList('');
                  },
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,

                    itemCount:
                        controller.companionListModel.data.companions.length,
                    // The number of items in the list
                    itemBuilder: (BuildContext context, int index) {
                      var dataImage = controller.companionListModel.data;
                      final image =
                          '${ApiEndpoint.mainDomain}/${dataImage.imagePath}/';
                      final defaultImage =
                          '${ApiEndpoint.mainDomain}/${dataImage.defaultImage}';
                      return GestureDetector(
                        onTap: () {
                          controller.index = index;
                          controller.id = controller
                              .companionListModel.data.companions[index].id;
                          Get.toNamed(Routes.nannyScreen);
                          debugPrint(
                              "$image/${controller.companionListModel.data.companions[index].image}");
                        },
                        child: NannyListWidget(
                          name:
                              "${controller.companionListModel.data.companions[index].firstname} ${controller.companionListModel.data.companions[index].lastname}",
                          text: controller.companionListModel.data
                              .companions[index].nannyProfession.professionType
                              .toString(),
                          value:
                              "${controller.companionListModel.data.companions[index].nannyProfession.amount} ${controller.companionListModel.data.companions[index].userRequests.isEmpty ? "OMR" : controller.companionListModel.data.companions[index].userRequests.first.currencyCode}",
                          image: controller.companionListModel.data
                                      .companions[index].image ==
                                  ''
                              ? defaultImage
                              : "$image/${controller.companionListModel.data.companions[index].image}",
                        ),
                      );
                    },
                  ),
                ),
              ),
        // const (),
      ],
    );
  }

  //search bar and log
  _searchbarAndButtonWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _openDialog(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: CustomColor.whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(Dimensions.radius),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(Dimensions.paddingSize * 0.5),
          child: CustomImageWidget(
            path: Assets.icon.filter,
            height: Dimensions.heightSize * 1.667,
            width: Dimensions.widthSize * 2,
          ),
        ),
      ),
    );
  }

  // dialog screen
  _openDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) => NannyAlertDialog(),
    );
  }
}
