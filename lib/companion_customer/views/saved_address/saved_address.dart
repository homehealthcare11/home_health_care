import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../views/saved_address/saved_address_mobile.dart';

class SavedAddress extends StatelessWidget {
  const SavedAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: SavedAddressMobileResponsive(),
    );
  }
}
