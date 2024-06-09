import 'package:intl/intl.dart';

import '../../../backend/utils/custom_loading_api.dart';
import '../../../companion_customer/controller/notification/notification_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/appbar/custom_app_bar.dart';
import '../../widgets/notification/notification_card.dart';
import '/companion_direct/widgets/no_data_found_widget.dart';

class NotificationScreenMobileResponsive extends StatelessWidget {
  NotificationScreenMobileResponsive({
    super.key,
  });

  final controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.notification.tr,
        onTap: () {
          Get.back();
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
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.paddingSize * 0.6,
          right: Dimensions.paddingSize * 0.5),
      child: controller.notificationModel.data.userNotification.isEmpty
          ? const NoDataFoundWidget()
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount:
                  controller.notificationModel.data.userNotification.length,
              // The number of items in the list
              itemBuilder: (BuildContext context, int index) {
                return NotificationCardLog(
                  title: controller.notificationModel.data
                      .userNotification[index].message.title,
                  msg: controller.notificationModel.data.userNotification[index]
                      .message.message,
                  date: DateFormat("yyyy-MM-dd")
                      .parse(controller.notificationModel.data
                          .userNotification[index].createdAt
                          .toString())
                      .day
                      .toString(),
                  month: DateFormat("MMM").format(
                    DateFormat("yyyy-MM-dd").parse(
                      controller.notificationModel.data.userNotification[index]
                          .createdAt
                          .toString(),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
