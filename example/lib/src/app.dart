import 'package:example/src/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routes_manager/routes_manager.dart';
import 'modules.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final moduleAPages = moduleA.loadPages(_createPageParams);
    final moduleBPages = moduleB.loadPages();
    final transition = kIsWeb
        ? Transition.noTransition
        : GetPlatform.isIOS
            ? Transition.cupertino
            : Transition.leftToRight;
    return GetMaterialApp(
      translations: Intl(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      defaultTransition: transition,
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        ...moduleAPages,
        ...moduleBPages,
      ],
    );
  }

  CreateGetPageParams _createPageParams(RouteName route) {
    if (route == routeNameA) {
      return CreateGetPageParams();
    }
    return CreateGetPageParams();
  }
}
