import 'package:google_fonts/google_fonts.dart';

import '../../utils/basic_screen_imports.dart';
import '/companion_customer/language/language_controller.dart';
import 'back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? leadingPadding;
  final String title;
  final bool centerTitle;
  final bool alwaysShowBackButton;
  final VoidCallback? onTap;
  final List<Widget>? action;

  const CustomAppBar(
    this.title, {
    Key? key,
    this.centerTitle = true,
    this.alwaysShowBackButton = true,
    this.padding,
    this.onTap,
    this.action,
    this.leadingPadding,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    final languageController = Get.put(LanguageController());
    return AppBar(
      scrolledUnderElevation: 0,
      leading: alwaysShowBackButton == true
          ? Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: isTablet() ? 0 : Dimensions.paddingSize * 0.4),
              child: BackButtonWidget(onTap: onTap!),
            )
          : Container(),
      title: Padding(
        padding: isTablet()
            ? const EdgeInsets.only(right: 10)
            : padding ?? EdgeInsets.zero,
        child: Obx(() => Text(
              languageController.getTranslation(
                title,
              ),
              style: GoogleFonts.inter(
                color: CustomColor.primaryLightTextColor,
                fontSize: isTablet()
                    ? Dimensions.headingTextSize4
                    : Dimensions.headingTextSize2,
                fontWeight: FontWeight.w600,
              ),
            )),
      ),
      centerTitle: centerTitle,
      elevation: 0,
      backgroundColor: CustomColor.primaryLightScaffoldBackgroundColor,
      automaticallyImplyLeading: false,
      actions: action,
    );
  }
}
