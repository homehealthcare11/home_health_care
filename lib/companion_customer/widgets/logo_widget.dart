import '../../companion_direct/utils/basic_screen_imports.dart';
import '/backend/local_storage/local_storage.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/logo/logo_without_bg.png",
      width: width,
      height: height,
    );
  }
}
