import '../../../views/dashboard/service_request/service_request_screen_mobile.dart';

import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';

class ServiceRequestScreen extends StatelessWidget {
  const ServiceRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: ServiceRequestScreenMobile(),
    );
  }
}