import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'backend/utils/network_check/dependency_injection.dart';
import 'companion_customer/language/language_controller.dart';
import 'companion_customer/routes/routes.dart';
import 'companion_direct/language/english.dart';
import 'companion_direct/utils/theme.dart';

void main() async {
  // Locking Device Orientation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  InternetCheckDependencyInjection.init();

  // main app
  runApp(const MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (_, child) => GetMaterialApp(
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: Themes().theme,
        navigatorKey: Get.key,
        initialRoute: Routes.splashScreen,
        getPages: Routes.list,
        initialBinding: BindingsBuilder(
          () {
            Get.put(LanguageController(), permanent: true);
          },
        ),
        builder: (context, widget) {
          ScreenUtil.init(context);
          return Obx(() => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: Directionality(
                  textDirection: Get.find<LanguageController>().isLoading
                      ? TextDirection.ltr
                      : Get.find<LanguageController>().languageDirection,
                  child: widget!,
                ),
              ));
        },
      ),
    );
  }
}
