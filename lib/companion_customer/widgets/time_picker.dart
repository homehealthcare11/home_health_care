import 'package:intl/intl.dart';

import '../../companion_direct/utils/basic_screen_imports.dart';
import '/companion_customer/controller/service_request/service_request_controller.dart';
import '/companion_customer/language/language_controller.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({Key? key}) : super(key: key);

  @override
  TimePickerWidgetState createState() => TimePickerWidgetState();
}

class TimePickerWidgetState extends State<TimePickerWidget> {
  final controller = Get.put(ServiceRequestController());
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: CustomColor.primaryLightColor,
            cardColor: CustomColor.secondaryLightColor,
            primaryColorLight: CustomColor.secondaryLightColor,
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.accent),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        controller.timeNow = _formatTime(_selectedTime);
      });
    }
  }

  String _formatTime(TimeOfDay timeOfDay) {
    final formattedTime = DateFormat.Hm()
        .format(DateTime(2023, 1, 1, timeOfDay.hour, timeOfDay.minute));
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    final languageController = Get.put(LanguageController());
    return Column(
      children: <Widget>[
        Text(
          '${languageController.getTranslation(Strings.selectedTime.tr)}: ${_selectedTime.format(context)}',
          style: TextStyle(
            fontSize: Dimensions.headingTextSize3,
            color: CustomColor.secondaryLightColor,
          ),
        ),
        verticalSpace(Dimensions.heightSize),
        ElevatedButton(
          onPressed: () => _selectTime(context),
          child:
              Text(languageController.getTranslation(Strings.serviceTime.tr)),
        ),
      ],
    );
  }
}
