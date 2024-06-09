import '../../views/booking_schedule/booking_schedule_mobile_responsive.dart';

import '../../utils/responsive_layout.dart';

import '../../utils/basic_screen_imports.dart';


class BookingSchedule extends StatelessWidget {
  const BookingSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: BookingScheduleMobileResponsive());
  }
}


