import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../backend/services/api_endpoint.dart';
import '../../../../backend/utils/custom_loading_api.dart';
import '../../../../custom_assets/assets.gen.dart';
import '../../../../companion_customer/routes/routes.dart';
import '../../../../companion_direct/controller/dashboard/dashboard/dashboard_controller.dart';
import '../../../controller/dashboard/profile_controller/profile_controller.dart';
import '../../../controller/money_out/money_out_controller.dart';
import '../../../local_storage/local_storage.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import '../../../widgets/drawer/drawer_widget.dart';
import '../../../widgets/no_data_found_widget.dart';
import '../../../widgets/others/custom_image_widget.dart';
import '../../../widgets/others/recent_activity_widget.dart';
import '../../../widgets/text_labels/title_heading5_widget.dart';
import '/companion_customer/language/language_controller.dart';

class DashboardScreenMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  DashboardScreenMobile({Key? key}) : super(key: key);
  final controller = Get.put(NannyProfileController());
  final dashboardController = Get.put(DashboardController());
  final moneyOutController = Get.put(MoneyOutController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading
          ? const CustomLoadingAPI()
          : dashboardController.isLoading
              ? const CustomLoadingAPI()
              : dashboardController.isDashboardLoading
                  ? const CustomLoadingAPI()
                  : moneyOutController.isLoading
                      ? const CustomLoadingAPI()
                      : ResponsiveLayout(
                          mobileScaffold: Scaffold(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            drawer: DrawerWidget(),
                            key: scaffoldKey,
                            extendBody: true,
                            appBar: appbarWidget(context),
                            body: _bodyWidget(context),
                          ),
                        );
    });
  }

  _bodyWidget(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        dashboardController.getDashboardData();
      },
      child: ListView(
        shrinkWrap: true,
        children: [
          _appbarContainer(context),
          _aboutSkillWidget(context),
          _draggableSheet(context)
        ],
      ),
    );
  }

  appbarWidget(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    var data = controller.profileModel.data;
    final image =
        '${ApiEndpoint.mainDomain}/${data.imagePath}/${data.nanny.image}';
    final defaultImage = '${ApiEndpoint.mainDomain}/${data.defaultImage}';
    return AppBar(
      backgroundColor: Get.isDarkMode
          ? CustomColor.secondaryDarkColor
          : CustomColor.secondaryLightColor,
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          scaffoldKey.currentState!.openDrawer();
        },
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: isTablet()
                    ? Dimensions.widthSize * 0.5
                    : Dimensions.widthSize * 1.45),
            child: CustomImageWidget(
              path: Assets.icon.drawer,
              height: isTablet() ? 50 : 17,
              width: isTablet() ? 50 : 17,
              color: CustomColor.whiteColor,
            )),
      ),
      title: Text(
        Get.find<LanguageController>().getTranslation("Health Care"),
        style: GoogleFonts.lobster(
            fontWeight: FontWeight.w500,
            fontSize: Dimensions.headingTextSize1,
            color: CustomColor.whiteColor),
      ),
      actions: [
        LocalStorage.isLoggedIn()
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: isTablet()
                        ? Dimensions.widthSize * 0.65
                        : Dimensions.paddingSize * 0.3),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.nannyProfileScreen);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: isTablet() ? 0 : Dimensions.paddingSize * .5),
                    child: CircleAvatar(
                      radius: isTablet() ? Dimensions.radius * 1 : null,
                      backgroundImage: NetworkImage(
                          data.nanny.image != '' ? image : defaultImage),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

  _appbarContainer(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    var kyc = dashboardController.dashboardModel.data.userRequest.isEmpty
        ? "0"
        : dashboardController
            .dashboardModel.data.userRequest[0].userRequest.nanny.kycVerified;
    return Container(
      alignment: Alignment.center,
      height: isTablet()
          ? MediaQuery.of(context).size.height * 0.3
          : MediaQuery.of(context).size.height * 0.275,
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? CustomColor.secondaryDarkColor
            : CustomColor.secondaryLightColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Dimensions.radius * 2),
          bottomRight: Radius.circular(Dimensions.radius * 2),
        ),
      ),
      child: Column(
        mainAxisAlignment: mainStart,
        children: [
          verticalSpace(Dimensions.heightSize),
          kyc == 1
              ? Container()
              : Container(
                  padding: EdgeInsets.all(Dimensions.paddingSize * .4),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? CustomColor.secondaryDarkTextColor.withOpacity(.10)
                        : CustomColor.secondaryLightTextColor.withOpacity(.10),
                    borderRadius: BorderRadius.all(
                      Radius.circular(Dimensions.radius * 2),
                    ),
                  ),
                  child: dashboardController
                          .serviceRequestModel.data.userRequest.isEmpty
                      ? const NoDataFoundWidget()
                      : TitleHeading5Widget(
                          text: kyc == 0
                              ? Strings.unverified.tr
                              : kyc == 1
                                  ? Strings.kycVerified
                                  : kyc == 2
                                      ? Strings.pendingMsg.tr
                                      : Strings.rejectedKyc.tr,
                          color: Get.isDarkMode
                              ? CustomColor.secondaryDarkTextColor
                              : CustomColor.secondaryLightTextColor,
                          fontWeight: FontWeight.w600,
                        ),
                ),
          verticalSpace(Dimensions.heightSize * .75),
          CustomTitleHeadingWidget(
            text:
                "${double.parse(moneyOutController.withdrawInfoModel.data.nannyWallet.balance.toString()).toStringAsFixed(2)} ${dashboardController.serviceRequestModel.data.userRequest.isEmpty ? "" : dashboardController.serviceRequestModel.data.userRequest[0].currencyCode}",
            style: CustomStyle.darkHeading1TextStyle.copyWith(
              fontSize: Dimensions.headingTextSize4 * 2,
              fontWeight: FontWeight.w800,
              color: CustomColor.whiteColor,
            ),
          ),
          CustomTitleHeadingWidget(
            text: Strings.availableBalance.tr,
            style: CustomStyle.lightHeading4TextStyle.copyWith(
              fontSize: Dimensions.headingTextSize3,
              color: CustomColor.whiteColor.withOpacity(0.6),
            ),
          ),
          verticalSpace(Dimensions.heightSize * 2),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * .75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    TitleHeading2Widget(
                      text:
                          "${dashboardController.total.toString()} ${dashboardController.serviceRequestModel.data.userRequest.isEmpty ? "" : dashboardController.serviceRequestModel.data.userRequest[0].currencyCode}",
                      color: Get.isDarkMode
                          ? CustomColor.secondaryDarkTextColor
                          : CustomColor.secondaryLightTextColor,
                      fontSize: Dimensions.headingTextSize3,
                    ),
                    TitleHeading4Widget(
                      text: "Total Earnings",
                      color: Get.isDarkMode
                          ? CustomColor.secondaryDarkTextColor.withOpacity(.60)
                          : CustomColor.secondaryLightTextColor
                              .withOpacity(.60),
                    ),
                  ],
                ),
                Column(
                  children: [
                    TitleHeading2Widget(
                      text: dashboardController.taskComplete.toString(),
                      fontSize: Dimensions.headingTextSize3,
                      color: Get.isDarkMode
                          ? CustomColor.secondaryDarkTextColor
                          : CustomColor.secondaryLightTextColor,
                    ),
                    TitleHeading4Widget(
                      text: Strings.taskComplete.tr,
                      color: Get.isDarkMode
                          ? CustomColor.secondaryDarkTextColor.withOpacity(.60)
                          : CustomColor.secondaryLightTextColor
                              .withOpacity(.60),
                    ),
                  ],
                ),
                Column(
                  children: [
                    TitleHeading2Widget(
                      text: dashboardController.incomplete.toString(),
                      fontSize: Dimensions.headingTextSize3,
                      color: Get.isDarkMode
                          ? CustomColor.secondaryDarkTextColor
                          : CustomColor.secondaryLightTextColor,
                    ),
                    TitleHeading4Widget(
                      text: Strings.incomplete.tr,
                      color: Get.isDarkMode
                          ? CustomColor.secondaryDarkTextColor.withOpacity(.60)
                          : CustomColor.secondaryLightTextColor
                              .withOpacity(.60),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _aboutSkillWidget(BuildContext context) {
    var data = dashboardController.dashboardModel.data.userRequest;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimensions.radius * 2,
        ),
        color: CustomColor.whiteColor,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSizeHorizontal * 0.5,
        vertical: Dimensions.marginSizeVertical * 0.4,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize * 0.5,
        vertical: Dimensions.paddingSize * 0.6,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Row(
                children: [
                  CustomImageWidget(
                      path: Assets.icon.experience3,
                      height: Dimensions.heightSize * 3.2),
                  horizontalSpace(Dimensions.marginSizeHorizontal * .25),
                  Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            child: TitleHeading3Widget(
                              text: data.isNotEmpty
                                  ? data[0]
                                      .userRequest
                                      .nanny
                                      .nannyProfession
                                      .workExperience
                                      .toString()
                                  : Strings.no.tr,
                            ),
                          ),
                        ],
                      ),
                      TitleHeading4Widget(
                          text: Strings.experience.tr,
                          color: Get.isDarkMode
                              ? CustomColor.primaryDarkTextColor
                                  .withOpacity(.30)
                              : CustomColor.primaryLightTextColor
                                  .withOpacity(.30),
                          fontWeight: FontWeight.w500)
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  CustomImageWidget(
                      path: Assets.icon.charge,
                      height: Dimensions.heightSize * 3.1),
                  horizontalSpace(Dimensions.marginSizeHorizontal * .25),
                  Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      Row(
                        children: [
                          TitleHeading3Widget(
                              text: data.isNotEmpty
                                  ? data[0].nannyProfession.charge
                                  : Strings.no.tr),
                        ],
                      ),
                      TitleHeading4Widget(
                        text: Strings.charge.tr,
                        color: Get.isDarkMode
                            ? CustomColor.primaryDarkTextColor.withOpacity(.30)
                            : CustomColor.primaryLightTextColor
                                .withOpacity(.30),
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          verticalSpace(Dimensions.heightSize),
          Divider(
            thickness: Dimensions.heightSize * .15,
            color: Get.isDarkMode
                ? CustomColor.primaryDarkTextColor.withOpacity(.15)
                : CustomColor.primaryLightTextColor.withOpacity(.15),
          ),
          verticalSpace(Dimensions.heightSize * .2),
          Row(
            children: [
              CustomImageWidget(
                path: Assets.icon.address,
                height: Dimensions.heightSize * 3.2,
              ),
              horizontalSpace(Dimensions.marginSizeHorizontal * .25),
              SizedBox(
                width: MediaQuery.of(context).size.width * .64,
                child: data.isNotEmpty
                    ? TitleHeading4Widget(
                        maxLines: 5,
                        text: data[0].userRequest.address,
                        color: Get.isDarkMode
                            ? CustomColor.primaryDarkTextColor.withOpacity(.30)
                            : CustomColor.primaryLightTextColor
                                .withOpacity(.30),
                        fontWeight: FontWeight.w500,
                      )
                    : _nodataFound(context),
              )
            ],
          ),
        ],
      ),
    );
  }

  _draggableSheet(BuildContext context) {
    return Obx(() => dashboardController.isLoading
        ? const CustomLoadingAPI()
        : _recentActivityWidget(context));
  }

  _recentActivityWidget(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    var data = dashboardController.serviceRequestModel.data.userRequest;
    if (dashboardController.serviceRequestModel.data.userRequest.isEmpty) {
      return const NoDataFoundWidget();
    } else {
      return ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.8),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          CustomTitleHeadingWidget(
            text: Strings.serviceRequest.tr,
            style: Get.isDarkMode
                ? CustomStyle.lightHeading3TextStyle.copyWith(
                    fontSize: isTablet()
                        ? Dimensions.headingTextSize4
                        : Dimensions.headingTextSize3,
                    fontWeight: FontWeight.w600,
                  )
                : CustomStyle.darkHeading3TextStyle.copyWith(
                    fontSize: isTablet()
                        ? Dimensions.headingTextSize4
                        : Dimensions.headingTextSize3,
                    fontWeight: FontWeight.w600,
                  ),
          ),
          verticalSpace(Dimensions.widthSize),
          data.isNotEmpty
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.325,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.nannyServiceRequestScreen,
                                arguments: index);
                          },
                          child: RecentActivitiesWidget(
                            amount:
                                "${data[index].nannyCharge.toString()} ${data[index].currencyCode}/hr",
                            title: data[index].serviceType == 1
                                ? Strings.babySitter.tr
                                : Strings.petSitter.tr,
                            dateText: data[index]
                                .startedDate
                                .toString()
                                .substring(8, 10),
                            email: data[index].user.email,
                            monthText: DateFormat('MMM')
                                .format(data[index].startedDate),
                            status: data[index].status == 0
                                ? Strings.pending.tr
                                : data[index].status == 1
                                    ? Strings.accept.tr
                                    : data[index].status == 4
                                        ? Strings.complete.tr
                                        : data[index].status == 2
                                            ? Strings.reject.tr
                                            : Strings.paid.tr,
                            color: data[index].status == 0
                                ? CustomColor.primaryLightColor
                                : data[index].status == 1
                                    ? CustomColor.greenColor
                                    : data[index].status == 4
                                        ? CustomColor.secondaryLightColor
                                        : data[index].status == 2
                                            ? CustomColor.redColor
                                            : CustomColor.greenColor,
                          ),
                        );
                      }),
                )
              : _nodataFound(context),
          // verticalSpace(Dimensions.heightSize * 5)
        ],
      );
    }
  }

  _nodataFound(context) {
    return Center(
        child: TitleHeading3Widget(
      text: Strings.noDataFound.tr,
      color: CustomColor.primaryLightTextColor.withOpacity(0.40),
    ));
  }
}
