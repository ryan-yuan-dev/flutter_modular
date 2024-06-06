import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:routes_manager/routes_manager.dart';

class ModuleA extends BaseModule {
  const ModuleA({super.name = 'module_a', required super.isLoaded});

  @override
  List<RouteName> get supportedRoutes => [routeNameA, routeNameB];

  @override
  Widget generatePageWidget(RouteName route, CreateGetPageParams params) {
    switch (route) {
      case routeNameA:
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Text(route),
          ),
        );
      case routeNameB:
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
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
