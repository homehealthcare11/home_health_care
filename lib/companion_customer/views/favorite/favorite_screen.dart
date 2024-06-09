import '../../views/favorite/favorite_screen_mobile_responsive.dart';

import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileScaffold: FavoriteScreenMobileResponsive(),
    );
  }
}
