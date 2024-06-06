import 'package:example/src/my_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routes_manager/routes_manager.dart';
import 'modules.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final moduleAPages = moduleA.loadPages(_createPageParams);
    final moduleBPages = moduleB.loadPages();
    final transition = kIsWeb
        ? Transition.fade
        : GetPlatform.isIOS
            ? Transition.cupertino
            : Transition.leftToRight;
    return GetMaterialApp(
      defaultTransition: transition,
      getPages: [
        GetPage(name: '/', page: () => const MyPage()),
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
