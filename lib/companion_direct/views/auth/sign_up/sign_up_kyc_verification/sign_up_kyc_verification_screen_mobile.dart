import '../../../../controller/auth/sign_up/sign_up_kyc_verification_controller/sign_up_kyc_verification_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/appbar/custom_app_bar.dart';
import '/backend/utils/custom_loading_api.dart';

class SignUpKycVerificationScreenMobile extends StatelessWidget {
  SignUpKycVerificationScreenMobile({
    Key? key,
  }) : super(key: key);
  final controller = Get.put(SignUpKycVerificationController());

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Get.close(1);
        return true;
      },
      child: Scaffold(
        appBar: CustomAppBar(
            leadingPadding: EdgeInsets.all(Dimensions.paddingSize * 0.4),
            Strings.kycVerification.tr, onTap: () {
          // Get.offAllNamed(Routes.signUpScreen);
          Get.back();
        }),
        body: Obx(() {
          return controller.isLoading
              ? const CustomLoadingAPI()
              : _bodyWidget(context);
        }),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.6),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          _idCaptureWidget(),
          _inputWidget(context),
          _dropdownWidget(),
          _buttonWidget(context),
        ],
      ),
    );
  }

  _dropdownWidget() {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSizeVertical * 0.4),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          verticalSpace(Dimensions.heightSize * 0.2),
        ],
      ),
    );
  }

  _idCaptureWidget() {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        verticalSpace(Dimensions.heightSize),
        ...controller.inputFields.map((element) {
          return element;
        }).toList(),
        SizedBox(
          height: Dimensions.marginBetweenInputTitleAndBox * 2,
        ),
      ],
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 1.4),
      child: PrimaryButton(
        title: Strings.submit.tr,
        onPressed: () {
          controller.submitKycProcess(context: context);
        },
        borderColor: Get.isDarkMode
            ? CustomColor.primaryDarkColor
            : CustomColor.primaryLightColor,
        buttonColor: Get.isDarkMode
            ? CustomColor.primaryDarkColor
            : CustomColor.primaryLightColor,
      ),
    );
  }

  _inputWidget(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: controller.inputFileFields.isNotEmpty,
          child: Container(
            margin: EdgeInsets.only(
              top: Dimensions.marginSizeVertical * 0.5,
            ),
            height: controller.inputFileFields.length == 2
                ? MediaQuery.of(context).size.height * 0.20
                : MediaQuery.of(context).size.height * 0.25,
            child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
                  crossAxisSpacing: 10.0, // Spacing between columns
                  mainAxisSpacing: 10.0, // Spacing between rows
                ),
                itemCount: controller.inputFileFields.length,
                itemBuilder: (BuildContext context, int index) {
                  return controller.inputFileFields[index];
                }),
          ),
        ),
      ],
    );
  }
}
