import '../../utils/basic_screen_imports.dart';
import '/companion_customer/widgets/text_labels/title_heading5_widget.dart';
import 'back_button.dart';

// ignore: must_be_immutable
class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? leadingPadding;
  final String title;
  String subTitle;
  final bool isCenter;
  final bool alwaysShowBackButton;
  final VoidCallback? onTap;
  final List<Widget>? action;

  SecondaryAppBar(
    this.title, {
    Key? key,
    this.isCenter = false,
    this.alwaysShowBackButton = true,
    this.padding,
    this.onTap,
    this.action,
    this.leadingPadding,
    this.subTitle = '',
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      leading: alwaysShowBackButton == true
          ? Padding(
              padding: leadingPadding ?? EdgeInsets.zero,
              child: BackButtonWidget(onTap: onTap!),
            )
          : Container(),
      title: Padding(
        padding: padding ?? EdgeInsets.only(left: Dimensions.widthSize),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            verticalSpace(Dimensions.heightSize),
            TitleHeading2Widget(
              fontWeight: FontWeight.w600,
              text: title,
            ),
            TitleHeading5Widget(
              text: subTitle,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
      centerTitle: isCenter,
      elevation: 0,
      backgroundColor: CustomColor.primaryLightScaffoldBackgroundColor,
      automaticallyImplyLeading: false,
      actions: action,
    );
  }
}
