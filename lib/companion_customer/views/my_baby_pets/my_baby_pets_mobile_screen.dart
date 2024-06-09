import '../../../backend/services/api_endpoint.dart';
import '../../../backend/utils/custom_loading_api.dart';
import '../../controller/my_baby_and_pets/my_baby_and_pets_controller.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/appbar/custom_app_bar.dart';
import '../../widgets/baby_card/baby_card_widget.dart';
import '../../widgets/text_labels/title_heading5_widget.dart';
import '/companion_direct/widgets/no_data_found_widget.dart';

class MyPatientsMobileResponsive extends StatelessWidget {
  MyPatientsMobileResponsive({
    super.key,
  });

  final controller = Get.put(MyBabyAndPetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        "My Patients",
        onTap: () {
          Get.offAllNamed(Routes.bottomNavBar);
        },
        leadingPadding: EdgeInsets.only(
          left: Dimensions.paddingSize,
        ),
      ),
      body: Obx(() {
        return controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context);
      }),
    );
  }

  _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: Dimensions.paddingSize * 0.5,
          right: Dimensions.paddingSize * 0.5,
          top: Dimensions.paddingSize,
        ),
        child: Column(
          children: [
            _selectBabyWidget(
                context, "Select Patient", "Add Patient", () {
              Get.toNamed(Routes.addBabyScreen);
            }),
            verticalSpace(Dimensions.heightSize * 1.33),
            _babyWidget(context),
            verticalSpace(Dimensions.heightSize * 2),
            // _selectBabyWidget(context, "Select Other", "Add Other",
            //     () {
            //   Get.toNamed(Routes.addPet);
            // }),
            // verticalSpace(Dimensions.heightSize * 1.33),
            // _petWidget(context),
          ],
        ),
      ),
    );
  }

// select baby text
  _selectBabyWidget(BuildContext context, String text1, String text2,
      void Function()? onTap) {
    return Row(
      mainAxisAlignment: mainSpaceBet,
      children: [
        TitleHeading2Widget(
          text: text1,
          fontWeight: FontWeight.w600,
        ),
        GestureDetector(
          onTap: onTap,
          child: TitleHeading5Widget(
            text: text2,
            fontWeight: FontWeight.w600,
            color: CustomColor.secondaryLightColor,
          ),
        )
      ],
    );
  }

  _babyWidget(BuildContext context) {
    var data = controller.profileModel.data.myBaby;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: data.isEmpty
          ? const NoDataFoundWidget()
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: data.length, // The number of items in the list
              itemBuilder: (BuildContext context, int index) {
                return Obx(() {
                  final itemColor = controller.isItemSelected(index)
                      ? CustomColor.whiteColor
                      : CustomColor.whiteColor;
                  return GestureDetector(
                    onTap: () {
                      controller.selectItem(index);
                    },
                    child: BabyCardWidget(
                      onTap: () {
                        Get.toNamed(Routes.babyDetailsScreen, arguments: index);
                      },
                      age: data[index].professionTypeDetails.babyAge,
                      imagePath:
                          "${ApiEndpoint.mainDomain}/${controller.profileModel.data.imagePath}/${data[index].image}",
                      name: data[index].professionTypeDetails.babyName,
                      isIcon: true,
                      borderColor: itemColor,
                    ),
                  );
                });
              },
            ),
    );
  }

  _petWidget(BuildContext context) {
    var data = controller.profileModel.data.myPet;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: data.isEmpty
          ? const NoDataFoundWidget()
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: data.length, // The number of items in the list
              itemBuilder: (BuildContext context, int index) {
                return Obx(() {
                  final itemColor = controller.isPetItemSelected(index)
                      ? CustomColor.whiteColor
                      : CustomColor.whiteColor;
                  return GestureDetector(
                    onTap: () {
                      controller.selectPetItem(index);
                    },
                    child: BabyCardWidget(
                      onTap: () {
                        Get.toNamed(Routes.petDetails, arguments: index);
                      },
                      age: data[index].professionTypeDetails.petAge,
                      imagePath:
                          "${ApiEndpoint.mainDomain}/${controller.profileModel.data.imagePath}/${data[index].image}",
                      name: data[index].professionTypeDetails.petName,
                      isIcon: true,
                      borderColor: itemColor,
                    ),
                  );
                });
              },
            ),
    );
  }
}
