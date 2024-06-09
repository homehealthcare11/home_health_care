import '../../views/service_request/service_request_mobile_responsive.dart';

import '../../utils/responsive_layout.dart';

import '../../utils/basic_screen_imports.dart';

class ServiceRequest extends StatelessWidget {
  const ServiceRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: ServiceRequestMobileResponsive());
  }
}

