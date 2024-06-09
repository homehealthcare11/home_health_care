import '../../../../data/drawer/notification_data.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/appbar/custom_app_bar.dart';
import '../../../../widgets/drawer/notification_widget.dart';
import '/backend/utils/custom_loading_api.dart';
import '/companion_direct/controller/drawer/drawer_menu_controller/notification_controller.dart';
import '/companion_direct/widgets/no_data_found_widget.dart';

class NotificationScreenMobile extends StatelessWidget {
  NotificationScreenMobile({Key? key}) : super(key: key);
  final controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryLightScaffoldBackgroundColor,
      appBar: CustomAppBar(
        Strings.notification,
        leadingPadding: EdgeInsets.only(left: Dimensions.paddingSize),
        onTap: () {
          Get.back();
        },
      ),
      body: Obx(() => controller.isLoading
          ? const CustomLoadingAPI()
          : _bodyWidget(context)),
    );
  }

  _bodyWidget(BuildContext context) {
    return RefreshIndicator(
        child: controller.notificationModel.data.nannyNotification.isEmpty
            ? const NoDataFoundWidget()
            : ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSize * 0.8,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount:
                    controller.notificationModel.data.nannyNotification.length,
                itemBuilder: (context, index) {
                  return NotificationWidget(
                    title: controller.notificationModel.data
                        .nannyNotification[index].message.title,
                    dateText: notificationData[index].dateText,
                    transaction: controller.notificationModel.data
                        .nannyNotification[index].message.message,
                    monthText: notificationData[index].monthText,
                  );
                }),
        onRefresh: () {
          return controller.getNotificationDataProcess();
        });
  }
}
