
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sitterhub/backend/services/api_endpoint.dart';
import 'package:sitterhub/companion_customer/widgets/nanny_list/nanny_list_widget.dart';

import '../../companion_customer/controller/babby_sitter/baby_sitter_controller.dart';
import '../../companion_customer/routes/routes.dart';
import '../../companion_customer/widgets/appbar/custom_app_bar.dart';
import '../utils/basic_screen_imports.dart';
import '../widgets/no_data_found_widget.dart';

class CompanionsScreen extends StatefulWidget {
  const CompanionsScreen({super.key});

  @override
  State<CompanionsScreen> createState() => _CompanionsScreenState();
}

class _CompanionsScreenState extends State<CompanionsScreen> {
  final controller = Get.put(BabySitterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: CustomAppBar(
          "Companions",
          centerTitle: true,
          action: [
            InkWell(
              onTap: () {
                Get.offAllNamed(Routes.bottomNavBar);
              },
              child: Padding(
                padding: EdgeInsets.only(
                  right: Dimensions.paddingSize,
                ),
                child: const Icon(
                  Iconsax.home_25,
                  // fill: 10,
                  color: CustomColor.primaryLightColor,
                ),
              ),
            )
          ],
          onTap: () {
            Get.close(1);
          },
          padding: EdgeInsets.all(Dimensions.paddingSize),
          alwaysShowBackButton: true,
          leadingPadding: EdgeInsets.all(Dimensions.paddingSize * 0.4),
        ),
      ),
      body: _companionListWidget(context),
    );
  }

  // companion list
  _companionListWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      mainAxisAlignment: mainStart,
      children: [
        verticalSpace(Dimensions.heightSize * 1.333),
        controller.companionListModel.data.companions.isEmpty
            ? SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.6,
          child: RefreshIndicator(
            onRefresh: () async {
              controller.getNannyList('');
            },
            child: ListView(
              children: [
                verticalSpace(Dimensions.heightSize * 3),
                const NoDataFoundWidget(),
              ],
            ),
          ),
        )
            : SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: RefreshIndicator(
            onRefresh: () async {
              controller.getNannyList('');
            },
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,

              itemCount:
              controller.companionListModel.data.companions.length,
              // The number of items in the list
              itemBuilder: (BuildContext context, int index) {
                var dataImage = controller.companionListModel.data;
                final image =
                    '${ApiEndpoint.mainDomain}/${dataImage.imagePath}/';
                final defaultImage =
                    '${ApiEndpoint.mainDomain}/${dataImage.defaultImage}';
                return GestureDetector(
                  onTap: () {
                    controller.index = index;
                    controller.id = controller
                        .companionListModel.data.companions[index].id;
                    Get.toNamed(Routes.nannyScreen);
                    debugPrint(
                        "$image/${controller.companionListModel.data.companions[index].image}");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: NannyListWidget(
                      name:
                      "${controller.companionListModel.data.companions[index].firstname} ${controller.companionListModel.data.companions[index].lastname}",
                      text: controller.companionListModel.data
                          .companions[index].nannyProfession.professionType
                          .toString(),
                      value:
                      "${controller.companionListModel.data.companions[index].nannyProfession.amount} ${controller.companionListModel.data.companions[index].userRequests.isEmpty ? "OMR" : controller.companionListModel.data.companions[index].userRequests.first.currencyCode}",
                      image: controller.companionListModel.data
                          .companions[index].image ==
                          ''
                          ? defaultImage
                          : "$image/${controller.companionListModel.data.companions[index].image}",
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        // const (),
      ],
    );
  }
}
