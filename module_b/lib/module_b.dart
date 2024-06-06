import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:routes_manager/routes_manager.dart';

class ModuleB extends ModuleInterface {
  const ModuleB({super.name = "module_b", required super.isLoaded});

  @override
  List<RouteName> get supportedRoutes => [
        routeNameC,
        routeNameD,
      ];

  @override
  Widget generatePageWidget(RouteName route, CreateGetPageParams params) {
    switch (route) {
      case routeNameC:
        return Scaffold(
          body: Center(
            child: Text(route),
          ),
        );
      case routeNameD:
        return Scaffold(
          body: Center(
            child: Text(route),
          ),
        );
      default:
        return Scaffold(
          body: Center(
            child: Text('$route not found, 404 error'),
          ),
        );
    }
  }
}
