import 'package:intl/intl.dart';

import '../../../../controller/dashboard/dashboard/dashboard_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/appbar/custom_app_bar.dart';
import '../../../../widgets/drawer/history_card_widget.dart';
import '../../../../widgets/no_data_found_widget.dart';

class HistoryScreenMobile extends StatelessWidget {
  HistoryScreenMobile({Key? key}) : super(key: key);
  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.history.tr,
        onTap: () {
          Get.back();
        },
        leadingPadding: EdgeInsets.only(
          left: Dimensions.paddingSize,
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    var data = dashboardController.serviceRequestModel.data.userRequest;
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.paddingSize * 0.7,
        right: Dimensions.paddingSize * 0.7,
      ),
      child: RefreshIndicator(
        onRefresh: () {
          return dashboardController.getServiceRequestListData();
        },
        child: data.isEmpty
            ? const NoDataFoundWidget()
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: data.length, // The number of items in the list
                itemBuilder: (BuildContext context, int index) {
                  return HistoryCardWidget(
                    dateText:
                        data[index].startedDate.toString().substring(8, 10),
                    monthText:
                        DateFormat('MMM').format(data[index].startedDate),
                    title: data[index].serviceType == 1
                        ? Strings.babySitter.tr
                        : Strings.petSitter.tr,
                    status: data[index].status >= 4
                        ? Strings.complete
                        : data[index].status < 2
                            ? Strings.pending
                            : data[index].status == 2
                                ? "Reject"
                                : '',
                    email: data[index].user.email,
                    amount: "${data[index].nannyCharge.toString()} USD/hr",
                  );
                },
              ),
      ),
    );
  }
}
