import 'package:intl/intl.dart';

import '/backend/services/api_endpoint.dart';
import '../../../backend/utils/custom_loading_api.dart';
import '../../../companion_customer/controller/service_tracking/service_tracking_controller.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/appbar/custom_app_bar.dart';
import '../../widgets/nanny_card/nanny_card_widget.dart';

class ServiceCartMobileResponsive extends StatelessWidget {
  ServiceCartMobileResponsive({
    super.key,
  });

  final controller = Get.put(ServiceTrackingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryLightScaffoldBackgroundColor,
      appBar: CustomAppBar(
        Strings.serviceTracking.tr,
        onTap: () {
          Get.offAllNamed(Routes.bottomNavBar);
        },
        leadingPadding: EdgeInsets.only(
          left: Dimensions.paddingSize,
        ),
      ),
      body: Obx(() => controller.isLoading
          ? const CustomLoadingAPI()
          : _bodyWidget(context)),
    );
  }

  _bodyWidget(BuildContext context) {
    var data = controller.serviceCartModel.data;

    return RefreshIndicator(
      onRefresh: () {
        return controller.getServiceCartProcess();
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: Dimensions.paddingSize * 0.5,
            right: Dimensions.paddingSize * 0.5,
          ),
          child: data.userRequests.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount:
                      controller.serviceCartModel.data.userRequests.length,
                  itemBuilder: (BuildContext context, int index) {
                    String amOrPm;
                    if (int.parse(controller.serviceCartModel.data
                            .userRequests[index].userRequest.startedTime
                            .substring(0, 2)) >
                        12) {
                      amOrPm = "PM";
                    } else {
                      amOrPm = "AM";
                    }


                    // int dayOfWeek = day.weekday;
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.serviceRequestAcceptedScreen,
                            arguments: index);
                      },
                      child: NannyCardWidget(
                        name:
                            "${controller.serviceCartModel.data.userRequests[index].userRequest.nanny.firstname} ${controller.serviceCartModel.data.userRequests[index].userRequest.nanny.lastname} ",
                        bio: controller
                            .serviceCartModel
                            .data
                            .userRequests[index]
                            .userRequest
                            .nanny
                            .nannyProfession
                            .bio,
                        serviceDate: controller.serviceCartModel.data
                            .userRequests[index].userRequest.startedDate
                            .toString()
                            .substring(0, 10),
                        serviceWeekday: DateFormat('EEEE').format(controller.serviceCartModel.data.userRequests[index].userRequest.startedDate).toString(),
                        serviceTime:
                            "${controller.serviceCartModel.data.userRequests[index].userRequest.startedTime.substring(0, 5)} $amOrPm - ${controller.serviceCartModel.data.userRequests[index].userRequest.startedTime.substring(0, 5)} $amOrPm",
                        address: controller.serviceCartModel.data
                            .userRequests[index].userRequest.address,
                        selected: controller.serviceCartModel.data
                            .userRequests[index].userRequest.status,
                        image: data.userRequests[index].userRequest.nanny
                                    .image ==
                                ''
                            ? "${ApiEndpoint.mainDomain}/${controller.serviceCartModel.data.defaultImage}"
                            : "${ApiEndpoint.mainDomain}/public/frontend/nanny/${controller.serviceCartModel.data.userRequests[index].userRequest.nanny.image}",
                        petOrBaby: controller.serviceCartModel.data
                            .userRequests[index].userRequest.addBabyPetId,
                      ),
                    );
                  })
              : Center(
                  child: TitleHeading3Widget(
                  padding: EdgeInsets.only(top: Dimensions.paddingSize * 10),
                  text: Strings.noDataFound.tr,
                  color: CustomColor.primaryLightTextColor.withOpacity(0.4),
                )),
        ),
      ),
    );
  }
}
//test comment
