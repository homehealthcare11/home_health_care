import 'package:easy_stepper/easy_stepper.dart';

import '/companion_direct/widgets/text_labels/title_heading5_widget.dart';
import '../../utils/basic_screen_imports.dart';

// ignore: must_be_immutable
class ServiceTrackingStepper extends StatefulWidget {
  ServiceTrackingStepper({Key? key, required this.activeStep})
      : super(key: key);
  int activeStep;

  @override
  ServiceTrackingStepperState createState() => ServiceTrackingStepperState();
}

class ServiceTrackingStepperState extends State<ServiceTrackingStepper> {
  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: widget.activeStep,
      // lineLength: 60.w,
      // lineSpace: 5,
      // lineType: LineType.dotted,
      // defaultLineColor: CustomColor.primaryLightTextColor.withOpacity(.30),
      // finishedLineColor: CustomColor.secondaryLightColor,
      activeStepTextColor: CustomColor.primaryLightTextColor.withOpacity(.30),
      finishedStepTextColor: Colors.black,
      internalPadding: 0,
      showLoadingAnimation: false,
      stepRadius: 11.r,
      showStepBorder: true,
      steps: [
        EasyStep(
          enabled: false,
          customStep: CircleAvatar(
            radius: 7,
            backgroundColor: widget.activeStep >= 0
                ? CustomColor.secondaryLightColor
                : CustomColor.primaryLightTextColor.withOpacity(.30),
          ),
          topTitle: false,
          customTitle: TitleHeading5Widget(
            text: Strings.serviceAccepted.tr,
            fontSize: Dimensions.headingTextSize6,
            maxLines: 2,
            color: widget.activeStep >= 0
                ? CustomColor.secondaryLightColor
                : CustomColor.primaryLightTextColor.withOpacity(.30),
            textAlign: TextAlign.center,
          ),
        ),
        EasyStep(
          enabled: false,
          customStep: CircleAvatar(
            radius: 7,
            backgroundColor: widget.activeStep >= 1
                ? CustomColor.secondaryLightColor
                : CustomColor.primaryLightTextColor.withOpacity(.30),
          ),
          topTitle: false,
          customTitle: TitleHeading5Widget(
            fontSize: Dimensions.headingTextSize6,
            text: Strings.waitForNanny.tr,
            maxLines: 2,
            textAlign: TextAlign.center,
            color: widget.activeStep >= 1
                ? CustomColor.secondaryLightColor
                : CustomColor.primaryLightTextColor.withOpacity(.30),
          ),
        ),
        EasyStep(
          enabled: false,
          customStep: CircleAvatar(
            radius: 7,
            backgroundColor: widget.activeStep >= 2
                ? CustomColor.secondaryLightColor
                : CustomColor.primaryLightTextColor.withOpacity(.30),
          ),
          customTitle: TitleHeading5Widget(
            fontSize: Dimensions.headingTextSize6,
            text: Strings.taskComplete.tr,
            maxLines: 2,
            textAlign: TextAlign.center,
            color: widget.activeStep >= 2
                ? CustomColor.secondaryLightColor
                : CustomColor.primaryLightTextColor.withOpacity(.30),
          ),
        ),
        EasyStep(
          enabled: false,
          customStep: CircleAvatar(
            radius: 7,
            backgroundColor: widget.activeStep >= 3
                ? CustomColor.secondaryLightColor
                : CustomColor.primaryLightTextColor.withOpacity(.30),
          ),
          customTitle: TitleHeading5Widget(
            fontSize: Dimensions.headingTextSize6,
            text: Strings.getPayment.tr,
            maxLines: 2,
            textAlign: TextAlign.center,
            color: widget.activeStep >= 3
                ? CustomColor.secondaryLightColor
                : CustomColor.primaryLightTextColor.withOpacity(.30),
          ),
        ),
      ],
      onStepReached: (index) => setState(() => widget.activeStep = index),
    );
  }
}
