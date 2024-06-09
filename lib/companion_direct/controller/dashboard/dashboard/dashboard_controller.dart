import 'dart:async';

import 'package:get/get.dart';

import '../../../../backend/model/dashboard/dashboard_model.dart';
import '../../../../backend/model/service_request_nanny_direct/service_request_model.dart';
import '../../../../backend/services/api_services.dart';

class DashboardController extends GetxController {
  int total = 0, totalService = 0, taskComplete = 0, incomplete = 0;

  @override
  void onInit() {
    total = 0;
    getServiceRequestListData();
    getDashboardData();

    super.onInit();
  }

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late ServiceRequestModel _serviceRequestModel;

  ServiceRequestModel get serviceRequestModel => _serviceRequestModel;

  Future<ServiceRequestModel> getServiceRequestListData() async {
    _isLoading.value = true;
    update();


    await ApiServices.serviceRequestListApi().then((value) {
      _serviceRequestModel = value!;
      int check = 0;

      var data = serviceRequestModel.data.userRequest;
      if (data.isNotEmpty) {
        for (int i = 0; i < data.length; i++) {
          total = total + (data[i].total as int);
          if (data[i].status == 2) {
            check++;
          } else if (data[i].status == 4) {
            taskComplete++;
          }
        }
        totalService = data.length - check;
        incomplete = check;
      }

      //end of get data and start navigation
      update();
    });

    _isLoading.value = false;
    update();
    return _serviceRequestModel;
  }

  final _isDashboardLoading = false.obs;

  bool get isDashboardLoading => _isDashboardLoading.value;
  late DashboardModel _dashboardModel;

  DashboardModel get dashboardModel => _dashboardModel;

  Future<DashboardModel> getDashboardData() async {
    _isDashboardLoading.value = true;
    update();

    await ApiServices.getDashboardApi().then((value) {
      _dashboardModel = value!;

      //end of get data and start navigation
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isDashboardLoading.value = false;
    update();
    return _dashboardModel;
  }
}
