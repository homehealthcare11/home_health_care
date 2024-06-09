// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_sliders/sliders.dart';
//
// import '../../utils/custom_color.dart';
//
// class AgeSliderPage extends StatefulWidget {
//   const AgeSliderPage({super.key});
//
//   @override
//   AgeSliderPageState createState() => AgeSliderPageState();
// }
//
// class AgeSliderPageState extends State<AgeSliderPage> {
//   double _age = 0;
//
//   final List<String> ageRanges = [
//     '0-6m',
//     '6m-1y',
//     '1y-2y',
//     '2y-5y',
//     '5y-8y',
//     '8y-9y',
//     '9y-10y',
//     '11y+',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Age Slider'),
//       ),
//       body: Container(
//         color: Colors.black12,
//         padding: const EdgeInsets.all(30.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SfSlider(
//               activeColor: CustomColor.secondaryDarkColor,
//               inactiveColor: CustomColor.secondaryDarkColor,
//               min: 0,
//               max: ageRanges.length - 1,
//               value: _age,
//               interval: 1,
//               showLabels: true,
//               enableTooltip: true,
//               showDividers: true,
//               dividerShape: _DividerShape(),
//               minorTicksPerInterval: 0,
//               onChanged: (dynamic value) {
//                 setState(() {
//                   _age = value;
//                 });
//               },
//               labelPlacement: LabelPlacement.onTicks,
//               semanticFormatterCallback: (dynamic value) {
//                 return ageRanges[value.toInt()];
//               },
//               labelFormatterCallback: (dynamic value, String formattedText) {
//                 return ageRanges[value.toInt()];
//               },
//               thumbShape: const SfThumbShape(),
//               overlayShape: const SfOverlayShape(),
//
//
//             ),
//             const SizedBox(height: 20.0),
//             // Text(
//             //   'Selected Age Range: ${ageRanges[_age.toInt()]}',
//             //   style: const TextStyle(fontSize: 18.0),
//             //   textAlign: TextAlign.center,
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _DividerShape extends SfDividerShape {
//   @override
//   void paint(PaintingContext context, Offset center, Offset? thumbCenter,
//       Offset? startThumbCenter, Offset? endThumbCenter,
//       {required RenderBox parentBox,
//       required themeData,
//       SfRangeValues? currentValues,
//       dynamic currentValue,
//       required Paint? paint,
//       required Animation<double> enableAnimation,
//       required TextDirection textDirection}) {
//
//     context.canvas.drawRect(
//         Rect.fromCenter(center: center, width: 5.0, height: 10.0),
//         Paint()
//           ..isAntiAlias = true
//           ..style = PaintingStyle.fill
//           ..color =CustomColor.secondaryLightColor);
//   }
// }

//working
// import '_direct/utils/basic_screen_imports.dart';
// import 'package:syncfusion_flutter_sliders/sliders.dart';
//
// class SliderWidget extends StatefulWidget {
//   const SliderWidget({Key? key}) : super(key: key);
//
//   @override
//   State<SliderWidget> createState() => _SliderWidgetState();
// }
//
// class _SliderWidgetState extends State<SliderWidget> {
//   double _sliderPointerValue = 0;
//
//   final List<String> dataRanges = [
//     '0-6m',
//     '6m-1y',
//     '1y-2y',
//     '2y-5y',
//     '5y-8y',
//     '8y-9y',
//     '9y-10y',
//     '11y+',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         //color: Colors.black12,
//         padding: const EdgeInsets.all(30.0),
//         child: Theme(
//           data: ThemeData(
//             textTheme: Theme.of(context).textTheme.copyWith(
//                   bodyLarge: TextStyle(
//                       color: CustomColor.primaryLightTextColor.withOpacity(.30),
//                       fontSize: Dimensions
//                           .headingTextSize6), // Set the label text color here
//                 ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SfSlider(
//                 activeColor: CustomColor.secondaryDarkColor,
//                 inactiveColor: CustomColor.secondaryDarkColor,
//                 min: 0,
//                 max: dataRanges.length - 1,
//                 value: _sliderPointerValue,
//                 interval: 1,
//                 showLabels: true,
//                 enableTooltip: true,
//                 showDividers: true,
//                 dividerShape: _DividerShape(),
//                 minorTicksPerInterval: 0,
//                 onChanged: (dynamic value) {
//                   setState(() {
//                     _sliderPointerValue = value;
//                   });
//                 },
//                 labelPlacement: LabelPlacement.onTicks,
//                 semanticFormatterCallback: (dynamic value) {
//                   return dataRanges[value.toInt()];
//                 },
//                 labelFormatterCallback: (dynamic value, String formattedText) {
//                   return dataRanges[value.toInt()];
//                 },
//                 thumbShape: const SfThumbShape(),
//                 overlayShape: const SfOverlayShape(),
//               ),
//               const SizedBox(height: 20.0),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _DividerShape extends SfDividerShape {
//   @override
//   void paint(PaintingContext context, Offset center, Offset? thumbCenter,
//       Offset? startThumbCenter, Offset? endThumbCenter,
//       {required RenderBox parentBox,
//       required themeData,
//       SfRangeValues? currentValues,
//       dynamic currentValue,
//       required Paint? paint,
//       required Animation<double> enableAnimation,
//       required TextDirection textDirection}) {
//     context.canvas.drawRect(
//         Rect.fromCenter(center: center, width: 5.0, height: 10.0),
//         Paint()
//           ..isAntiAlias = true
//           ..style = PaintingStyle.fill
//           ..color = CustomColor.secondaryLightColor);
//   }
// }

import '/companion_direct/controller/select_profession_controller/select_profession_controller.dart';
import '/companion_direct/utils/basic_widget_imports.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderWidget extends StatefulWidget {
  final double sliderPointerValue;
  final List<String> dataRanges;

  const SliderWidget({
    Key? key,
    required this.sliderPointerValue,
    required this.dataRanges,
  }) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  late double _sliderPointerValue;

  @override
  void initState() {
    super.initState();
    _sliderPointerValue = widget.sliderPointerValue;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectProfessionController());
    return SizedBox(
      child: Theme(
        data: ThemeData(
          textTheme: Theme.of(context).textTheme.copyWith(
                bodyLarge: TextStyle(
                  color: CustomColor.primaryLightTextColor.withOpacity(.30),
                  fontSize: Dimensions.headingTextSize6,
                ),
              ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SfSlider(
              activeColor: CustomColor.secondaryDarkColor,
              inactiveColor: CustomColor.secondaryDarkColor,
              min: 0,
              max: widget.dataRanges.length - 1,
              value: _sliderPointerValue,
              interval: 1,
              showLabels: true,
              // enableTooltip: true,
              showDividers: true,
              dividerShape: _DividerShape(),
              minorTicksPerInterval: 0,
              onChanged: (dynamic value) {
                setState(() {
                  _sliderPointerValue = value;
                  controller.sliderValue = _sliderPointerValue.obs;
                });
                // debugPrint(_sliderPointerValue);
              },
              labelPlacement: LabelPlacement.onTicks,
              semanticFormatterCallback: (dynamic value) {
                return widget.dataRanges[value.toInt()];
              },
              labelFormatterCallback: (dynamic value, String formattedText) {
                return widget.dataRanges[value.toInt()];
              },
              thumbShape: const SfThumbShape(),
              overlayShape: const SfOverlayShape(),
            ),
          ],
        ),
      ),
    );
  }
}

class _DividerShape extends SfDividerShape {
  @override
  void paint(PaintingContext context, Offset center, Offset? thumbCenter,
      Offset? startThumbCenter, Offset? endThumbCenter,
      {required RenderBox parentBox,
      required themeData,
      SfRangeValues? currentValues,
      dynamic currentValue,
      required Paint? paint,
      required Animation<double> enableAnimation,
      required TextDirection textDirection}) {
    context.canvas.drawRect(
      Rect.fromCenter(center: center, width: 5.0, height: 10.0),
      Paint()
        ..isAntiAlias = true
        ..style = PaintingStyle.fill
        ..color = CustomColor.secondaryLightColor,
    );
  }
}
