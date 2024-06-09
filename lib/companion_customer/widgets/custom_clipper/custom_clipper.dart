import '../../controller/sign_in/sign_in_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../logo_widget.dart';

import 'custom_cliper_sign_up.dart';

class CustomClipPath extends StatelessWidget {
  CustomClipPath({Key? key}) : super(key: key);
  final controller = Get.put(SignInUserController());
  final formKey = GlobalKey<FormState>();
  final forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ScaffoldBgSignUpCustomClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3319,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/onboard/header.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
