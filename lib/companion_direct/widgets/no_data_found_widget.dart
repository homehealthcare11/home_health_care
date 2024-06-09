import '../utils/basic_screen_imports.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TitleHeading3Widget(
        textAlign: TextAlign.center,
        text: Strings.noDataFound.tr,
        color: CustomColor.blackColor.withOpacity(0.4),
      ),
    );
  }
}
