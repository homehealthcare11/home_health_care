import '../../controller/address/address_controller.dart';

import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_widget_imports.dart';
import '../../widgets/others/custom_image_widget.dart';

class SearchBoxWidget extends StatefulWidget {
  final String hintText;
  final bool readOnly;
  final void Function(String)? onFieldSubmitted;

  const SearchBoxWidget(
      {Key? key,
      required this.hintText,
      this.readOnly = false,
      this.onFieldSubmitted})
      : super(key: key);

  @override
  State<SearchBoxWidget> createState() => _PrimaryInputFieldState();
}

//enter your mtcn number text input field
// here is search Icon and a text field inside a card
class _PrimaryInputFieldState extends State<SearchBoxWidget> {
  FocusNode? focusNode;
  final secondaryColor = Get.isDarkMode
      ? CustomColor.secondaryDarkColor
      : CustomColor.secondaryLightColor;

  // final TrackYourTransactionController trackController =
  // TrackYourTransactionController();
  final AddressController controller = Get.put(AddressController());

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColor.whiteColor,
      surfaceTintColor: CustomColor.whiteColor,
      shadowColor: CustomColor.blackColor,
      elevation: focusNode!.hasFocus ? 10 : 0,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(Dimensions.paddingSize * 0.75),
            child: CustomImageWidget(
              height: Dimensions.heightSize * 2.1,
              width: Dimensions.widthSize * 2.1,
              path: Assets.icon.search,
              color: CustomColor.primaryLightTextColor.withOpacity(0.30),
            ),
          ),
          Expanded(
            child: TextFormField(
              readOnly: widget.readOnly,
              controller: controller.searchTextController,
              style: CustomStyle.lightHeading3TextStyle
                  .copyWith(fontSize: Dimensions.headingTextSize3),
              textAlign: TextAlign.left,
              onTap: () {
                setState(() {
                  focusNode!.requestFocus();
                });
              },
              onFieldSubmitted: widget.onFieldSubmitted,
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: Strings.searchHere.tr,
                hintStyle: Get.isDarkMode
                    ? CustomStyle.darkHeading3TextStyle.copyWith(
                        color:
                            CustomColor.primaryDarkTextColor.withOpacity(0.3),
                        fontWeight: FontWeight.normal,
                        fontSize: Dimensions.heightSize * 1.33,
                      )
                    : CustomStyle.lightHeading3TextStyle.copyWith(
                        color:
                            CustomColor.primaryLightTextColor.withOpacity(0.3),
                        fontWeight: FontWeight.normal,
                        fontSize: Dimensions.heightSize * 1.33,
                      ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                // icon: CustomImageWidget(path: Assets.icon.search),
                // labelText: widget.hintText,
                labelStyle: TextStyle(
                  color: focusNode!.hasFocus
                      ? CustomColor.primaryLightColor.withOpacity(0.2)
                      : Theme.of(context).primaryColor.withOpacity(0.1),
                  fontSize: Dimensions.headingTextSize3,
                  fontWeight: FontWeight.w500,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
